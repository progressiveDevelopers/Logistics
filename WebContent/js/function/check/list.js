var dialog;
var grid;
$(function() {
	
    var tableOption = null;
    
    if(mobile){
        tableOption = {
                elem: '#test'
                    ,skin: 'line' //行边框风格
                    ,even: true //开启隔行背景
                    ,url: rootPath + '/check/findByPage.shtml' //数据接口
                    ,page: true //开启分页
                    ,cols: [[ //表头
                       {type: 'numbers',  title: '序号' ,  sort: true}
                      ,{field: 'operationPost', title: '姓名',   sort: true}
                      ,{align:'center', toolbar: '#barDemo',fixed:"right"}
                    ]]
                  };
    } else {
        tableOption = {
                elem: '#test'
                ,skin: 'line' //行边框风格
                ,even: true //开启隔行背景
                ,url: rootPath + '/check/findByPage.shtml' //数据接口
                ,page: true //开启分页
                ,cols: [[ //表头
                   {type: 'numbers',  title: '序号' ,  sort: true}
                  ,{field: 'operationPost', title: '姓名',   sort: true}
                  ,{field: 'description', title: '团队/岗位',   sort: true}
                  ,{align:'center', toolbar: '#barDemo',fixed: 'right'}
                ]]
              };
    }
    
	layui.use(['laypage', 'layer', 'table'], function(){
		  
		  var laypage = layui.laypage //分页
		  layer = layui.layer //弹层
		  ,table = layui.table //表格
		  
		  //第一个实例
		  table.render(tableOption);
	
		//监听工具条
		  table.on('tool(check)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
		    var data = obj.data //获得当前行数据
		    ,layEvent = obj.event; //获得 lay-event 对应的值
		    
		    var id = data.id;
		    var operationPost = data.operationPost;
		    var operationPostId = data.operationPostId;
		   
		    if (layEvent === 'check') {
		        $("#myModal").load(rootPath + '/check/checkUI.shtml?id='+ id + '&operationPost=' +  operationPost + '&operationPostId=' +   operationPostId);
		        $('#myModal').modal('show')
		    }
		  });

		  //分页
		  laypage.render({
		    elem: 'pageDemo' //分页容器的id
		    ,count: 100 //总页数
		    ,skin: '#1E9FFF' //自定义选中色值
		    //,skip: true //开启跳页
		    ,jump: function(obj, first){
		      if(!first){
		        layer.msg('第'+ obj.curr +'页');
		      }
		    }
		  });
	});
});