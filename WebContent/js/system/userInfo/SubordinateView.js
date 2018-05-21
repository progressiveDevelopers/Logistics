var form = null;
var month = $('#beginMonth').val()
layui.use([ 'laypage', 'layer', 'table','form','element'], function(){
  var table = layui.table //表格
  form = layui.form
  var element = layui.element;
  
  var tableOpt = null;
  
  if(mobile){
      tableOpt = {
              elem: '#subordinateTbl'
              ,url: '/Logistics/userInfo/subordinateRate.shtml?monthId='+$('#monthId').val() //数据接口
              ,cols: [[ //表头
                 {type: 'numbers',  title: '序号' , fixed: 'left'}
                ,{field: 'userName', title: '姓名',  sort: true}
                ,{field: 'allscore',title: '平均分/进度' , align:'center', event: 'setSign' ,sort: true,templet: function(d){
                    if(d.allscore == undefined || d.allscore == null || d.allscore == ''){
                        
                        var complete; // 已经完成的人数
                        var sum; // 应该对其评分的人数
                        $.ajax({
                            type: "POST",
                            url: '/Logistics/check/rateProgress.shtml?operationPostId='+d.userId+'&monthId='+$('#monthId').val(),
                            async: false,// 让ajax进行同步请求
                            success: function(data){
                                data = JSON.parse(data)
                                complete = data.complete;
                                sum = data.sum;
                            }
                         })
                        
                        return "<div class='progressHover'><span class='operationPostId' style='display:none;'>"+d.userId+"</span><div class='layui-progress layui-progress-big' lay-showPercent='true'>"+
                        "<div class='layui-progress-bar layui-bg-blue' lay-percent='"+complete+"/"+sum+"'></div>"+
                        "</div></div>"
                    } else {
                        return '<span style="font-weight:bold;" >'+d.allscore+'</span>'
                    }
                }}
                ,{width: 165, align:'center', toolbar: '#barDemo'}
                ,
              ]],
              done: function(res, curr, count){ // table渲染结束回调
                      element.render(); // 渲染进度条
                      progressHover();
                   }
            };
  } else {
      tableOpt = {
              elem: '#subordinateTbl'
              ,url: '/Logistics/userInfo/subordinateRate.shtml?monthId='+$('#monthId').val() //数据接口
              ,cols: [[ //表头
                 {type: 'numbers',  title: '序号' , fixed: 'left'}
                ,{field: 'userName', title: '姓名',  sort: true}
                ,{field: 'allscore',title: '平均分/进度' , align:'center', event: 'setSign' ,sort: true,templet: function(d){
                    if(d.allscore == undefined || d.allscore == null || d.allscore == ''){
                        
                        var complete; // 已经完成的人数
                        var sum; // 应该对其评分的人数
                        $.ajax({
                            type: "POST",
                            url: '/Logistics/check/rateProgress.shtml?operationPostId='+d.userId+'&monthId='+$('#monthId').val(),
                            async: false,// 让ajax进行同步请求
                            success: function(data){
                                data = JSON.parse(data)
                                complete = data.complete;
                                sum = data.sum;
                            }
                         })
                        
                        return "<div class='progressHover'><span class='operationPostId' style='display:none;'>"+d.userId+"</span><div class='layui-progress layui-progress-big' lay-showPercent='true'>"+
                        "<div class='layui-progress-bar layui-bg-blue' lay-percent='"+complete+"/"+sum+"'></div>"+
                        "</div></div>"
                    } else {
                        return '<span style="font-weight:bold;" >'+d.allscore+'</span>'
                    }
                }}
                ,{width: 165, align:'center', toolbar: '#barDemo'}
                ,
              ]],
              done: function(res, curr, count){ // table渲染结束回调
                      element.render(); // 渲染进度条
                      progressHover();
                   }
            };
  }
  
  //给进度条所在的单元格添加悬浮事件
  function progressHover(){
      $('.progressHover').parent().hover(
          function () {
              var obj = this;
              layer.tips('正在查询请稍等。。。', obj, {
                  tips: [1, '#78BA32'], // 绿色
                  time: 1000
                });
              // 设置定时，并不是悬浮上去就执行查询操作
              timer=setTimeout(function(){
                  var userId = $(obj).find(".operationPostId").text()
                  $.ajax({
                      type: "POST",
                      url: '/Logistics/check/notRatePeople.shtml?operationPostId='+userId+'&monthId='+$('#monthId').val(),
                      success: function(data){
                          var msg = "";
                          data = JSON.parse(data)
                          $.each(data,function(i, v){
                              msg += v+","
                          })
                          msg=msg.substring(0, msg.length-1)
                          layer.tips(msg+'还未评分', obj, {
                              tips: [1, '#78BA32'], // 绿色
                              time: 12000 //显示12s
                            })
                      }
                   })
              },1000);
          },
          function () {
              // 当鼠标移除时清除定时任务
              if(timer) {
                  clearTimeout(timer)
              }
          }
      )
     // 悬浮事件 end
     // 详情按钮禁用
     // 根据进度条找到当前行的查看详情按钮
     var aobj = $('.progressHover').parent().parent().next().find('a')
     // 添加禁用样式
     aobj.addClass("layui-btn-disabled")
     // 移除事件绑定
     aobj.removeAttr("lay-event")
      
  }
  
  // 渲染 table
  table.render(tableOpt)
  
  //渲染form元素,如果html代码是后来才加载的，那么需要加上render（）方法执行渲染
  form.render()
  
  //监听工具条
  table.on('tool(layuiTable)', function(rowData){ 
      var data = rowData.data //获得当前行数据
    ,layEvent = rowData.event; //获得 lay-event 对应的值
    if(layEvent === 'detail'){
        //弹出层iframe窗
        var month = $('#month').val()
        var userId = data.userId
        var name = data.userName
        layer.open({
            type: 2,
            title: '评分详情',
            shadeClose: true,
            shade: false ,
            maxmin: true, //开启最大化最小化按钮
            area: ['100%', '100%'],
            content: '/Logistics/userInfo/rateInfoMge.shtml?userId='
                +userId+"&userName="+name+"&monthId="+$('#monthId').val()
          });
    }
  });
  
  
  //注：layuiTable是table原始容器的属性 lay-filter="对应的值"
  //表格排序事件
  table.on('sort(layuiTable)', function(obj){
      // table 按列排序之后重新渲染进度条
      element.render();
      progressHover();
    });
  
  // 下拉框change事件
  form.on('select(month)', function(data){
      tableOpt.url =  '/Logistics/userInfo/subordinateRate.shtml?monthId='+ data.value
      $('#monthId').val(data.value)
      $('#monthDescription').text(data.elem.selectedOptions["0"].childNodes["0"].nodeValue)
      $('#search').attr('href',"javascript:grid.exportData('"+"/userInfo/export.shtml?monthId=" + data.value+"')")
      table.render(tableOpt);
      month = data.value
  });
  
});

$('#exportExcel').click(function(){
    var url,beginMonth,endMonth
    layer.open({
        type: 1
        ,title:"请选择日期区间"
        ,closeBtn: false
        ,area: ['500px', '350px']
        ,shade: 0.8
        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
        ,btn: ['导出excel', '取消']
        ,btnAlign: 'c'
        ,moveType: 1 //拖拽模式，0或者1
        ,content: $('#exportArea').html()
        ,success: function(layero){ // 弹窗的内容
            beginMonth = layero.find('#beginMonth')
            endMonth = layero.find('#endMonth')
            // 指定下拉框的值
            beginMonth.val(month)
            endMonth.val(month)
            // 选中指定值
            form.render('select');
        }
        ,yes:function(index){
            url = '/userInfo/export.shtml?beginMonth='+beginMonth.val()+'&endMonth='+endMonth.val()
            grid.exportData(url)
            layer.close(index);
        }
        
      });
})

