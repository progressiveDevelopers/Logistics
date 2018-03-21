function updatePasswordLayer(){
	//加载层
 	var index = layer.load(0, {shade: false}); //0代表加载的风格，支持0-2
	//iframe层-禁滚动条
 	layer.open({
	    type: 2,
	    title:'修改密码',
	    area: ['550px', '250px'],
	    skin: 'layui-layer-rim', //加上边框
	    content: [rootPath+'/user/updatePassword.shtml?change='+$('#change').val(), 'no']
	});
	//关闭加载效果
	layer.close(index);
}

//校验密码是否相同
function same(pwd) {  
    var oldPwd = $("#newpassword").val();  
    if (oldPwd == pwd){
    	return false;  
    }else{
    	//更改表单中确认密码的name的属性名
    	$("#confirmpassword").attr("name","userFormMap.password");
    	return true;
    }  
}

jQuery.validator.addMethod("same", function(value, element) {  
    return this.optional(element) || same(value);  
}, "新密码和确认密码不一致"); 

// 获取URL
function GetRequest() {
    var url = location.search; //获取url中"?"符后的字串
    var theRequest = new Object();
    if (url.indexOf("?") != -1) {
       var str = url.substr(1);
       strs = str.split("&");
       for(var i = 0; i < strs.length; i ++) {
          theRequest[strs[i].split("=")[0]]=unescape(strs[i].split("=")[1]);
       }
    }
    return theRequest;
 }

//加入数据校验证
$(function() {
    
  
    
	$("#formUpdatePwd").validate({
		submitHandler : function(form) {// 必须写在验证前面，否则无法ajax提交
			ly.ajaxSubmit(form, {// 验证新增是否成功
				type : "post",
				dataType : "json",//ajaxSubmi带有文件上传的。不需要设置json
				success : function(data) {
					if (data == "success") {
					    console.log("success")
					    layer.msg('修改密码成功', {
					        time: 0 //不自动关闭
					        ,btn: ['我知道了']
					        ,yes: function(index){
					            var param = GetRequest()['change']
					            if(param != '1'){
					                window.parent.location.reload();
					            }
					            var parindex = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
					            parent.layer.close(parindex); //再执行关闭 
					        }
					      });
					} else {
						layer.msg('修改密码失败！', {icon: 5});
					}
				}
			});
		},
		rules : {
			"userFormMap.newpassword" : {
				minlength: 6,
				required : true
			},
			"userFormMap.confirmpassword": {
				required : true,
				minlength: 6,
//				same:true, 
				equalTo: "#newpassword"
			}
		},
		messages : {
			"userFormMap.newpassword" : {
				required : "请输入新密码",
				minlength: jQuery.format("密码不能小于{0}个字 符")
			},
			"userFormMap.confirmpassword" : {
				required : "请输入确认密码",
				minlength: jQuery.format("密码不能小于{0}个字 符"),
				equalTo : "新密码和确认密码不一致"
			}
		},
		errorPlacement : function(error, element) {// 自定义提示错误位置
			$(".l_err").css('display', 'block');
			// element.css('border','3px solid #FFCCCC');
			$(".l_err").html(error.html());
		},
		success : function(label) {// 验证通过后
			$(".l_err").css('display', 'none');
		}
	});
});