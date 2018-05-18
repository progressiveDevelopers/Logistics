
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
    
    if(accountName == ''){
        layer.msg('请输入用户名', {icon: 5,offset:['150px']});
        $('#accountName').focus();
        return;
    }
    if(email == ''){
        layer.msg('请输入邮箱', {icon: 5,offset:['150px']});
        $('#email').focus();
        return;
    }
    
    // 开始倒计时
    var f = showTime()
    $.ajax({
        type:'POST',
        url:rootPath+'/user/forgetPassword.shtml',
        data:{"email":email,"accountName":accountName},
        dataType : "json",
        success:function(data){
            var msg = data.msg;
            if(msg == 'success'){
                layer.msg('验证码已经发送到邮箱请注意查收', {icon: 6,offset:['150px']});
            } else {
                t=1;
                layer.msg(msg, {icon: 5,offset:['150px']});
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
                    $('#modal-content').load(rootPath+'/user/updatePassword.shtml');
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
