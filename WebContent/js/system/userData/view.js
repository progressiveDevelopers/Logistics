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



var myChart = echarts.init(document.getElementById('main'));

// 指定图表的配置项和数据
var option = {
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
myChart.setOption(option);



