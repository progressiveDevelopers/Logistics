layui.use([ 'laypage', 'layer', 'table', 'carousel', 'upload', 'element'], function(){
  var table = layui.table //表格
  
  //执行一个 table 实例
  table.render({
    elem: '#subordinateTbl'
    ,url: '/Logistics/userInfo/subordinateRate.shtml' //数据接口
    ,cols: [[ //表头
      {field: 'userId', title: 'ID',  sort: true, fixed: 'left'}
      ,{field: 'userName', title: '姓名',  sort: true}
      ,{field: 'userDescription', title: '岗位'}
      ,{width: 165, align:'center', toolbar: '#barDemo'}
    ]]
  });
  
  //监听工具条
  table.on('tool(layuiTable)', function(rowData){ 
    var data = rowData.data //获得当前行数据
    ,layEvent = rowData.event; //获得 lay-event 对应的值
    if(layEvent === 'detail'){
        //弹出层iframe窗
        var month = $('#month').val();
        var targetid = data.userId;
        layer.open({
            type: 2,
            title: '评分详情',
            shadeClose: true,
            shade: false ,
            maxmin: true, //开启最大化最小化按钮
            area: ['893px', '600px'],
            content: '//fly.layui.com/'
          });
//        layer.open({
//          type: 2,
//          title: false,
//          closeBtn: 0, //不显示关闭按钮
//          shade: [0],
//          area: ['340px', '215px'],
//          time: 2000, //2秒后自动关闭
//          anim: 2,
//          content: ['test/guodu.html'], //iframe的url，no代表不显示滚动条
//          end: function(){ //此处用于演示
//            
//          }
//        });
        
        //弹出层 end
    } 
  });
  
});

/*var data
var xdata = [], ydata = []
var myChart = echarts.init(document.getElementById('main'));
var pieData = [], pieObj 

$(function() {
    $.ajax({
        type : "GET",
        url : "/Logistics/userInfo/data.shtml",
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

           

             option.series.push(pie)

            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        }
    });
});
*/