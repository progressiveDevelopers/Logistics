<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    <c:set var="ctx" value="${pageContext.request.contextPath}" />
    <link rel="stylesheet" href="${ctx}/notebook/notebook_files/font.css" type="text/css">
    <link rel="stylesheet" href="${ctx}/notebook/notebook_files/app.v1.css" type="text/css">
    <link rel="stylesheet" href="${ctx}/css/numberONe.css" type="text/css">
    <link rel="stylesheet" href="${ctx}/layui/css/layui.css" type="text/css">
    <script type="text/javascript" src="${ctx}/js/jquery/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery/jquery.form.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery/jquery-validation/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery/jquery-validation/messages_cn.js"></script>
    <script type="text/javascript" src="${ctx}/js/layer-v1.9.2/layer/layer.js"></script>
    <script type="text/javascript" src="${ctx}/common/common.js"></script>
	<script type="text/javascript" src="${ctx}/js/system/user/updatePassword.js"></script>
	<style type="text/css">
		.col-sm-3 {
			width: 25%;
			float: left;
		}
		.col-sm-9 {
			width: 75%;
			float: left;
		}
	</style>
</head>
<body>
	<div class="l_err" style="width: 100%; margin-top: 2px;color: red;"></div>
	<form id="formUpdatePwd" name="form" class="form-horizontal" method="post" action="${ctx}/user/editPassword.shtml">
		<input type="hidden" class="form-control checkacc" value="${userSession.id}" name="userFormMap.id" id="id">
		<input type="hidden" class="form-control checkacc" value="${userSession.accountName}" name="userFormMap.accountName" id="accountName">
		<input type="hidden" class="form-control checkacc" value="${userSession.password}" name="userFormMap.password" id="password">
		<section class="panel panel-default">
			<div class="panel-body">
				<div class="form-group">
					<label class="col-sm-3 control-label">新密码</label>
					<div class="col-sm-9">
						<input type="password" class="form-control" placeholder="请输入新密码" name="userFormMap.newpassword" id="newpassword" >
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">确认密码</label>
					<div class="col-sm-9">
						<input type="password" class="form-control" placeholder="请输入确认密码" name="userFormMap.confirmpassword" id="confirmpassword" >
					</div>
				</div>
			</div>
			<footer class="panel-footer text-right bg-light lter">
				<button type="submit" class="btn btn-success btn-s-xs">修改</button>
			</footer> 
		</section>
	</form>
</body>
</html>