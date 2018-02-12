<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<input type="hidden" value="${ month.id }" id="monthId">
<!--  aaaaaaaaaaaaaaa  -->
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
      <a href="javascript:grid.exportData('/userInfo/export.shtml?monthId=${ month.id }')" class="btn btn-info" id="search">导出excel</a>
    </div>
  </div>
</form>
<table class="layui-hide" id="subordinateTbl" lay-filter="layuiTable"></table>
<div id="echarts" style="height:50%"></div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/userInfo/SubordinateView.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/common/lyGrid.js"></script>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看评分</a>
</script>
<script>
var grid = null;
$(function() {
	grid = lyGrid({
		pagId : 'paging',
		l_column : [{
			colkey : "userName",
			name : "姓名",
			isSort:true,
		}, {
			colkey : "userDescription",
			name : "团队/岗位",
			isSort:true,
		}, {
			colkey : "allscore",
			name : "平均分"
		} ],
		jsonUrl : rootPath + '/user/findByPage.shtml',
		checkbox : true,
		serNumber : true 
	});
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJson();// 初始化传参数
		grid.setOptions({
			data : searchParams
		});
	});
});
</script>