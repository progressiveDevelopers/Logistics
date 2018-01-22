var data
var xdata = [], ydata = []
var myChart = echarts.init(document.getElementById('main'));
var pieData = [], pieObj 

$(function() {
    $.ajax({
        type : "GET",
        url : "/Logistics/userData/data.shtml",
        success : function(data) {
            data = JSON.parse(data)
            $.each(data, function(i, value) {
                xdata.push(data[i].name)
                ydata.push(data[i].age)
                pieObj = new Object()
                pieObj.name = data[i].name
                pieObj.value = data[i].age
                console.log(pieObj)
                pieData.push(pieObj)
                console.log(pieData.length);
            })
            // 指定图表的配置项和数据
            option = {
                title : {
                    text : '年龄统计'
                },
                legend : {
                    data : [ '年龄' ]
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
                    name : '年龄',
                    type : 'bar',
                    data : ydata
                } ]
            };

            var pie = {
                name : '年龄',
                type : 'pie',
                radius : '55%',
                center : [ '18%', '75%' ],// 位置确定：左下角
                data :pieData,
                roseType : 'radius',
                label : {
                    normal : {
                        textStyle : {
                            color : 'rgba(255, 255, 255, 0.3)'
                        }
                    }
                },
                labelLine : {
                    normal : {
                        lineStyle : {
                            color : 'rgba(255, 255, 255, 0.3)'
                        },
                        smooth : 0.2,
                        length : 10,
                        length2 : 20
                    }
                },
                itemStyle : {
                    normal : {
                        color : '#c23531',
                        shadowBlur : 200,
                        shadowColor : 'rgba(0, 0, 0, 0.5)'
                    }
                },

                animationType : 'scale',
                animationEasing : 'elasticOut',
                animationDelay : function(idx) {
                    return Math.random() * 200;
                }
            }

            // option = {
            // xAxis : {
            // type : 'category',
            // data : [ 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun' ]
            // },
            // yAxis : {
            // type : 'value'
            // },
            // grid : [// 指定坐标轴位置，大小
            // {
            // x : '7%',
            // y : '7%',
            // width : '100%',
            // height : '31%'
            // } ],
            // series : [ {
            // data : [ 120, 200, 150, 80, 70, 110, 130 ],
            // type : 'bar'
            // }, {
            // name : '年龄',
            // type : 'pie',
            // radius : '55%',
            // center : [ '18%', '75%' ],// 位置确定：左下角
            // data : [ {
            // value : 335,
            // name : '直接访问'
            // }, {
            // value : 310,
            // name : '邮件营销'
            // }, {
            // value : 274,
            // name : '联盟广告'
            // }, {
            // value : 235,
            // name : '视频广告'
            // }, {
            // value : 400,
            // name : '搜索引擎'
            // } ].sort(function(a, b) {
            // return a.value - b.value;
            // }),
            // roseType : 'radius',
            // label : {
            // normal : {
            // textStyle : {
            // color : 'rgba(255, 255, 255, 0.3)'
            // }
            // }
            // },
            // labelLine : {
            // normal : {
            // lineStyle : {
            // color : 'rgba(255, 255, 255, 0.3)'
            // },
            // smooth : 0.2,
            // length : 10,
            // length2 : 20
            // }
            // },
            // itemStyle : {
            // normal : {
            // color : '#c23531',
            // shadowBlur : 200,
            // shadowColor : 'rgba(0, 0, 0, 0.5)'
            // }
            // },
            //
            // animationType : 'scale',
            // animationEasing : 'elasticOut',
            // animationDelay : function(idx) {
            // return Math.random() * 200;
            // }
            // } ]
            // }

             option.series.push(pie)

            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        }
    });
});
