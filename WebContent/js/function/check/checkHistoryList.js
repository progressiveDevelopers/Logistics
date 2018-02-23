var dialog;
var grid;
$(function() {
	
	console.log(1);
	layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element','form'], function(){
		  
		  var laydate = layui.laydate //日期
		  ,laypage = layui.laypage //分页
		  layer = layui.layer //弹层
		  ,table = layui.table //表格
		  ,carousel = layui.carousel //轮播
		  ,upload = layui.upload //上传
		  ,element = layui.element; //元素操作
		  
		  //第一个实例
		  var tableOpt = {
		     elem: '#test'
		    ,skin: 'line' //行边框风格
		    ,even: true //开启隔行背景
		    ,url: rootPath + '/check/findHistoryListByPage.shtml?monthId='+$(monthId).val() //数据接口
		    ,page: true //开启分页
		    ,cols: [[ //表头
		       {type: 'numbers',  title: '序号' , width: "10%",  sort: true, fixed: 'left'}
		       ,{field: 'month', title: '月份', width:"40%",   sort: true}
		      ,{field: 'operationPost', title: '姓名', width:"30%",   sort: true}
		      ,{field: 'result', title: '评分结果', width:"20%",   sort: true}
		    ]]
		  };
		  table.render(tableOpt);
	
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
		    var id = data.id;
		    var operationPost = data.operationPost;
		    var operationPostId = data.operationPostId;
		   
		    
		    if(layEvent === 'check'){
		    	layer.open({
		    		title : false,
		    		type : 2,
		    		area : [ "950px", "80%" ],
		    		isOutAnim: 6,
		    		content : rootPath + '/check/checkUI.shtml?id='+ id + '&operationPost=' +  operationPost + '&operationPostId=' +   operationPostId               
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
		
		  var form = layui.form
			 // 如果html代码是后来才加载的，那么需要加上render（）方法执行渲染
			  form.render();
			
			  // 下拉框的监听事件
			  form.on('select(month)', function(data){
			      tableOpt.url =  '/Logistics/check/findHistoryListByPage.shtml?monthId=' + data.value
			      $('#monthId').val(data.value)
			      $('#monthDescription').text(data.elem.selectedOptions["0"].childNodes["0"].nodeValue)
			      table.render(tableOpt);
			  });
	
	
	
	});
	
	  
});


