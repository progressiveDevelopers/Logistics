var data
var xdata = [], ydata = []
var myChart = echarts.init(document.getElementById('main'));
var pieData = [], pieObj 


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


$(function() {
    var month = $('#month').val(),
        userid = $('#userId').val()
    $.ajax({
        type : "GET",
        url : "/Logistics/userInfo/rateInfoDataAllMonth.shtml?userId=9",
        success : function(data) {
            data = JSON.parse(data)
            var rateData
            for(i in data) {//i 就是键，data[i]就是值
                xdata.push(i);
                rateData = data[i];
                var score = [],avg = 0,sum = 0;
                console.log("-------------")
                rateData.forEach((item) => {
                    score.push(item.score)
                });
                score = score.sort();
                score.pop();  // 删除尾数
                score.shift(); // 删除第一个元素
                console.log("score====="+score);
                
                score.forEach(function (item, index, array) {
                    sum += item;
                });
                avg = accDiv(sum,score.length);
                ydata.push(avg);
                console.log("avg====="+avg);
            }
            
            
            // 指定图表的配置项和数据
            option = {
                title : {
                    text : '分数统计',
                    x:'center'
                },
                legend : {
                    data : [ '平均分' ]
                },
                xAxis : {
                    type : 'category',
                    data : xdata
                },
                yAxis : {
                    type : 'value'
                },
                grid : [// 指定坐标轴位置，大小
                {
                    x : '7%',
                    y : '7%',
                    width : '90%',
                    height : '31%'
                } ],
                series : [ {
                    name : '分数',
                    type : 'line',
                    data : ydata,
                    label:{ 
                        normal:{ 
                        show: true} 
                    },
                } ]
            };

        }
    });
    
    $.ajax({
        type : "GET",
        url : "/Logistics/userInfo/rateInfoDataTargetMonth.shtml?userId=9"+"&monthId=2",
        success : function(data) {
            data = JSON.parse(data)
            console.log(data);
            $.each(data, function(i, value) {
                pieObj = new Object()
                pieObj.name =  String.fromCharCode(65+i);
                if(data[i].ifLike == "1"){
                    pieObj.name+="*"
                }
                pieObj.value = data[i].score
                console.log(pieObj)
                pieData.push(pieObj)
                console.log(pieData.length);
            })

//            var pie = {
//                name : '分数',
//                type : 'pie',
//                radius : '55%',
//                center : [ '18%', '75%' ],// 位置确定：左下角
//                data :pieData,
//                roseType : 'radius',
//                label : {
//                    textStyle : {
//                        color : 'rgba(30,144,255,0.8)',
//                        align : 'center',
//                        baseline : 'middle',
//                        fontSize : 30,
//                        fontWeight : 'bolder'
//                },
//                normal: {
//                    show: true,
//                    formatter: '{c}({d}%)'
//                }
//                },
//                labelLine : {
//                    length : 40,
//                    lineStyle : {
//                        color : '#f0f',
//                        width : 3,
//                        type : 'dotted'
//                    }
//                },
//                itemStyle : {
//                    normal : {
//                        color : '#c23531',
//                        shadowBlur : 200,
//                        shadowColor : 'rgba(0, 0, 0, 0.5)'
//                    }
//                },
//
//                animationType : 'scale',
//                animationEasing : 'elasticOut',
//                animationDelay : function(idx) {
//                    return Math.random() * 200;
//                }
//            }

            
            var pie= {
                        name: '分数',
                        type: 'pie',
                        radius : '55%',
                        center : [ '50%', '75%' ],// 位置确定：左下角
                        data:pieData,
                        label : {
                        textStyle : {
                              color : 'rgba(30,144,255,0.8)',
                              align : 'center',
                              baseline : 'middle',
                              fontSize : 30,
                              fontWeight : 'bolder'
                          },
                          normal: {
                              show: true,
                              formatter: '{b}:{c}({d}%)'
                          }
                          },
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 10,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        },
                      animationType : 'scale',
                      animationEasing : 'elasticOut',
                      animationDelay : function(idx) {
                          return Math.random() * 200;
                      }
                       
                    }
                
            
            option.series.push(pie)

            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        }
    });
    
});
layui.use('form', function(){
    var form = layui.form;
    // 如果html代码是后来才加载的，那么需要加上render（）方法执行渲染
    form.render();
  });