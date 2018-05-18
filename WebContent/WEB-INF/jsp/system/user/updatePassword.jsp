<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/common/path.jspf"%>

	<form id="formUpdatePwd" name="form" class="form-horizontal" method="post"
        action="${ctx}/user/editPassword.shtml">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalCenterTitle">修改密码</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
        <div class="l_err" style="width: 100%; margin-top: 2px;color: red;"></div>
            <input type="hidden" class="form-control checkacc" value="${userSession.id}"
                name="userFormMap.id" id="id"> 
            <input type="hidden" class="form-control checkacc" value="${userSession.accountName}"
                name="userFormMap.accountName" id="accountName"> 
            <input type="hidden" class="form-control checkacc"
                value="${userSession.password}" name="userFormMap.password"
                id="password">
            <div class="panel-body">
                <div class="form-group">
                    <label class="col-sm-3 control-label">新密码</label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control" placeholder="请输入新密码"
                            name="userFormMap.newpassword" id="newpassword">
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">确认密码</label>
                    <div class="col-sm-9">
                        <input type="password" class="form-control"
                            placeholder="请输入确认密码" name="userFormMap.confirmpassword"
                            id="confirmpassword">
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            <button type="submit" class="btn btn-primary">提交</button>
        </div>
    </form>
<script src="${ctx}/common/common.js"></script>
<script src="${ctx}/js/system/user/updatePassword.js"></script>