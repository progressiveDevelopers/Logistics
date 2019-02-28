<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/common.jspf" %>
<script type="text/javascript" src="${ctx}/js/system/role/add.js">
</script>
<style type="text/css">
.col-sm-3 {
	width: 15%;
	float: left;
}

.col-sm-9 {
	width: 85%;
	float: left;
}
label[class^="btn btn-default"]{
	margin-top: -4px;
}
</style>
<script type="text/javascript">

	var rootPath = "${ctx}";
	function submitForm(){
		var invest = $("#invest").val();    			//贷款金额
		var interestCount = $("#interestCount").val();	//原利率	
		var totalMonth = $("#totalMonth").val();		//
		var subsidyInterest = $("#subsidyInterest").val();//补贴利率
		
		alert(invest + interestCount + totalMonth);
		$.ajax({
			type:'POST',
			data:{"invest":invest, "yearRate":yearRate, "totalMonth":totalMonth,"subsidyInterest":subsidyInterest},
			url: rootPath + '/tools/calculate.shtml',
			dataType:'json',
			success:function(dataMap){
				/*  document.getElementsByName("newYearRate")[0].value = dataMap.newYearRate;
				 document.getElementsByName("monthRepayment")[0].value = dataMap.monthRepayment;
				 document.getElementsByName("interestCount")[0].value = dataMap.totalInterest;
				 document.getElementsByName("nowInterest")[0].value = dataMap.nowInterest; */
				 screenUnlock();
			},  
            error: function() {  
            	screenUnlock();
            }  
		});
	}

</script>

</head>
<body>
	 
	<form id="form" name="form" class="form-horizontal" method="post"
		action="${ctx}/tools/calculateRate.shtml">
		<div class="form-group">
		  <label class="col-sm-4 control-label">贷款金额</label>
		  <div class="col-sm-4">
		    <input class="form-control" id="invest" type="text" placeholder="请输入贷款金额(单位:万)">
		  </div> 
		</div>
		
		<div class="form-group">
		  	<label class="col-sm-4 control-label">原利率</label>
		  	<div class="col-sm-4">
		    	<input class="form-control" id="interestCount" type="text" placeholder="请输入原利率(%)">
		  	</div>
 
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label">贷款期限</label>
			<div class="col-sm-4">
			  <input class="form-control" id="totalMonth" type="text" placeholder="该输入框贷款期限（单位:月)）">
			</div>
			 
		</div>
		
		<div class="form-group">
		    <label class="col-sm-4 control-label">补贴利息</label>
		    <div class="col-sm-4">
		      <input class="form-control" id="interestSubsidy" type="text" placeholder="该输入补贴利息(单位:万)">
		    </div>
		     
		</div>
   	    <div class="form-group">
            <div class="col-sm-4 col-sm-offset-5">
                <button class="btn btn-primary btn-lg" type="button" onclick="submitForm()">提交</button>
            </div>
        </div>
	</form>

	<div>
		<div>
			<h3><span class="label label-success">计算结果</span></h3>
		</div>
		<div class="table-responsive">
			<table class="table">
			    <thead>
			      <tr>
			        <th>原利息</th>
			        <th>实际利息</th>
			        <th>实际利率</th>
			        <th>月还款额</th>
			      </tr>
			    </thead>
			    <tbody>
			      <tr>
			        <td>产品1</td>
			        <td>23/11/2013</td>
			        <td>待发货</td>
			        <td>月还款额</td>
			      </tr>
			    </tbody>
		    </table>
	    </div>
	</div>
</body>
</html>