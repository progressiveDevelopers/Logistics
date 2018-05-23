<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<head>
<%@include file="/common/path.jspf"%>
<link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/layui/css/layui.css"  rel="stylesheet">
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/common/common.js"></script>
<script type="text/javascript" src="${ctx}/common/lyGrid.js"></script>
<script type="text/javascript" src="${ctx}/layui/lay/modules/layer.js"></script>
<script type="text/javascript" src="${ctx}/js/system/resources/list.js"></script>
</head>
<body>
	<div class="m-b-md">
		<form class="form-inline" role="form" id="searchForm"
			name="searchForm">
			<div class="form-group">
				<label class="control-label"> <span
					class="h4 font-thin v-middle">菜单名:</span></label> <input
					class="input-medium ui-autocomplete-input" id="name"
					name="resFormMap.name">
			</div>
			<a href="javascript:void(0)" class="btn btn-default" id="search">查询</a>
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
</body>
</html>