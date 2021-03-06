var pageii = null;
var grid = null;
$(function() {
	
	grid = lyGrid({
		pagId : 'paging',
		l_column : [ {
			colkey : "id",
			name : "id",
		}, {
			colkey : "userName",
			name : "用户名",
			isSort:true,
		}, {
			colkey : "accountName",
			name : "账号",
			isSort:true,
		}, {
			colkey : "roleName",
			name : "所属角色"
		}, {
			colkey : "locked",
			name : "账号状态",
			width : '90px',
			isSort:true
		}, {
			colkey : "description",
			name : "描述"
		}, {
			colkey : "createTime",
			name : "创建时间",
			isSort:true,
			renderData : function(rowindex,data, rowdata, column) {
				return new Date(data).format("yyyy-MM-dd hh:mm:ss");
			}
		} ],
		jsonUrl : rootPath + '/user/findByPage.shtml',
		checkbox : true,
		serNumber : true
	});
	
	$("#addAccount").click("click", function() {
		addAccount();
	});
	$("#editAccount").click("click", function() {
		editAccount();
	});
	$("#delAccount").click("click", function() {
		delAccount();
	});
	$("#permissions").click("click", function() {
		permissions();
	});
	// 离职设置
	$("#dimission").click("click", function() {
	    dimission();
	});
    // 重置密码
    $("#resetbtn").click("click", function() {
        resetPassword();
    });
});
function dimission() {
    var cbox = grid.getSelectedCheckbox();
    if (cbox.length > 1 || cbox == "") {
        layer.msg("只能选中一个");
        return;
    }
    
    layer.confirm('是否设置为离职,设为离职将会为其还未评分的人员进行自动评分（全满分）', {
        btn: ['确定','取消'] //按钮
      }, function(){
          $.ajax({
              url: rootPath + '/user/dimission.shtml',
              type: "post",
              data:{"userid":cbox[0]},
              dataType:"json",
              success: function(data){
                  layer.msg(data.msg, {icon: 1});
                  
              }
          });
          
         
          
      });
    
    
    
}
function editAccount() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		layer.msg("只能选中一个");
		return;
	}
	pageii = layer.open({
		title : "编辑",
		type : 2,
		area : [ "600px", "80%" ],
		content : rootPath + '/user/editUI.shtml?id=' + cbox
	});
}
function addAccount() {
	pageii = layer.open({
		title : "新增",
		type : 2,
		area : [ "600px", "80%" ],
		content : rootPath + '/user/addUI.shtml'
	});
}
function delAccount() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/user/deleteEntity.shtml';
		var s = CommnUtil.ajax(url, {
			ids : cbox.join(",")
		}, "json");
		if (s == "success") {
			layer.msg('删除成功');
			grid.loadData();
		} else {
			layer.msg('删除失败');
		}
	});
}
function permissions() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1 || cbox == "") {
		layer.msg("请选择一个对象！");
		return;
	}
	var url = rootPath + '/resources/permissions.shtml?userId='+cbox;
	pageii = layer.open({
		title : "分配权限",
		type : 2,
		area : [ "700px", "80%" ],
		content : url
	});


}
function resetPassword() {
    var cbox = grid.getSelectedCheckbox();
    if (cbox == "") {
        layer.msg("请选择用户！！");
        return;
    }
    layer.confirm('是否重置？', function(index) {
        var url = rootPath + '/user/resetPassword.shtml';
        var s = CommnUtil.ajax(url, {
            ids : cbox.join(",")
        }, "json");
        if (s == "success") {
            layer.msg('重置成功');
            grid.loadData();
        } else {
            layer.msg('重置失败');
        }
    });
}