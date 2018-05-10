<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
 <meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Google Chrome Frame也可以让IE用上Chrome的引擎: -->
<meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link href="${ctx}/tongshang.png" type="image/x-icon" rel="shortcut icon">
<meta name="renderer" content="webkit">
<title>物流与商业金融部后台管理系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

 <link rel="shortcut icon" href="${ctx}/fonts/favicon.ico"> 
 <link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
 <link href="${ctx}/css/font-awesome.min.css" rel="stylesheet">

 <link href="${ctx}/css/animate.min.css" rel="stylesheet">
 <link href="${ctx}/css/style.min.css" rel="stylesheet">


<!--  start  -->
<!-- base start 重要部分不可删改-->
<script type="text/javascript">
var rootPath = "${ctx}";
</script>
<%-- <script type="text/javascript" src="${ctx}/js/jquery/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery/jquery-validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctx}/js/layer-v1.9.2/layer/layer.js"></script>
<script type="text/javascript" src="${ctx}/js/system/user/updatePassword.js"></script> 
<script type="text/javascript" src="${ctx}/js/system/user/forgetPassword.js"></script>  --%>
<!-- base end -->
<!-- end -->

<!--[if lt IE 9]> 
	<script src="${ctx}/js/jquery/ie/html5shiv.js"></script> 
	<script src="${ctx}/js/jquery/ie/respond.min.js"></script>
<![endif]-->

<script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>
<%-- <body onload="javascript:to_top()" 
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
							alt="请输入账号.."></span><input type="text" placeholder="" name="" value=""
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
				<span class="pull-left" style="width: 33%;" ><a href="javascript:void(0)" id="forget"
					class="flip-link btn btn-info" id="to-recover">忘记密码？</a></span>
					 <span class="pull-right"><a type="submit"
					href="javascript:checkUserForm()" class="btn btn-success" id="loginbtn" >登&nbsp;&nbsp;录</a></span>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		if ("${error}" != "" || "${param.error}" != "") {
			alert("${error}"+ "${param.error}");
			if("${change}" == "1" || "${param.change}" == "1"){
			    $("input[name='']").val('${param.}')
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
		    forgetPasswordLayer();
		});
		
		  $(document).keydown(function(event){  
		      if(event.keyCode==13){  
		          checkUserForm();
		      }
		   });  
		
	</script>
</body> --%>

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
                    <input type="password" class="form-control" placeholder="密码"  name="password"  required="">
                </div>
                <button type="submit" onclick="checkUserForm()" class="btn btn-success block full-width m-b">登 录</button>


                <p class="text-muted text-center"> <a href="login.html#"><small>忘记密码了？</small></a> | <a href="register.html">注册一个新账号</a>
                </p>
                
                
                 
                
                

            </form>
        </div>
    </div>
    

    <script src="${ctx}/js/jquery.min.js"></script>
    <script src="${ctx}/js/bootstrap.min.js"></script>
    <script src="${ctx}/js/app.js"></script>
    <script src="${ctx}/js/login.js"></script>
    <script src="${ctx}/js/jquery.backstretch.min.js"></script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
    
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
		
	/* 	$("#forget").click(function(){
		    forgetPasswordLayer();
		}); */
		
		/*   $(document).keydown(function(event){  
		      if(event.keyCode==13){  
		          checkUserForm();
		      }
		   });   */
		
	</script>
</body>


</html>