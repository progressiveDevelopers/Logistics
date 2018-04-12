var Login = function () {
	var lang = {
			'username_required': "请输入登陆帐号！",
			'username_rangelength': "登陆帐号长度介于{0}和{1}之间！",
			'username_remote': "登陆帐号不存在！",
			'password_required': "请输入密码！",
			'password_digits': "只能输入整数！",
			'password_rangelength': "密码长度介于{0}和{1}之间！"
	};
	function postLogin(form) {
		$.ajax({
			type:"post",
	   	    url: "verifyUser.do",
	   	    dataType: "json",
	   	    data: {
	   	     'username' : $("#username").val(),
	   	     'password' : $("#password").val()
	   	    },
	   	    success: function(response){
	   	     if(response=='cp'){
	   	    	 $.get("changePassword.do",function(data){
	   	    		 $('.login').html(data);
	   	    	 });
	   	    	 return;
	   	     }
	   	     var valid = response == true || response == 'true';
	   	     if (valid) {
	   	         //刷新当前页面
	   	    	 window.location.href = window.location.search == "?transCode=queryData" ? "queryData.do" : "login.do"
	   	    	 return false;
	   	     } else {
	   	    	 //返回提示信息 
	   	    	 $('.alert-danger .alert-tip').text(response);
	   	    	 $('.alert-danger', $('.login-form')).show();
	   	     }
	   	   }
		});
	}
	
	var encrypt = function(value) {              //密码加密
		$("#password").val(hex_md5(value)) ;
 	   return $("#password").val();
    };
	
	//保存用户信息 
	var saveUserInfo = function() { 
		if ($("#uniform-remember span").hasClass("checked")) { 
			var username = $("#username").val(); 
			var password = $("#password").val(); 
			$.cookie("encrypt", "true", { expires: 7 }); //存储加密
			$.cookie("rmbUser", "true", { expires: 7 }); // 存储一个带7天期限的 cookie 
			$.cookie("username", username, { expires: 7 }); // 存储一个带7天期限的 cookie 
			$.cookie("password", password, { expires: 7 }); // 存储一个带7天期限的 cookie 
		} else { 
			$.cookie("encrypt", "false", { expires: -1 }); 
			$.cookie("rmbUser", "false", { expires: -1 }); 
			$.cookie("username", '', { expires: -1 }); 
			$.cookie("password", '', { expires: -1 }); 
		} 
	} 
	
	var initUserInfo = function() { 
		if ($.cookie("rmbUser") == "true") { 
			$("#uniform-remember span").addClass("checked") 
			$("#username").val($.cookie("username")); 
			$("#password").val($.cookie("password")); 
			setTimeout(postLogin, 3000);
		} 
	}
	
	var handleLogin = function() {
		$('.login-form').validate({
	            errorElement: 'span', //default input error message container
	            errorClass: 'help-block', // default input error message class
	            focusInvalid: false, // do not focus the last invalid input
	            rules: {
	                username: {
	                    required: true,
	                    rangelength: [4,32],
	                    remote: {
	                        url: "verifyUser.do",       //后台处理程序
	                        type: "post",               //数据发送方式
	                        dataType: "json",           //接受数据格式   
	                        data: {                     //要传递的数据
	                            username: function() {
	                                return $("#username").val();
	                            },
	                            reverse: false
	                        }
	                    }
	                },
	                password: {
	                    required: true,
	                   // digits: true,
	                    rangelength: [6,32]
	                },
	                remember: {
	                    required: false
	                }
	            },

	            messages: {
	                username: {
	                    required: lang['username_required'],
	                    rangelength: $.validator.format(lang['username_rangelength']),
	                    remote: lang['username_remote']
	                },
	                password: {
	                    required: lang['password_required'],
	                    digits: lang['password_digits'],
	                    rangelength: $.validator.format(lang['password_rangelength'])
	                }
	            },

	            invalidHandler: function (event, validator) { //display error alert on form submit   
	                $('.alert-danger', $('.login-form')).show();
	            },

	            highlight: function (element) { // hightlight error inputs
	                $(element)
	                    .closest('.form-group').addClass('has-error'); // set error class to the control group
	            },

	            success: function (label) {
	                label.closest('.form-group').removeClass('has-error');
	                label.remove();
	            },

	            errorPlacement: function (error, element) {
	                error.insertAfter(element.closest('.input-icon'));
	            },

	            submitHandler: function (form) {
	            	if ($.cookie("encrypt") != true) {
	        			encrypt($("#password").val());
	        		}
	        		
	        		if ($.cookie("rmbUser") != true) 
	        			saveUserInfo();
	            	postLogin(form);
	            }
	        });

	        $('.login-form input').keypress(function (e) {
	            if (e.which == 13) {
	                if ($('.login-form').validate().form()) {
	                	if ($.cookie("encrypt") != true) {
	            			encrypt($("#password").val());
	            		}
	            		
	            		if ($.cookie("rmbUser") != true) 
	            			saveUserInfo();
	                	postLogin(form);
	                }
	                return false;
	            }
	        });
	}

	var handleForgetPassword = function () {
		$('.forget-form').validate({
	            errorElement: 'span', //default input error message container
	            errorClass: 'help-block', // default input error message class
	            focusInvalid: false, // do not focus the last invalid input
	            ignore: "",
	            rules: {
	                email: {
	                    required: true,
	                    email: true
	                }
	            },

	            messages: {
	                email: {
	                    required: "Email is required."
	                }
	            },

	            invalidHandler: function (event, validator) { //display error alert on form submit   

	            },

	            highlight: function (element) { // hightlight error inputs
	                $(element)
	                    .closest('.form-group').addClass('has-error'); // set error class to the control group
	            },

	            success: function (label) {
	                label.closest('.form-group').removeClass('has-error');
	                label.remove();
	            },

	            errorPlacement: function (error, element) {
	                error.insertAfter(element.closest('.input-icon'));
	            },

	            submitHandler: function (form) {
	                form.submit();
	            }
	        });

	        $('.forget-form input').keypress(function (e) {
	            if (e.which == 13) {
	                if ($('.forget-form').validate().form()) {
	                    $('.forget-form').submit();
	                }
	                return false;
	            }
	        });

	        $('#forget-password').click(function () {
	            $('.login-form').hide();
	            $('.forget-form').show();
	        });

	        $('#back-btn').click(function () {
	            $('.login-form').show();
	            $('.forget-form').hide();
	        });

	}
    
    return {
        //main function to initiate the module
        init: function () {
            handleLogin();
            handleForgetPassword();
            initUserInfo();
        },

    };

}();