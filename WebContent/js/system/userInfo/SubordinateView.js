layui.use([ 'laypage', 'layer', 'table','form'], function(){
  var table = layui.table //表格
  var form = layui.form
  
  //执行一个 table 实例
  
  var tableOpt = {
          elem: '#subordinateTbl'
          ,url: '/Logistics/userInfo/subordinateRate.shtml?monthId='+$('#monthId').val() //数据接口
          ,cols: [[ //表头
              {type: 'numbers',  title: '序号' , width: "10%", fixed: 'left'}
            ,{field: 'userName', title: '姓名',  sort: true}
            ,{field: 'userDescription', title: '团队/岗位',sort: true}
            ,{field: 'allscore',title: '平均分' , align:'center',sort: true,templet: function(d){
                if(d.allscore == undefined){
                    return '<span style="color:red;" >未评完</span>'
                } else {
                    return '<span style="font-weight:bold;" >'+d.allscore+'</span>'
                }
            }}
            ,{width: 165, align:'center', toolbar: '#barDemo'}
          ]]
        };
  
  table.render(tableOpt);
  
  //监听工具条
  table.on('tool(layuiTable)', function(rowData){ 
      var data = rowData.data //获得当前行数据
    ,layEvent = rowData.event; //获得 lay-event 对应的值
    if(layEvent === 'detail'){
        //弹出层iframe窗
        var month = $('#month').val();
        var userId = data.userId;
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
  
  // 如果html代码是后来才加载的，那么需要加上render（）方法执行渲染
  form.render();
  
  // 下拉框的监听事件
  form.on('select(month)', function(data){
      tableOpt.url =  '/Logistics/userInfo/subordinateRate.shtml?monthId='+ data.value
      $('#monthId').val(data.value)
      $('#monthDescription').text(data.elem.selectedOptions["0"].childNodes["0"].nodeValue)
      table.render(tableOpt);
  });
  
});