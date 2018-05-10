<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link href="${ctx}/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
<link href="${ctx}/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
<link href="${ctx}/css/plugins/iCheck/custom.css" rel="stylesheet">
<link href="${ctx}/css/animate.min.css" rel="stylesheet">
<link href="${ctx}/css/style.min.css?v=4.0.0" rel="stylesheet"><base target="_blank">

</head>
<body>
	<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
	<form id="form" name="form" class="form-horizontal" method="post"
		action="${ctx}/user/editEntity.shtml">
		<input type="hidden" class="form-control checkacc"
			value="${user.id}" name="userFormMap.id" id="id">
		<input type="hidden" class="form-control checkacc"
			value="${user.id}" name="userGroupInfoFormMap.userId" >
		<section class="panel panel-default">
		<div class="panel-body">
			<div class="form-group">
				<label class="col-sm-3 control-label">用户名</label>
				<div class="col-sm-9">
					<input type="text" class="form-control"
						placeholder="请输入用户名" value="${user.userName}"
						name="userFormMap.userName" id="userName">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">账号</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入账号" value="${user.accountName}"
						name="userFormMap.accountName" id="accountName" readonly="readonly">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
          
            <div class="form-group">
                <label class="col-sm-3 control-label">组</label>
                <div class="col-sm-9">
                    <select data-placeholder="请选择分组" class="form-control m-b">
                        <c:forEach items="${groups}" var="group"> 
                             <option value="${group.id }" hassubinfo="true"  <c:if test="${ group.id eq userGroupId }">selected="selected"</c:if> >${group.groupName }</option>
                        </c:forEach>
                    </select>
                </div>
               </div>
              <div class="line line-dashed line-lg pull-in"></div>
			<div id="selGroup"
				data-url="/role/selRole.shtml?roleFormMap.userId=${user.id}"></div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">描述</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入账号描述"
						value="${user.description}" name="userFormMap.description" id="description">
				</div>
			</div>
		</div>
		<footer class="panel-footer text-right bg-light lter">
		  <button type="submit" class="btn btn-success btn-s-xs">保存</button>
		</footer> 
        </section>
	</form>
    <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery/jquery.form.js"></script>
    <script type="text/javascript" src="${ctx}/common/common.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery/jquery-validation/jquery.validate.min.js"></script>
    <script type="text/javascript" src="${ctx}/layui/lay/modules/layer.js"></script>
    <script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/content.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/plugins/iCheck/icheck.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/system/user/edit.js"></script>
	
</body>
</html>