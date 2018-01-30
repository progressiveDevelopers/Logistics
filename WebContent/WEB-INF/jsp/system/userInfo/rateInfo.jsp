<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/userInfo/rateInfo.js"></script>
<!--  aaaaaaaaaaaaaaa  -->

<input type="text" value="${ sessionScope.userSessionId} "id="userId"/>
<input type="text" value="${userId} "id="userIda"/>
 <form class="layui-form">
  <div class="layui-form-item">
    <label class="layui-form-label">日期</label>
    <div class="layui-input-block" style="width:150px">
      <select name="city" lay-verify="required" id="month">
        <c:forEach  items="${listCheckMonth}"  var="month" >
           <option value="${ month.id }">${ month.description }</option>
        </c:forEach>
      </select>
    </div>
  </div>
</form>
<div id="main" style="height:90%;"></div>
<!--  aaaaaaaaaaaaaaa  -->