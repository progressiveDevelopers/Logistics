var myBarChart = echarts.init(document.getElementById('barMain'));
var myLineChart = echarts.init(document.getElementById('lineMain'));
var pieChart = echarts.init(document.getElementById('pieMain'));
var pieData = [], pieObj 
var data
var xdataBar = [], ydataBar = [],legendData = [],xdataLine = [], ydataLine = [],barColorList = []
var exitFlag = false;
/** 
 ** 除法函数，用来得到精确的除法结果
 ** 说明：javascript的除法结果会有误差，在两个浮点数相除的时候会比较明显。这个函数返回较为精确的除法结果。
 ** 调用：accDiv(arg1,arg2)
 ** 返回值：arg1除以arg2的精确结果
 **/
function accDiv(arg1, arg2) {
    var t1 = 0, t2 = 0, r1, r2;
    try {
        t1 = arg1.toString().split(".")[1].length;
    }
    catch (e) {
    }
    try {
        t2 = arg2.toString().split(".")[1].length;
    }
    catch (e) {
    }
    with (Math) {
        r1 = Number(arg1.toString().replace(".", ""));
        r2 = Number(arg2.toString().replace(".", ""));
        return (r1 / r2) * pow(10, t2 - t1);
    }
}


function drawBar() {
    $.ajax({
        type : "GET",
        url : "/Logistics/userInfo/rateInfoDataTargetMonth.shtml?userId="+$('#userId').val()+"&monthId="+$('#monthId').val(),
        success : function(data) {
            data = JSON.parse(data)
            if(data.length < 10){
                exitFlag = true;
                return;
            }
            
            $.each(data, function(i, value) {
                
                var name =  data[i].evaluator
                    if(data[i].ifLike == "1"){
                        barColorList.push("#49bf5d");
                    } else {
                        barColorList.push('#0d6fb8');
                    }
                
                xdataBar.push(name)
                ydataBar.push(data[i].score)
                
                
            })
            
//            var option= {
//                        name: '分数',
//                        type: 'bar',
//                        radius : '55%',
//                        center : [ '50%', '75%' ],// 位置确定：左下角
//                        data:pieData,
//                        label : {
//                        textStyle : {
//                              color : 'rgba(30,144,255,0.8)',
//                              align : 'center',
//                              baseline : 'middle',
//                              fontSize : 30,
//                              fontWeight : 'bolder'
//                          },
//                          normal: {
//                              show: true,
//                              formatter: '{b}:{c}({d}%)'
//                          }
//                          },
//                        itemStyle: {
//                            emphasis: {
//                                shadowBlur: 10,
//                                shadowOffsetX: 10,
//                                shadowColor: 'rgba(0, 0, 0, 0.5)'
//                            }
//                        },
//                      animationType : 'scale',
//                      animationEasing : 'elasticOut',
//                      animationDelay : function(idx) {
//                          return Math.random() * 200;
//                      }
//                       
//                    }
            
            var option = {
                    tooltip: {
                        show: true
                    },
                    xAxis: [{
                        type: 'category',
                        data: xdataBar
                    }],
                    yAxis: [{
                        type: 'value'
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
                };
            
                
            // 当setOption第二个参数为true时，会阻止数据合并
            myBarChart.setOption(option, true); 
        }
    });      
    
    
}

function drawLine() {
    
    if(exitFlag){
        return;
    }
    
    $.ajax({
        type : "GET",
        url : "/Logistics/userInfo/rateInfoDataAllMonth.shtml?userId="+$('#userId').val(),
        success : function(data) {
            data = JSON.parse(data)
            var rateData
            for(i in data) {//i 就是键，data[i]就是值
                xdataLine.push(i);
                rateData = data[i];
                var score = [],avg = 0,sum = 0;
                rateData.forEach((item) => {
                    score.push(item.score)
                });
                score = score.sort();
                score.pop();  // 删除尾数
                score.shift(); // 删除第一个元素
                
                score.forEach(function (item, index, array) {
                    sum += item;
                });
                avg = accDiv(sum,score.length).toFixed(1);
                $("#avg").text(avg)
                $("#avgPercent").text(accDiv(avg,0.6).toFixed(1))
                ydataLine.push(avg);
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
                    type : 'value'
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
            };
            
            myLineChart.setOption(option2, true);
        }
    });
    
//    var option2 = {
//        title : {
//            text : '未来一周气温变化',
//            subtext : '纯属虚构'
//        },
//        tooltip : {
//            trigger : 'axis'
//        },
//        legend : {
//            data : [ '最高气温', '最低气温' ]
//        },
//        toolbox : {
//            show : true,
//            feature : {
//                mark : {
//                    show : true
//                },
//                dataView : {
//                    show : true,
//                    readOnly : false
//                },
//                magicType : {
//                    show : true,
//                    type : [ 'line', 'bar' ]
//                },
//                restore : {
//                    show : true
//                },
//                saveAsImage : {
//                    show : true
//                }
//            }
//        },
//        calculable : true,
//        xAxis : [ {
//            type : 'category',
//            boundaryGap : false,
//            data : [ '周一', '周二', '周三', '周四', '周五', '周六', '周日' ]
//        } ],
//        yAxis : [ {
//            type : 'value',
//            axisLabel : {
//                formatter : '{value} °C'
//            }
//        } ],
//        series : [ {
//            name : '最高气温',
//            type : 'line',
//            data : [ 11, 11, 15, 13, 12, 13, 10 ],
//            markPoint : {
//                data : [ {
//                    type : 'max',
//                    name : '最大值'
//                }, {
//                    type : 'min',
//                    name : '最小值'
//                } ]
//            },
//            markLine : {
//                data : [ {
//                    type : 'average',
//                    name : '平均值'
//                } ]
//            }
//        }, {
//            name : '最低气温',
//            type : 'line',
//            data : [ 1, -2, 2, 5, 3, 2, 0 ],
//            markPoint : {
//                data : [ {
//                    name : '周最低',
//                    value : -2,
//                    xAxis : 1,
//                    yAxis : -1.5
//                } ]
//            },
//            markLine : {
//                data : [ {
//                    type : 'average',
//                    name : '平均值'
//                } ]
//            }
//        } ]
//    };
    
}

function drawPie(){
    
    if(exitFlag){
        return;
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
            };

            pieChart.setOption(option3, true);
            
        }
    });
    
}

$(function() {
    drawBar()
    drawLine()
    drawPie()
})
