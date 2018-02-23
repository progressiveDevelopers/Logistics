<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/function/check/checkHistoryList.js"></script>
<input type="hidden" value="${ month.id }" id="monthId">
<!--  aaaaaaaaaaaaaaa  -->
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

<script type="text/html" id="barDemo">
	 <a class="layui-btn layui-btn-sm" lay-event="check">评价</a>
</script>
<!--    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>  -->
	
<!--  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a> -->
