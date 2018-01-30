<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/common.jspf"%>
<script type="text/javascript" src="${ctx}/js/function/check/check.js">
	
</script>
<style type="text/css">
.layui-form-label {
	float: center;
	display: block;
	padding: 0px 0px;
	height: 60px;
	width: 150px;
	font-weight: blod;
	line-height: 60px;
	text-align: center;
	font-size: 25px
}

.check-title {
	font-weight: blod;
	line-height: 40px;
	text-align: center;
	font-size: 20px
}

.check-btn {
	left-margin:500px
}
</style>
</head>
<body>

<blockquote class="check-title" >被评人: ${operationPost}</blockquote>
<form class="layui-form"  name="form" class="form-horizontal" method="post" 
action="${ctx}/check/updateCheckResult.shtml">
	<div>
		<c:forEach items="${res}" var="key">
			<div class="layui-form-item ">
				<label class="layui-form-label">${key.checkOption}</label>
				<div class="layui-input-block" id = "${key.id}" >
					<input id='${key.id}' value="4" type="text" class="rating"
						data-min=0 data-max=10 data-step=1    name = 'option${key.id}' data-size="lg" required   
						title="">
				</div>
			</div>
		
		</c:forEach>
	</div>
	<input id='${id}'  value='${id}' type="hidden" name='operationPostId'> </input>

 	 
 <footer class="panel-footer text-center bg-light lter">
			<button type="submit" class="btn btn-success btn-s-xs">提交</button>
		</footer>
 
</form>

</body>
</html>