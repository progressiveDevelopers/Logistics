<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
    <link rel="stylesheet" href="${ctx}/notebook/notebook_files/font.css" type="text/css">
    <link rel="stylesheet" href="${ctx}/notebook/notebook_files/app.v1.css" type="text/css">
    <link rel="stylesheet" href="${ctx}/css/numberONe.css" type="text/css">
    <link rel="stylesheet" href="${ctx}/layui/css/layui.css" type="text/css">
    <script type="text/javascript">var rootPath = "${ctx}";</script>
    <script type="text/javascript" src="${ctx}/js/jquery/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery/jquery.form.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery/jquery-validation/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery/jquery-validation/messages_cn.js"></script>
    <script type="text/javascript" src="${ctx}/common/common.js"></script>
    <script type="text/javascript" src="${ctx}/js/layer-v1.9.2/layer/layer.js"></script>
	
   
	<style type="text/css">
		.col-sm-3 {
			width: 25%;
			float: left;
		}
		.col-sm-9 {
			width: 75%;
			float: left;
		}
        .control-label{
            font-size: 20px;
        }
	</style>
</head>
<body>
	<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
	<form id="formForgetPwd" name="form" class="form-horizontal" method="post" action="${ctx}/user/forgetPasswordValidate.shtml">
		<section class="panel panel-default">
			<div class="panel-body">
				<div class="form-group">
					<label class="col-sm-3 control-label">用户名：</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" placeholder="请输入用户名" name="validateEmailFormMap.accountName" id="accountName" >
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">邮箱：</label>
					<div class="col-sm-9">
						<input type="text"  class="form-control" placeholder="请输入邮箱" name="email" id="email" >
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">验证码：</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" placeholder="验证码" name="validateEmailFormMap.code" >
					</div>
					<div class="col-sm-3">
                        <button class="btn btn-success btn-s-xs" type="button" id="sendEmail">发送验证邮件<span id="time"></span></button>
					</div>
				</div>
			</div>
			<footer class="panel-footer text-center bg-light lter">
                 <button type="submit" class="btn btn-success btn-s-md">提交</button>
			</footer> 
		</section>
	</form>
</body>
<script type="text/javascript" src="${ctx}/js/system/user/forgetPassword.js"></script>
</html>