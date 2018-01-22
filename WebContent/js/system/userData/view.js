var data
$(function(){
    $.ajax({
        type: "GET",
        url: "/Logistics/userData/data.shtml",
        success: function(json){
            data = json
        }
     });
});
data = JSON.parse(data)
console.log(typeof data)
var xdata = [],ydata = []
$.each(data,function(i,value){
    
    xdata.push(data[i].name)
    ydata.push(data[i].age)

    
    
})

var myChart1 = echarts.init(document.getElementById('main1'));


// 指定图表的配置项和数据
var option1 = {
    title: {
        text: '年龄统计'
    },
    tooltip: {},
    legend: {
        data:['年龄']
    },
    xAxis: {
        data: xdata
    },
    yAxis: {},
    series: [{
        name: '年龄',
        type: 'bar',
        data: ydata
    }]
};

// 使用刚指定的配置项和数据显示图表。
myChart1.setOption(option1);


var myChart2 = echarts.init(document.getElementById('main2'));

var pieData = [],pieObj

$.each(data,function(i,value){
    pieObj.name = data[i].name
    pieObj.value = data[i].age
    
    pieData.push(pieObj)
    
})

option2 = {
        backgroundColor: '#2c343c',

        title: {
            text: 'Customized Pie',
            left: 'center',
            top: 20,
            textStyle: {
                color: '#ccc'
            }
        },

        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },

        visualMap: {
            show: false,
            min: 80,
            max: 600,
            inRange: {
                colorLightness: [0, 1]
            }
        },
        series : [
            {
                name:'年龄',
                type:'pie',
                radius : '55%',
                center: ['50%', '50%'],
                data:[
                    {value:335, name:'直接访问'},
                    {value:310, name:'邮件营销'},
                    {value:274, name:'联盟广告'},
                    {value:235, name:'视频广告'},
                    {value:400, name:'搜索引擎'}
                ].sort(function (a, b) { return a.value - b.value; }),
                roseType: 'radius',
                label: {
                    normal: {
                        textStyle: {
                            color: 'rgba(255, 255, 255, 0.3)'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        lineStyle: {
                            color: 'rgba(255, 255, 255, 0.3)'
                        },
                        smooth: 0.2,
                        length: 10,
                        length2: 20
                    }
                },
                itemStyle: {
                    normal: {
                        color: '#c23531',
                        shadowBlur: 200,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                },

                animationType: 'scale',
                animationEasing: 'elasticOut',
                animationDelay: function (idx) {
                    return Math.random() * 200;
                }
            }
        ]
    };
//使用刚指定的配置项和数据显示图表。
myChart2.setOption(option2);

