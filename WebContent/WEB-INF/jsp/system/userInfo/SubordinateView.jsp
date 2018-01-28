<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/userInfo/SubordinateView.js"></script>

<!--  aaaaaaaaaaaaaaa  -->
 <form class="layui-form">
  <div class="layui-form-item">
    <label class="layui-form-label">日期</label>
    <div class="layui-input-block">
      <select name="city" lay-verify="required" id="month">
        <c:forEach  items="${listCheckMonth}"  var="month" >
           <option value="${ month.id }">${ month.description }</option>
        </c:forEach>
      </select>
    </div>
  </div>
</form>

<!--  aaaaaaaaaaaaaaa  -->
<table class="layui-hide" id="subordinateTbl" lay-filter="layuiTable"></table>
<div id="echarts" style="height:50%"></div>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看评分</a>
</script>
<script>
//Demo
layui.use('form', function(){
  var form = layui.form;
  // 如果html代码是后来才加载的，那么需要加上render（）方法执行渲染
  form.render();
});
</script>