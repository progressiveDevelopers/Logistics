var myBarChart = echarts.init(document.getElementById('barMain'))
var myLineChart = echarts.init(document.getElementById('lineMain'))
var pieChart = echarts.init(document.getElementById('pieMain'))
var pieData = [], pieObj 
var data
var xdataBar = [], ydataBar = [],legendData = [],xdataLine = [], ydataLine = [],barColorList = []
var exitFlag = false
/** 
 ** 除法函数，用来得到精确的除法结果
 ** 说明：javascript的除法结果会有误差，在两个浮点数相除的时候会比较明显。这个函数返回较为精确的除法结果。
 ** 调用：accDiv(arg1,arg2)
 ** 返回值：arg1除以arg2的精确结果
 **/
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


function drawBar() {
    $.ajax({
        type : "GET",
        url : "/Logistics/userInfo/rateInfoDataTargetMonth.shtml?userId="+$('#userId').val()+"&monthId="+$('#monthId').val(),
        success : function(data) {
            console.log(1)
            if(data.length == 0 || data == null || data == 'null' || data == "[]"){
                layer.alert('本月评分数据还未生成。', {
                    icon: 0,
                    skin: 'layer-ext-moon',
                    yes: function(index, layero){
                        var index = parent.layer.getFrameIndex(window.name) //先得到当前iframe层的索引
                        parent.layer.close(index) //再执行关闭  
                    },
                    end: function () {
                        var index = parent.layer.getFrameIndex(window.name) //先得到当前iframe层的索引
                        parent.layer.close(index) //再执行关闭  
                    }
                  })
                  exitFlag = true
                  return
            }
            
            data = JSON.parse(data)
            var zeroCount = 0
            var msg = ''
            
            
            $.each(data, function(i, value) {
                
                var name =  data[i].evaluator
                    if(data[i].ifLike == "1"){
                        barColorList.push("#49bf5d")
                    } else {
                        barColorList.push('#0d6fb8')
                    }
                
                score = data[i].score
                
                if(score == 0){
                    msg+=name+","
                    zeroCount++
                }
                
                xdataBar.push(name)
                ydataBar.push(score)
                
                
            })
            
            if(zeroCount != 0){
                msg=msg.substring(0, msg.length-1)
                layer.alert('还有'+zeroCount+'人未评分，他们是'+msg+"。", {
                    icon: 0,
                    skin: 'layer-ext-moon',
                    yes: function(index, layero){
                        var index = parent.layer.getFrameIndex(window.name) //先得到当前iframe层的索引
                        parent.layer.close(index) //再执行关闭  
                    },
                    end: function () {
                        var index = parent.layer.getFrameIndex(window.name) //先得到当前iframe层的索引
                        parent.layer.close(index) //再执行关闭  
                    }
                  })
              
              exitFlag = true
              return
            }
            
            // 加载饼状图
            drawPie()
            // 加载折线图
            drawLine()
            
            var option = {
                    tooltip: {
                        show: true
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

function drawLine() {
    
    if(exitFlag){
        return
    }
    
    $.ajax({
        type : "GET",
        url : "/Logistics/userInfo/rateInfoDataAllMonth.shtml?userId="+$('#userId').val(),
        success : function(data) {
            data = JSON.parse(data)
            var rateData
            for(i in data) {//i 就是键，data[i]就是值
                xdataLine.push(i)
                rateData = data[i]
                var score = [],avg = 0,sum = 0
                rateData.forEach((item) => {
                    score.push(item.score)
                })
                score = score.sort()
                score.pop()  // 删除尾数
                score.shift() // 删除第一个元素
                
                score.forEach(function (item, index, array) {
                    sum += item
                })
                avg = accDiv(sum,score.length).toFixed(1)
                $("#avg").text(avg)
                $("#avgPercent").text(accDiv(avg,0.6).toFixed(1))
                ydataLine.push(avg)
            }
            
            
            
            
            // 指定图表的配置项和数据
            option2 = {
                title : {
                    text : '分数统计1111',
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

function drawPie(){
    
    if(exitFlag){
        return
    }
    
    $.ajax({
        type : "GET",
        url : "/Logistics/userInfo/getUserRate.shtml?userId="+$('#userId').val()+"&monthId="+$('#monthId').val(),
        success : function(data) {
            data = JSON.parse(data)
            
            for (var key in data) { // 遍历Array  
                pieObj = new Object()
                pieObj.name = key
                legendData.push(key)
                pieObj.value = data[key].toFixed(1)// 保留两位小数
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

$(function() {
    drawBar()
})
