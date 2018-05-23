<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<%@include file="/common/path.jspf"%>
<link rel="stylesheet" href="${ctx}/notebook/notebook_files/font.css" type="text/css">
<link rel="stylesheet" href="${ctx}/notebook/notebook_files/app.v1.css" type="text/css">
<link rel="stylesheet" href="${ctx}/css/numberONe.css" type="text/css">
<link rel="stylesheet" href="${ctx}/layui/css/layui.css" type="text/css">
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/common/common.js"></script>
<script type="text/javascript" src="${ctx}/common/lyGrid.js"></script>
<script type="text/javascript" src="${ctx}/layui/lay/modules/layer.js"></script>
<script type="text/javascript" src="${ctx}/js/system/user/list.js"></script>
</head>
<body>
    <div class="m-b-md">
        <form class="form-inline" role="form" id="searchForm" name="searchForm">
            <div class="form-group">
                <label class="control-label"> <span class="h4 font-thin v-middle">账号:</span></label>
                <input class="input-medium ui-autocomplete-input" id="accountName"
                    name="userFormMap.accountName">
            </div>
            <a href="javascript:void(0)" class="btn btn-default" id="search">查询</a> <a
                href="javascript:grid.exportData('/user/export.shtml')" class="btn btn-info"
                id="search">导出excel</a>
        </form>
    </div>
    <header class="panel-heading">
        <div class="doc-buttons">
            <c:forEach items="${res}" var="key">
			${key.description}
		</c:forEach>
        </div>
    </header>
    <div class="table-responsive">
        <div id="paging" class="pagclass"></div>
    </div>

    <div class="table-responsive">
        <div id="paging2" class="pagclass"></div>
    </div>
</body>
</html>