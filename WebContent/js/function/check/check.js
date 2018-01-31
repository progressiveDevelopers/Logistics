var dialog;
var grid;
$(function() {
	
	$("form").validate({
 		submitHandler : function(form) {//必须写在验证前面，否则无法ajax提交
 			ly.ajaxSubmit(form,{//验证新增是否成功
 				type : "post",
 				dataType:"json",
 				success : function(data) {
 					if (data=="success") {
 						layer.confirm('考评已提交!谢谢亲！', function(index) {
 							
 							var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
 							
 							 //第一个实例
 							parent.parent.table.render({
							     elem: '#test'
							    ,skin: 'line' //行边框风格
							    ,even: true //开启隔行背景
							    ,url: rootPath + '/check/findByPage.shtml' //数据接口
							    ,page: true //开启分页
							    ,cols: [[ //表头
							       {field: 'id',      title: 'ID' , width: "10%",    sort: true, fixed: 'left'}
							      ,{field: 'operationPost', title: '姓名', width:"30%",   sort: true}
							      ,{fixed: 'right', width: "30%", align:'center', toolbar: '#barDemo'}
							    ]]
							  });
 							
 							
 							parent.layer.close(index); //再执行关闭 
 							
 						
 							
				        	return false;
 						});
 						 
 					} else {
 						layer.msg('添加失败！');
 					}
 				}
 			});
 		},
 		
 		
 		
 		errorPlacement : function(error, element) {//自定义提示错误位置
 			$(".l_err").css('display','block');
 			//element.css('border','3px solid #FFCCCC');
 			$(".l_err").html(error.html());
 		},
 		success: function(label) {//验证通过后
 			$(".l_err").css('display','none');
 		}
 	});
	
	
	
	
	
	
	
	
	
	
	
	
});


