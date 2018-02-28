<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en"	class="app js no-touch no-android chrome no-firefox no-iemobile no-ie no-ie10 no-ie11 no-ios no-ios7 ipad">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
<meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link href="${ctx}/tongshang.png" type="image/x-icon" rel="shortcut icon">
<meta name="renderer" content="webkit">
<title>物流与商业金融部后台管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"	href="${ctx}/admin_files/min.css">
<link rel="stylesheet"	href="${ctx}/admin_files/login.css">
<link	href="${ctx }/admin_files/css.css"	rel="stylesheet" type="text/css">

<!-- ----------- start ---------- -->
<!-- base start 重要部分不可删改-->
<script type="text/javascript">
var rootPath = "${ctx}";
</script>
<script type="text/javascript" src="${ctx}/js/jquery/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery/jquery-validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctx}/js/layer-v1.9.2/layer/layer.js"></script>
<script type="text/javascript" src="${ctx}/js/system/user/updatePassword.js"></script> 
<!-- base end -->
<!-- -----------end---------- -->

<!--[if lt IE 9]> 
	<script src="${ctx}/js/jquery/ie/html5shiv.js"></script> 
	<script src="${ctx}/js/jquery/ie/respond.min.js"></script>
<![endif]-->
</head>
<body onload="javascript:to_top()" 
	style="background-image: url('${ctx }/admin_files/9.jpg');margin-top:0px;background-repeat:no-repeat;background-size: 100% auto;">
	<div id="loginbox" style="padding-top: 10%;">
    <input type="hidden" id="change" value="${param.change}">
		<form id="loginform" name="loginform" class="form-vertical"
			style="background-color: rgba(0, 0, 0, 0.5) !important; background: #000; filter: alpha(opacity = 50); *background: #000; *filter: alpha(opacity = 50); /*黑色透明背景结束*/ color: #FFF; bottom: 0px; right: 0px; border: 1px solid #000;"
			action="${ctx }/login.shtml"
			method="post">
			<div class="control-group normal_text">
				<table style="width: 100%">
					<tr>
						<td align="center" style="font-weight: bold;color: gray;font-size: 22px;">物流与商业金融部后台管理系统</td>
					</tr>
				</table>

			</div>
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
						<span class="add-on bg_ly" style="background: #28b779"><img
							src="${ctx }/admin_files/account_1.png"
							alt="请输入账号.."></span><input type="text" placeholder="username" name="username" value=""
							style="height: 32px; margin-bottom: 0px;"/>
					</div>
				</div>
			</div>
			<div class="control-group">
				<div class="controls">
					<div class="main_input_box">
						<span class="add-on bg_ly"><img
							src="${ctx }/admin_files/lock_1.png"
							alt="请输入密码.."></span><input type="password" placeholder="password" name="password" value=""
							style="height: 32px; margin-bottom: 0px;"/>
					</div>
				</div>
			</div>
			<div class="form-actions">
				<span class="pull-left" style="width: 33%;" ><a href="javascript:alert('即将上线，敬请期待')"
					class="flip-link btn btn-info" id="to-recover">忘记密码？</a></span>
					 <span
					class="pull-right"><a type="submit"
					href="javascript:checkUserForm()" class="btn btn-success" >登&nbsp;&nbsp;录</a></span>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		if ("${error}" != "" || "${param.error}" != "") {
			alert("${error}"+ "${param.error}");
			if("${change}" == "1" || "${param.change}" == "1"){
			    $("input[name='username']").val('${param.username}')
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
	</script>
</body>
</html>