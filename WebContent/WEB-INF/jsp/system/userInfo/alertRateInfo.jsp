<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
.tip{
    float:left;
    
}
.userName{
   display: block;
   font-size: 30px;
   padding: 1em 0em 0em 50%;
}
</style>
<%@include file="/common/path.jspf"%>
<link href="${ctx}/layui/css/layui.css" rel="stylesheet">
<link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/css/style.min.css" rel="stylesheet">
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/layui/layui.js"></script>
<script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/echarts/echarts.min.js"></script>
<input type="hidden" value="${userId}" id="userId"/>
<input type="hidden" value="${month.id}" id="monthId"/>
<h2 style='padding:0.2em 1em;' class="tip">${month.description } — 本月分数<span id="avg" style="color:#2038bf;font-size:45px;"></span></h2><span class="userName">${ userName }</span>
<div class="clear1"></div>
<h5 style='padding:0.5em 2.5em;color:#a4a5a2;' class="tip">总分60分,换算成百分制为<span id="avgPercent" style="color:#a4a5a2;font-size:20px;"></span>分</h5>
<div class="clear1"></div>
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div id="barMain"  class="top" style="height: 300px; cursor: default;"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div class="ibox float-e-margins">
                        <div id="pieMain"  class="echarts"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div class="ibox float-e-margins">
                        <div id="lineMain"  class="echarts"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${ctx}/js/system/userInfo/alertRateInfo.js"></script>
<!--  aaaaaaaaaaaaaaa  -->