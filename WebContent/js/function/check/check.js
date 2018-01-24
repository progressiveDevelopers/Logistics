var dialog;
var grid;
$(function() {
	
	
	layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element'], function(){
		  
		  var laydate = layui.laydate //日期
		  ,laypage = layui.laypage //分页
		  layer = layui.layer //弹层
		  ,table = layui.table //表格
		  ,carousel = layui.carousel //轮播
		  ,upload = layui.upload //上传
		  ,element = layui.element; //元素操作
		  
		  //第一个实例
		  table.render({
		     elem: '#test'
		    ,skin: 'line' //行边框风格
		    ,even: true //开启隔行背景
		    ,url: rootPath + '/check/findOptByPage.shtml' //数据接口
		    ,page: true //开启分页
		    ,cols: [[ //表头
		       {field: 'id',      title: 'ID' , width: "10%",    sort: true, fixed: 'left'}
		      ,{field: 'checkOption'  , title: '考核类型', width: "20%",  sort: true}
		      ,{field: 'description', title: '描述', width:"30%",   sort: true}
		      ,{field: 'createTime', title: '创建时间', width:"20%",  sort: true}
		      ,{fixed: 'right', width: "20%", align:'center', toolbar: '#barDemo'}
		    ]]
		  });
		  
		
	
		//监听工具条
		  table.on('tool(check)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
		    var data = obj.data //获得当前行数据
		    ,layEvent = obj.event; //获得 lay-event 对应的值
		    /*if(layEvent === 'detail'){
		      layer.msg('查看操作');
		    } else if(layEvent === 'del'){
		      layer.confirm('真的删除行么', function(index){
		        obj.del(); //删除对应行（tr）的DOM结构
		        layer.close(index);
		        //向服务端发送删除指令
		      });
		    } else */
		    if(layEvent === 'check'){
		    	layer.open({
		    		title : "评分",
		    		type : 2,
		    		area : [ "1000px", "80%" ],
		    		isOutAnim: 6,
		    		content : rootPath + '/check/checkUI.shtml'
		    	});
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


 


