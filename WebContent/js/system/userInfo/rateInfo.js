var rateInfo = $('#rateInfo').html() // 将评分提示信息备份下来
var barChart = null // 柱状图
    ,pieChart  = null // 饼状图
    ,lineChart = null // 折线图
var pieData = [], pieObj 
var data
var xdataBar = [], ydataBar = [],legendData = [],xdataLine = [], ydataLine = [],barColorList = []

layui.use('form', function(){
    var form = layui.form;
    // 如果html代码是后来才加载的，那么需要加上render()方法执行渲染
    form.render();
    
    form.on('select(month)', function(data){
        $('#monthDescription').text(data.elem.selectedOptions["0"].childNodes["0"].nodeValue)
        // 开始渲染echarts
        drawEcharts(data.value)
        
    });
});

/** 
 * 除法函数，用来得到精确的除法结果
 * 说明：javascript的除法结果会有误差，在两个浮点数相除的时候会比较明显。这个函数返回较为精确的除法结果。
 * 调用：accDiv(arg1,arg2)
 * 返回值：arg1除以arg2的精确结果
 */
function accDiv(arg1, arg2) {
    var t1 = 0, t2 = 0, r1, r2
    try {
        t1 = arg1.toString().split(".")[1].length
    }
    catch (e) {
    }
    try {
        t2 = arg2.toString().split(".")[1].length
    }
    catch (e) {
    }
    with (Math) {
        r1 = Number(arg1.toString().replace(".", ""))
        r2 = Number(arg2.toString().replace(".", ""))
        return (r1 / r2) * pow(10, t2 - t1)
    }
}

// 当月评分是否完成
function isComplete(monthId){
    var result;
    $.ajax({
        type: "POST",
        url: '/Logistics/check/rateProgress.shtml?operationPostId='+$('#userId').val()+'&monthId='+monthId,
        async: false,// 让ajax进行同步请求
        success: function(data){
            
            if(+data < 10){
                layer.alert('还有'+(10 - data)+'人未完成评分', {
                    icon: 0,
                    skin: 'layer-ext-moon'
                  })
                  $("#parentAvg").text("请稍后查看")
                  $("#parentAvgPercent").text('')
                  result = false
            } else {
                result = true
            }
        }
     })
    
    return result;
}


// 柱状图
function drawBar(monthId) {
    
    $.ajax({
        type : "GET",
        url : "/Logistics/userInfo/rateInfoDataTargetMonth.shtml?userId="+$('#userId').val()+"&monthId="+monthId,
        success : function(data) {
            
            data = JSON.parse(data)
            
            $.each(data, function(i, value) {
                var name =  String.fromCharCode(65+i)
                var score
                  if(data[i].ifLike == "1"){
                          barColorList.push("#49bf5d")
                  } else {
                      barColorList.push('#0d6fb8')
                  }
                
                score = data[i].score
                
                xdataBar.push(name)
                ydataBar.push(score)
                
            })
            
            var option = {
                    tooltip: {
                        show: true
                    },
                    legend: {
                        data: ['总分']
                    },
                    xAxis: [{
                        type: 'category',
                        data: xdataBar
                    }],
                    yAxis: [{
                        type: 'value',
                        max: 60
                    }],
                    series: [{
                        "name": "总分",
                        "type": "bar",
                        "data": ydataBar,
                        label:{ 
                            normal:{ 
                            show: true, 
                            position: 'inside'} 
                            },
                            itemStyle:{
                                normal:{
                                    color:function(params){
                                        return barColorList[params.dataIndex]
                                    }
                                }
                            }
                    }]
                }
            
                
            // 当setOption第二个参数为true时，会阻止数据合并
            barChart.setOption(option, true) 
        }
    })      
    
    
}

// 折线图
function drawLine() {
    $.ajax({
        type : "GET",
        url : "/Logistics/userInfo/rateInfoForLine.shtml?userId="+$('#userId').val(),
        success : function(data) {
            data = JSON.parse(data)
            for(i in data) {//i 就是键，data[i]就是值
                xdataLine.push(data[i].month)
                ydataLine.push(data[i].allscore)
            }
            
            // 指定图表的配置项和数据
            option2 = {
                title : {
                    text : '分数统计',
                    x:'center'
                },
                legend : {
                    data : [ '平均分' ]
                },
                xAxis : {
                    type : 'category',
                    data : xdataLine
                },
                yAxis : {
                    type : 'value',
                    max: 60
                },
                series : [ {
                    name : '分数',
                    type : 'line',
                    data : ydataLine,
                    label:{ 
                        normal:{ 
                        show: true} 
                    },
                  markLine : {
                      data : [ {
                          type : 'average',
                          name : '平均值'
                      } ]
                  }
                } ]
            }
            
            lineChart.setOption(option2, true)
        }
    })
    
}

// 饼状图
function drawPie(monthId){
    
    $.ajax({
        type : "GET",
        url : "/Logistics/userInfo/getUserRate.shtml?userId="+$('#userId').val()+"&monthId="+monthId,
        success : function(data) {
            data = JSON.parse(data)
            for (var key in data) { // 遍历Array  
                pieObj = new Object()
                pieObj.name = key
                legendData.push(key)
                pieObj.value = data[key].toFixed(1)// 保留一位小数
                pieData.push(pieObj)
            }  
            
            option3 = {
                title : {
                    text: '各评分项平均分',
                    x:'center'
                },
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: legendData
                },
                series : [
                    {
                        name: '评分项',
                        type: 'pie',
                        radius : '55%',
                        center: ['50%', '50%'],
                        data:pieData,
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        },
                        itemStyle:{ 
                            normal:{ 
                                  label:{ 
                                    show: true, 
                                    formatter: '{b} : {c} ({d}%)' 
                                  }, 
                                  labelLine :{show:true} 
                                } 
                            }
                    }
                ]
            }

            pieChart.setOption(option3, true)
            
        }
    })
    
}

// 指定月份的平均分
function targetMonthAvgScore(monthId){
    
    $.ajax({
        type : "GET",
        url : "/Logistics/userInfo/targetMonthAvgScore.shtml?userId="+$('#userId').val()+"&monthId="+monthId,
        success : function(data) {
            $('#avg').text(data)
            $('#avgPercent').text(accDiv(data,0.6).toFixed(1))
        }
    })
    
}

//开始渲染echarts
function drawEcharts(monthId){
 // 重置echarts中的参数
    pieData = [],xdataBar = [], ydataBar = [],legendData = [],xdataLine = [], ydataLine = [],barColorList = []
    if(isComplete(monthId)){
        $('#rateInfo').html(rateInfo)
        if(barChart == null || pieChart == null || lineChart == null){
            barChart = echarts.init(document.getElementById('barMain'))  
            pieChart = echarts.init(document.getElementById('pieMain'))
            lineChart = echarts.init(document.getElementById('lineMain'))
        }
        // 加载柱状图
        drawBar(monthId)
        // 加载饼状图
        drawPie(monthId)
        // 加载折线图
        drawLine()
        // 得到平均数
        targetMonthAvgScore(monthId)
    } else {
        // 销毁echarts
        barChart.dispose()
        barChart = null
        pieChart.dispose()
        pieChart = null
        lineChart.dispose()
        lineChart = null
    }
}

$(function() {
    //monthId 会自动匹配 id为 monthId 的元素
    drawEcharts(monthId.value)
})
