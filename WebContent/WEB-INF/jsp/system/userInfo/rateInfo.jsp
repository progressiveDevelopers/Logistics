<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/userInfo/rateInfo.js"></script>
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
<!--  aaaaaaaaaaaaaaa  -->
<h2 style='padding:0.2em 1em;'>${month } — 本月分数<span id="avg" style="color:#2038bf;font-size:45px;"></span></h2>
<input type="hidden" value="${sessionScope.userSessionId}"id="userId"/>

<div class="content">
    <div id="barMain"  class="top"></div>
    <div id="pieMain"  class="bottomLeft"></div>
    <div id="lineMain"  class="bottomright"></div>
    <div class="clear"></div>
</div>
