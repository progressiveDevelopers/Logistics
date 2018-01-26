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
</style>
</head>
<body>

<blockquote class="layui-elem-quote">${operationPost}</blockquote>

	<div>
		<c:forEach items="${res}" var="key">
			<div class="layui-form-item ">
				<label class="layui-form-label">${key.checkOption}</label>
				<div class="layui-input-block" id = "${key.id}" >
					<input id="input-21b" value="4" type="text" class="rating"
						data-min=0 data-max=10 data-step=1 data-size="lg" required
						title="">
				</div>
			</div>
		
		</c:forEach>
	</div>

 	
 <div class="layui-form-item">
    <button class="layui-btn" lay-submit="" lay-filter="demo2">跳转式提交</button>
  </div>
 



<%-- 	<script type="text/javascript">
		onloadurl();
	</script>
	<script type="text/javascript"
		src="${ctx}/notebook/notebook_files/bootstrap-filestyle.min.js"></script> --%>
</body>
</html>