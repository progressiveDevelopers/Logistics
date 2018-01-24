<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/function/check/list.js"></script>

 
<table class="layui-hide" id="test" lay-filter="demo"></table>

<script type="text/html" id="barDemo">
	  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
	  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
	  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
	</script>

	

