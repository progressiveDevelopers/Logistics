/**
 * 
 */

layui.use([ 'laypage', 'layer', 'table'], function(){
  var table = layui.table //表格

  //执行一个 table 实例
  
  var tableOpt = {
          id: 'tbl'
          ,elem: '#ratePropressTbl'
          ,url: '/Logistics/check/rateProgressForAllData.shtml' //数据接口
          ,cols: [[ //表头
             {checkbox:true,style:'margin-top:50px'}
            ,{type: 'numbers',  title: '序号' }
            ,{field: 'evaluator', title: '姓名',  sort: true}
            ,{field: 'email', title: '邮件',  sort: true}
          ]],
          done:function(){ // 纠正复选框偏移问题
              var checkbox = $(".layui-form-checkbox")
              $.each(checkbox,function(index,value){
                  $(this).css({"margin-top":"5px"})

              });
          }
        };
  
  
  // 渲染 table
  table.render(tableOpt)
  
  table.on('checkbox(layuiTable)', function(obj){
      if(obj.type == "all"){
          var checkbox = $(".layui-form-checkbox")
          $.each(checkbox,function(index,value){
              $(this).css({"margin-top":"5px"})

          });
      }
    });
  
});
$("#sendEmail").click(function(){
    
    var checkStatus = table.checkStatus('tbl'); //test即为基础参数id对应的值
    
    if(checkStatus.data.length == 0){
        layer.msg('您还未选中任何人');
    } else {
        layer.confirm('是否确定发送邮件', {
            btn: ['发送','取消'] //按钮
          }, function(index){
              
              var data = {'evaluatorId':[]}
              var evaluatorId = [];
              
              //获取选中的数据
              selectData = checkStatus.data
              $.each(selectData,function(index,value){
                  evaluatorId.push(value.evaluatorId);
              });
              
              data.evaluatorId = evaluatorId;
              
              console.log("data----->>"+data.evaluatorId)
              
              $.ajax({
                  type: "POST",
                  url: rootPath+"/unrate/sendEmail.shtml",
                  contentType:'application/json;charset=utf-8',
                  data: JSON.stringify(data),
                  success: function(data){
                      data = JSON.parse(data);
                      layer.msg(data.msg)
                  },
                  error: function(XMLHttpRequest, textStatus, errorThrown){
                      layer.msg(XMLHttpRequest.responseText)
                  }
                  
               });
              layer.close(index);
          });
        
    }
});


