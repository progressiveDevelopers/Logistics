layui.use([ 'laypage', 'layer', 'table', 'carousel', 'upload', 'element'], function(){
  var table = layui.table //表格
  
  //执行一个 table 实例
  table.render({
    elem: '#subordinateTbl'
    ,url: '/Logistics/userInfo/subordinateRate.shtml' //数据接口
    ,cols: [[ //表头
        {type: 'numbers',  title: '序号' , width: "10%", fixed: 'left'}
      ,{field: 'userName', title: '姓名',  sort: true}
      ,{field: 'userDescription', title: '团队/岗位'}
      ,{field: 'allscore',title: '平均分' , align:'center',sort: true,templet: function(d){
          if(d.allscore == undefined){
              console.log('1')
              return '<span style="color:red;" >未评完</span>'
          } else {
              return '<span style="font-weight:bold;" >'+d.allscore+'</span>'
          }
      }}
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
  
});

