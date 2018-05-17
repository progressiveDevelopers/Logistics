<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<head>
<%@include file="/common/path.jspf"%>
<link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/layui/css/layui.css" rel="stylesheet">
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/layui/layui.js"></script>
<script type="text/javascript" src="${ctx}/js/function/check/checkHistoryList.js"></script>
</head>
<body>

<input type="hidden" value="${ month.id }" id="monthId">
<h2 style='padding:0.2em 1em;'><span id="monthDescription">${ month.description }</span> — 考核记录</h2>
 <form class="layui-form">
  <div class="layui-form-item" >
    <label class="layui-form-label" style="float: left;font-size: 18px;width:180px;">请选择考评日期:</label>
    <div class="layui-input-block" style="width:150px;float: left;margin-left:10px;">
      <select name="city" id="month" lay-filter="month" >
        <c:forEach  items="${listCheckMonth}"  var="month" >
           <option value="${ month.id }">${ month.description }</option>
        </c:forEach>
      </select>
    </div>
  </div>
</form>
<table class="layui-hide" id="test" lay-filter="check"></table>
</body>
</html>
<script type="text/html" id="barDemo">
	 <a class="layui-btn layui-btn-sm" lay-event="check">评价</a>
</script>