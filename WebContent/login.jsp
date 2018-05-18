<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>物流与商业金融部后台管理系统</title>
<%@include file="/common/path.jspf"%>
<link href="${ctx}/tongshang.png" type="image/x-icon" rel="shortcut icon">
<link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/css/font-awesome.min.css" rel="stylesheet">
<link href="${ctx}/css/animate.min.css" rel="stylesheet">
<link href="${ctx}/css/style.min.css" rel="stylesheet">
<script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>
<body class="gray-bg">

    <div class="middle-box text-center loginscreen  animated fadeInDown container">
        <div>
        	<div class="logo">
        		 <img src="./images/logo.png"> 
        	</div>
            
            <h3>物流与商业金融部后台管理系统</h3>

            <form class="m-t" role="form"  id="loginform" name="loginform" action="${ctx }/login.shtml" method="post">
                <div class="form-group">
                    <input  class="form-control" placeholder="用户名"   name="accountName" required="">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="密码" name="password" required="">
                </div>
                <button type="submit" onclick="checkUserForm()" class="btn btn-success block full-width m-b">登 录</button>
                <p class="text-muted text-center"> 
                    <a href="javascript:void(0)" id="forget"><small    style="color:#ecedf0;">忘记密码了？</small></a>
                </p>
            </form>
        </div>
    </div>

<!-- Modal -->
<div class="modal fade" id="forgetPasswordModal" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content" id="modal-content">
        <form id="formForgetPwd" name="form" class="form-horizontal" method="post" action="${ctx}/user/forgetPasswordValidate.shtml">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalCenterTitle">忘记密码</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="panel-body" >
                <div class="form-group" style="overflow: hidden;">
    				<label class="col-sm-3 control-label">用户名：</label>
    				<div class="col-sm-9">
    					<input type="text" class="form-control" placeholder="请输入用户名" name="validateEmailFormMap.accountName" id="accountName" >
    				</div>
    			</div>
    			<div class="line line-dashed line-lg pull-in"></div>
    			<div class="form-group" style="overflow: hidden;">
    				<label class="col-sm-3 control-label">邮箱：</label>
    				<div class="col-sm-9">
    					<input type="text"  class="form-control" placeholder="请输入邮箱" name="email" id="email" >
    				</div>
    			</div>
    			<div class="line line-dashed line-lg pull-in"></div>
    			<div class="form-group" style="overflow: hidden;">
    				<label class="col-sm-3 control-label">验证码：</label>
    				<div class="col-sm-3">
    					<input type="text" class="form-control" placeholder="验证码" name="validateEmailFormMap.code" >
    				</div>
    				<div class="col-sm-3">
                        <button class="btn btn-success btn-s-xs" type="button" id="sendEmail">发送验证邮件<span id="time"></span></button>
    				</div>
    			</div>
                </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            <button type="submit" class="btn btn-primary">提交</button>
          </div>
       </form>
    </div>
  </div>
</div>
    <script src="${ctx}/js/jquery.min.js"></script>
    <script src="${ctx}/js/bootstrap.min.js"></script>
    <script src="${ctx}/js/app.js"></script>
    <script src="${ctx}/js/login.js"></script>
    <script src="${ctx}/js/jquery.backstretch.min.js"></script>
    <script src="${ctx}/js/jquery/jquery.form.js"></script>
    <script src="${ctx}/js/jquery/jquery-validation/jquery.validate.min.js"></script>
    <script src="${ctx}/js/jquery/jquery-validation/messages_cn.js"></script>
    <script src="${ctx}/layui/lay/modules/layer.js"></script>
    <script src="${ctx}/js/system/user/forgetPassword.js"></script>
    
    <script type="text/javascript">

	    jQuery(document).ready(function() {     
	      App.init();    // init metronic core components
	   
	           $.backstretch([
	            "./images/bg/1.jpg",
	            "./images/bg/3.jpg",
	            "./images/bg/4.jpg"
	           
	            ], {
	              fade: 1000,
	              duration: 8000
	        }
	        );
	    });
		if ("${error}" != "" || "${param.error}" != "") {
			alert("${error}"+ "${param.error}");
			if("${change}" == "1" || "${param.change}" == "1"){
			    $("input[name='accountName']").val('${param.accountName}')
			    updatePasswordLayer()
			}
		};
		function checkUserForm() {
			document.loginform.submit()
		}
		function to_top(){
			if(window != top){
		        top.location.href=location.href
		    }
		}
		
		$("#forget").click(function(){
		    $('#forgetPasswordModal').modal('show')
		});
		
	</script>
</body>
</html>