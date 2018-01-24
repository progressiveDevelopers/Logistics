<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/common.jspf"%>
 <script type="text/javascript" src="${ctx}/js/function/check/check.js">
	
</script>
<style type="text/css">
.col-sm-3 {
	width: 15%;
	float: left;
	text-align: right;
}

.col-sm-9 {
	width: 85%;
	float: left;
	text-align: left;
}

label[class^="btn btn-default"] {
	margin-top: -4px;
}
</style>
</head>
<body>



  <!-- <div class="star">
         <span>js星级评论打分</span>
         <ul>
             <li><a href="javascript:;">1</a></li>
             <li><a href="javascript:;">2</a></li>
             <li><a href="javascript:;">3</a></li>
             <li><a href="javascript:;">4</a></li>
            <li><a href="javascript:;">5</a></li>
         </ul>
     </div> -->

<div class="layui-form-item">
    <label class="layui-form-label">评分项</label>
    <div class="layui-input-block">
<input id="input-21b" value="4" type="text" class="rating" data-min=0 data-max=10 data-step=1 data-size="lg" required title="">
    </div>
  </div>
  
 
  
   <!--    <div>
      	   <span>js星级评论打分</span>
      	   <ul>
      	     <input id="input-21b" value="4" type="text" class="rating" data-min=0 data-max=10 data-step=1 data-size="lg" required title="">
	  	   </ul>
      </div> -->

 
	 
	   
	 
	<script type="text/javascript">
	onloadurl();
	</script>
	<script type="text/javascript"
		src="${ctx}/notebook/notebook_files/bootstrap-filestyle.min.js"></script>
</body>
</html>