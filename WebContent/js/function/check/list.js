var dialog;
var grid;
$(function() {
	
	
	layui.use('table', function(){
		  var table = layui.table;
		  
		  //第一个实例
		  table.render({
		    elem: '#test'
		    ,height: 315
		    ,url: rootPath + '/check/findByPage.shtml' //数据接口
		    ,page: true //开启分页
		    ,cols: [[ //表头
		      {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
		      ,{field: 'mouth', title: '用户名', width:100}
		      ,{field: 'mouthId', title: '性别', width:250, sort: true}
		      ,{fixed: 'right', width: 165, align:'center', toolbar: '#barDemo'}
		    ]]
		  });
		  
		});
	
 
	  
	  //监听工具条
	  table.on('tool(demo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
	    var data = obj.data //获得当前行数据
	    ,layEvent = obj.event; //获得 lay-event 对应的值
	    if(layEvent === 'detail'){
	      layer.msg('查看操作');
	    } else if(layEvent === 'del'){
	      layer.confirm('真的删除行么', function(index){
	        obj.del(); //删除对应行（tr）的DOM结构
	        layer.close(index);
	        //向服务端发送删除指令
	      });
	    } else if(layEvent === 'edit'){
	      layer.msg('编辑操作');
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


 


