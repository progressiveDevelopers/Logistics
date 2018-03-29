function forgetPasswordLayer(){
	//加载层
 	var index = layer.load(0, {shade: false}); //0代表加载的风格，支持0-2
	//iframe层-禁滚动条
 	layer.open({
	    type: 2,
	    title:'忘记密码',
	    area: ['550px', '350px'],
	    skin: 'layui-layer-rim', //加上边框
	    content: [rootPath+'/user/forgetPasswordView.shtml', 'no']
	});
	//关闭加载效果
	layer.close(index);
}
var t = 60
function showTime(){
    t -= 1
    $('#sendEmail').attr('disabled',true)
    $('#sendEmail').text("重新发送("+t+")")  
    if(t==0){ 
        $('#sendEmail').attr('disabled',false)
        $('#sendEmail').text('重新发送')
        t = 60;
        return;
    }  
    //每秒执行一次,showTime()  
    setTimeout("showTime()",1000);  
}


$('#sendEmail').click(function(){
    
    var accountName = $('#accountName').val()
    var email = $('#email').val()
    
    $.ajax({
        type:'POST',
        url:rootPath+'/user/forgetPassword.shtml',
        data:{"email":email,"accountName":accountName},
        dataType : "json",
        success:function(data){
            var msg = data.msg;
            if(msg == 'success'){
                layer.msg('验证码已经发送到邮箱请注意查收', {icon: 6});
             // 开始倒计时
                showTime()
            } else {
                layer.msg(msg, {icon: 5,time:5000});
            }
        }
        
    })
    
});


$("#formForgetPwd").validate({
    submitHandler : function(form) {// 必须写在验证前面，否则无法ajax提交
        $.ajax( {
            url:rootPath+'/user/forgetPasswordValidate.shtml',
            type : "post",
            data:$("#formForgetPwd").serialize(),
            dataType : "json",//ajaxSubmi带有文件上传的。不需要设置json
            success : function(data) {
                var msg = data.msg;
                if (msg == "success") {
                    window.location.href = rootPath+'/user/updatePassword.shtml'
                } else {
                    layer.msg('验证失败，请检查验证码是否正确', {icon: 5,time:5000});
                }
            }
        });
    },
    rules : {
        "validateEmailFormMap.accountName" : {
            required : true
        },
        "validateEmailFormMap.code": {
            required : true
        }
    },
    messages : {
        "validateEmailFormMap.accountName" : {
            required : "请输入用户名"
        },
        "validateEmailFormMap.code" : {
            required : "请输入验证码密码"
        }
    },
    errorPlacement : function(error, element) {// 自定义提示错误位置
        $(".l_err").css('display', 'block');
        $(".l_err").html(error.html());
    },
    success : function(label) {// 验证通过后
        $(".l_err").css('display', 'none');
    }
});
