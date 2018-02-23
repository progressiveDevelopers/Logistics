var myBarChart = echarts.init(document.getElementById('barMain'))
var myLineChart = echarts.init(document.getElementById('lineMain'))
var pieChart = echarts.init(document.getElementById('pieMain'))
var pieData = [], pieObj 
var data
var xdataBar = [], ydataBar = [],legendData = [],xdataLine = [], ydataLine = [],barColorList = []
var exitFlag = false

layui.use('form', function(){
    var form = layui.form;
    // 如果html代码是后来才加载的，那么需要加上render（）方法执行渲染
    form.render();
    
    form.on('select(month)', function(data){
        $('#monthDescription').text(data.elem.selectedOptions["0"].childNodes["0"].nodeValue)
        // 重置echarts中的参数
        pieData = [],xdataBar = [], ydataBar = [],legendData = [],xdataLine = [], ydataLine = [],barColorList = []
        targetMonthAvgScore(data.value)
        drawBar(data.value)
        drawPie(data.value)
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

// 柱状图
function drawBar(monthId) {
    if(monthId == null){
        monthId = $('#monthId').val()
    }
    
    $.ajax({
        type : "GET",
        url : "/Logistics/userInfo/rateInfoDataTargetMonth.shtml?userId="+$('#userId').val()+"&monthId="+monthId,
        success : function(data) {
            
            if( data == null || data == 'null' || data == '[]' || data.length == 0 ){
                layer.alert('本月评分数据还未完成。', {
                    icon: 0,
                    skin: 'layer-ext-moon'
                  })
                  $("#parentAvg").text("请稍后查看")
                  $("#parentAvgPercent").text('')
                  exitFlag = true
                  return
            }
            
            data = JSON.parse(data)
            var zeroCount = 0
            
            $.each(data, function(i, value) {
                var name =  String.fromCharCode(65+i)
                var score
                  if(data[i].ifLike == "1"){
                          barColorList.push("#49bf5d")
                  } else {
                      barColorList.push('#0d6fb8')
                  }
                
                score = data[i].score
                
                if(score == 0){
                    zeroCount++
                }
                
                xdataBar.push(name)
                ydataBar.push(score)
                
            })
            
            
            if(zeroCount != 0){
                layer.alert('还有'+zeroCount+'人没有评论，请稍后查看。', {
                    icon: 0,
                    skin: 'layer-ext-moon'
                  })
              
              $("#parentAvg").text("请稍后查看")
              $("#parentAvgPercent").text('')
              exitFlag = true
              return
            }
            
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
            myBarChart.setOption(option, true) 
        }
    })      
    
    
}

// 折现图
function drawLine() {
    
    if(exitFlag){
        return
    }
    
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
            
            myLineChart.setOption(option2, true)
        }
    })
    
}

// 饼状图
function drawPie(monthId){
    
    if(exitFlag){
        return
    }
    
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
            console.log(data)
            $('#avg').text(data)
            $('#avgPercent').text(accDiv(data,0.6).toFixed(1))
        }
    })
    
}

$(function() {
    //monthId 会自动匹配 id为 monthId 的元素
    drawBar(monthId.value)
     // 加载饼状图
    drawPie(monthId.value)
    // 加载折线图
    drawLine()
    
    
    // 得到平均数
    targetMonthAvgScore(monthId.value)
})
