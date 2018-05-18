<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<%@include file="/common/path.jspf"%>
<link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/layui/css/layui.css" rel="stylesheet">
<link href="${ctx}/bootstrap-star-rating/css/star-rating.min.css" rel="stylesheet">
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/layui/layui.js"></script>
<script type="text/javascript" src="${ctx}/bootstrap-star-rating/js/star-rating.min.js"></script>
<script type="text/javascript" src="${ctx}/js/function/check/list.js"></script>

</head>
<body>
<h2 style='padding:0.2em 1em;'>${month} — 考评列表</h2>
<table id="test" lay-filter="check"></table>
<!-- modal start  -->
<div class="modal fade bd-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <!-- 模态窗口  内容-->
</div>
<!-- modal end  -->
</body>
</html>
<script type="text/html" id="barDemo">
	 <a class="layui-btn layui-btn-sm" lay-event="check" data-target="#myModal">评价</a>
</script>
