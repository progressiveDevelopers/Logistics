<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/common/common.jspf"%>

<!--  aaaaaaaaaaaaaaa  -->
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
<div id="main1" style="height:90%;"></div>
<script type="text/javascript" src="${ctx}/js/system/userInfo/alertRateInfo.js"></script>
<!--  aaaaaaaaaaaaaaa  -->
<script>
layui.use('form', function(){
    var form = layui.form;
    // 如果html代码是后来才加载的，那么需要加上render（）方法执行渲染
    form.render();
  });

</script>
