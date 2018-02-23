layui.use([ 'laypage', 'layer', 'table','form','element'], function(){
  var table = layui.table //表格
  var form = layui.form
  var element = layui.element;
  
  //执行一个 table 实例
  
  var tableOpt = {
          elem: '#subordinateTbl'
          ,url: '/Logistics/userInfo/subordinateRate.shtml?monthId='+$('#monthId').val() //数据接口
          ,cols: [[ //表头
             {type: 'numbers',  title: '序号' , width: "10%", fixed: 'left'}
            ,{field: 'userName', title: '姓名',  sort: true}
            ,{field: 'userDescription', title: '团队/岗位',sort: true}
            ,{field: 'allscore',title: '平均分/进度' , align:'center', event: 'setSign' ,sort: true,templet: function(d){
                if(d.allscore == undefined || d.allscore == null || d.allscore == ''){
                    
                    var complet; // 已经完成的人数
                    $.ajax({
                        type: "POST",
                        url: '/Logistics/check/rateProgress.shtml?operationPostId='+d.userId+'&monthId='+$('#monthId').val(),
                        async: false,// 让ajax进行同步请求
                        success: function(data){
                            complet = data;
                        }
                     })
                    
                    return "<div class='progressHover'><span class='operationPostId' style='display:none;'>"+d.userId+"</span><div class='layui-progress layui-progress-big' lay-showPercent='true'>"+
                    "<div class='layui-progress-bar layui-bg-blue' lay-percent='"+complet+"/10'></div>"+
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
                  // 给进度条所在的单元格添加悬浮事件
                  $('.progressHover').parent().hover(
                      function () {
                          var obj = this;
                          layer.tips('正在查询请稍等。。。', obj, {
                              tips: [1, '#78BA32'] // 绿色
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
                 // 根绝进度条找到当前行的查看详情按钮
                 var aobj = $('.progressHover').parent().parent().next().find('a')
                 // 添加禁用样式
                 aobj.addClass("layui-btn-disabled")
                 // 移除事件绑定
                 aobj.removeAttr("lay-event")
                  
               }
        };
  
  // 渲染 table
  table.render(tableOpt)
  
  //渲染form元素,如果html代码是后来才加载的，那么需要加上render（）方法执行渲染
  form.render()
  
  //监听工具条
  table.on('tool(layuiTable)', function(rowData){ 
      var data = rowData.data //获得当前行数据
    ,layEvent = rowData.event; //获得 lay-event 对应的值
    if(layEvent === 'detail'){
        console.log(this)
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
    });
  
  // 下拉框change事件
  form.on('select(month)', function(data){
      tableOpt.url =  '/Logistics/userInfo/subordinateRate.shtml?monthId='+ data.value
      $('#monthId').val(data.value)
      $('#monthDescription').text(data.elem.selectedOptions["0"].childNodes["0"].nodeValue)
      table.render(tableOpt)
  });
  
});