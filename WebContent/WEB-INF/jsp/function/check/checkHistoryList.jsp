<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/function/check/checkHistoryList.js"></script>

<h2 style='padding:0.2em 1em;'>${month} — 考核记录</h2>
<table class="layui-hide" id="test" lay-filter="check"></table>

<script type="text/html" id="barDemo">
	 <a class="layui-btn layui-btn-sm" lay-event="check">评价</a>
</script>
<!--    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>  -->
	
<!--  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a> -->
