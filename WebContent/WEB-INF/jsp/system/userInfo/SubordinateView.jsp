<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
<%@include file="/common/path.jspf"%>
<link href="${ctx}/layui/css/layui.css" rel="stylesheet" >
<link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
</head>
<input type="hidden" value="${ month.id }" id="monthId">
<h2 style='padding:0.2em 1em;'><span id="monthDescription">${ month.description }</span> — 考评列表</h2>
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
    <div>
    <a class="btn btn-primary" id="exportExcel"  style="margin-left: 30px;">导出excel</a>
    </div>
  </div>
</form>
<div class="row">
	<div class="col-sm-12">
        <table id="subordinateTbl" lay-filter="layuiTable"></table>
    </div>
</div>
<div id="exportArea" style="display:none;">
<form class="layui-form">
  <div class="layui-form-item" >
    <label class="layui-form-label" style="float: left;font-size: 18px;width:180px;">开始日期:</label>
    <div class="layui-input-block" style="width:150px;float: left;margin-left:10px;">
      <select id="beginMonth" >
        <c:forEach  items="${listCheckMonth}"  var="month" >
           <option value="${ month.id }">${ month.description }</option>
        </c:forEach>
      </select>
    </div>
  </div>
  
  <div class="layui-form-item" >
    <label class="layui-form-label" style="float: left;font-size: 18px;width:180px;">结束日期:</label>
    <div class="layui-input-block" style="width:150px;float: left;margin-left:10px;">
      <select  id="endMonth" >
        <c:forEach  items="${listCheckMonth}"  var="month" >
           <option value="${ month.id }">${ month.description }</option>
        </c:forEach>
      </select>
    </div>
  </div>
</form>

</div>
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/layui/layui.js"></script>
<script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/js/system/userInfo/SubordinateView.js"></script>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">评分详情</a>
</script>
<script>
var grid = null;
$(function() {
	grid = lyGrid({
		pagId : 'paging',
		l_column : [{
			colkey : "userName",
			name : "姓名"
		}, {
			colkey : "userDescription",
			name : "团队/岗位"
		}, {
			colkey : "month",
			name : "月份"
		}, {
			colkey : "allscore",
			name : "平均分"
		} ],
		jsonUrl : rootPath + '/user/findByPage.shtml',
		checkbox : true,
		serNumber : true 
	});
	
});
</script>
</html>