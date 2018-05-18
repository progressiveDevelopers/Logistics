<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>物流与商业金融部</title>
<%@include file="/common/path.jspf"%>
<link href="${ctx}/tongshang.png" type="image/x-icon" rel="shortcut icon">
<link href="${ctx}/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/css/font-awesome.min.css" rel="stylesheet">
<link href="${ctx}/css/animate.min.css" rel="stylesheet">
<link href="${ctx}/css/style.min.css" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow: hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close">
                <i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <span
                                class="clear"> <span class="block m-t-xs"><strong
                                        class="font-bold">${ userName }</strong></span> <span
                                    class="text-muted text-xs block">${ role }<b
                                        class="caret"></b></span>
                            </span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li>
                                    <a href="javascript:void(0)"
                                        onclick="updatePassword()">修改密码</a>
                                </li>
                                <li>
                                    <a href="logout.shtml">安全退出</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <!--  菜单 开始 -->
                    <c:forEach var="key" items="${list}" varStatus="s">
                        <li>
                            <a href="#"> <i class="fa fa fa-bar-chart-o"></i> <span
                                class="nav-label">${key.name}</span> <span class="fa arrow"></span>
                            </a>
                            <ul class="nav nav-second-level">
                                <c:forEach var="kc" items="${key.children}">
                                    <li>
                                        <a class="J_menuItem" href="${ctx}${kc.resUrl}?id=${kc.id}">${kc.name}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
                    </c:forEach>
                    <!--  菜单 结束 -->
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header">
                        <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i
                                class="fa fa-bars"></i> </a>
                    </div>
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft">
                    <i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="welcome.jsp">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight">
                    <i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose" data-toggle="dropdown">
                        关闭操作<span class="caret"></span>
                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive">
                            <a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll">
                            <a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther">
                            <a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="welcome.jsp"
                    frameborder="0" data-id="welcome.jsp" seamless></iframe>
            </div>
        </div>
        <!--右侧部分结束-->
    </div>
    <!-- Modal -->
    <div class="modal fade" id="modalUpdatePassword" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
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
                            name="userFormMap.id" id="id"> <input type="hidden"
                            class="form-control checkacc" value="${userSession.accountName}"
                            name="userFormMap.accountName" id="accountName"> <input
                            type="hidden" class="form-control checkacc"
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
            </div>
        </div>
    </div>
    <script src="${ctx}/js/jquery.min.js"></script>
    <script src="${ctx}/js/bootstrap.min.js"></script>
    <script src="${ctx}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="${ctx}/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="${ctx}/layui/lay/modules/layer.js"></script>
    <script src="${ctx}/js/hplus.min.js"></script>
    <script src="${ctx}/js/contabs.min.js"></script>
    <script src="${ctx}/common/common.js"></script>
    <script src="${ctx}/js/jquery/jquery.form.js"></script>
    <script src="${ctx}/js/jquery/jquery-validation/jquery.validate.min.js"></script>
    <script src="${ctx}/js/jquery/jquery-validation/messages_cn.js"></script>
    <script src="${ctx}/js/plugins/pace/pace.min.js"></script>
    <script src="${ctx}/js/system/user/updatePassword.js"></script>
    <script type="text/javascript">
        function updatePassword() {
            $('#modalUpdatePassword').modal('show')
        }
    </script>
</body>

</html>