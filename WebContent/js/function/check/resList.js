var dialog;
var grid;
$(function() {
	grid = lyGrid({
		id : 'paging',
		l_column : [ {
			colkey : "id",
			name : "id",
			hide:true
		}, {
			colkey : "mouth",
			name : "月份",
			width : "85px"
		}, {
			colkey : "evaluator",
			name : "评价人",
			width : "115px"
		}, {
			colkey : "operationPost",
			name : "中后台人员",
			width : "90px"
		}, {
			colkey : "checkResult",
			name : "考核结果",
			width : "90px"
		}],
		jsonUrl : rootPath + '/check/findResByPage.shtml',
		checkbox : true
	});
	$("#searchForm").click("click", function() {//绑定查询按扭
		var searchParams = $("#fenye").serializeJson();
		grid.setOptions({
			data : searchParams
		});
	});
});