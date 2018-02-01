<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
.content{
    overflow: hidden;
}
.top{
    height:300px;
}
.bottomLeft{
    height:400px;
    width: 50%;
    float: left;
}
.bottomright{
    height:400px;
    width: 50%;
    float: left;
}
.clear{
    float: clear;
}
</style>
<%@include file="/common/common.jspf"%>

<!--  aaaaaaaaaaaaaaa  -->
<input type="hidden" value="${userId}"id="userId"/>
<h2 style='padding:0.2em 1em;'>${month } — 本月分数<span id="avg" style="color:#2038bf;font-size:45px;"></span></h2>
<%--  <form class="layui-form">
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
</form> --%>
<div class="content">
    <div id="barMain"  class="top"></div>
    <div id="pieMain"  class="bottomLeft"></div>
    <div id="lineMain"  class="bottomright"></div>
    <div class="clear"></div>
</div>
<script type="text/javascript" src="${ctx}/js/system/userInfo/alertRateInfo.js"></script>
<!--  aaaaaaaaaaaaaaa  -->
<script>
/* layui.use('form', function(){
    var form = layui.form;
    // 如果html代码是后来才加载的，那么需要加上render（）方法执行渲染
    form.render();
  }); */

</script>
