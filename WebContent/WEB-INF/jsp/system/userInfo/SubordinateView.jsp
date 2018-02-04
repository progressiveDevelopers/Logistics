<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<input type="hidden" value="${ month.id }" id="monthId">
<!--  aaaaaaaaaaaaaaa  -->
<h2 style='padding:0.2em 1em;'>${ month.description } — 考评列表</h2>
<a href="javascript:grid.exportData('/userInfo/subordinateRate.shtml')" class="btn btn-info" id="search">导出excel</a>
<table class="layui-hide" id="subordinateTbl" lay-filter="layuiTable"></table>
<div id="echarts" style="height:50%"></div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/userInfo/SubordinateView.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/common/lyGrid.js"></script>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看评分</a>
</script>