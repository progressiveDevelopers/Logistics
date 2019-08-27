<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/common/path.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <script src="${ctx}/js/jquery.min.js"></script>
    <script src="${ctx}/js/bootstrap.min.js"></script>
    <script src="${ctx}/js/app.js"></script>
    <script src="${ctx}/js/jquery.backstretch.min.js"></script>
    <script src="${ctx}/js/jquery/jquery.form.js"></script>
    <script src="${ctx}/js/jquery/jquery-validation/jquery.validate.min.js"></script>
    <script src="${ctx}/js/jquery/jquery-validation/messages_cn.js"></script>
    <script src="${ctx}/layui/lay/modules/layer.js"></script>
    <script src="${ctx}/js/system/user/forgetPassword.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分数计算</title>
<style type="text/css">
td,th,body,table,th{
margin: 0;
padding: 0;
border:1px solid black;

}
body,#tableMes,#tableMes tr,#tableMes td,#tableMes th{
background-color: #DADADA;
border:0px;
}
table{
margin: auto;
width:100%;
height:50%;
text-align:center ;
}
.stt,.add{
margin-left: 50px;
height:50px;
width: 90px;
}

.resTable tr,td,th{
border:1px solid black;
}
</style>
<script type="text/javascript">
$(function(){
	$(".stt").click(function(){
		layer.confirm('是否继续?', function(index) {
			var str = $("textarea[name='gradeM']").val();
			$("input[name='grade']").val(encodeURIComponent(stringToHex(str.split("").reverse().join(""))));
			$("#getGradeForm").ajaxSubmit(function(data){
				$(".tableHtml").html(data);
			});
			$(".layui-layer-close").click();
		});
	})
})

　function stringToHex(str){
		            var charBuf = writeUTF(str, true);
		            var re = '';
		            for(var i = 0; i < charBuf.length; i ++){
		                var x = (charBuf[i] & 0xFF).toString(16);
		                if(x.length === 1){
		                    x = '0' + x;
		                }
		                re += x;
		            }
		            return re;
	}
	
function writeUTF(str, isGetBytes) {
	            var back = [];
	            var byteSize = 0;
	            for (var i = 0; i < str.length; i++) {
	                var code = str.charCodeAt(i);
	                if (0x00 <= code && code <= 0x7f) {
	                    byteSize += 1;
	                    back.push(code);
	                } else if (0x80 <= code && code <= 0x7ff) {
	                    byteSize += 2;
	                    back.push((192 | (31 & (code >> 6))));
	                    back.push((128 | (63 & code)))
	                } else if ((0x800 <= code && code <= 0xd7ff)
	                    || (0xe000 <= code && code <= 0xffff)) {
	                    byteSize += 3;
	                    back.push((224 | (15 & (code >> 12))));
	                    back.push((128 | (63 & (code >> 6))));
	                    back.push((128 | (63 & code)))
	                }
	            }
	            for (i = 0; i < back.length; i++) {
	                back[i] &= 0xff;
	            }
	            if (isGetBytes) {
	                return back
	            }
	            if (byteSize <= 0xff) {
	                return [0, byteSize].concat(back);
	            } else {
	                return [byteSize >> 8, byteSize & 0xff].concat(back);
	            }
	        }

</script>
</head>
<body>

<table id="tableMes">
<tr style="height:80px!important; ">
<th style="width:10%;text-align:right;font-size: 30px;">分数一</th>
<th style="width:90%;font-size: 30px;">分数二</th>
</tr>
<tr >
<td style="width:10%;text-align:right;font-size: 30px;padding:0px!important;">实际分数</td>
<td style="width:90%;padding:0px!important;;"><textarea name="gradeM" style="width:80%;height: 400px;font-size: 25px;"></textarea></td>
</tr>
<tr style="height:70px;">
<td></td>
<td ><input class="add" type="button" value="加10分"/><input class="stt" type="button" value="减10分"/></td>
</tr>
</table>
<form action="${ctx }/getGradeMes.shtml" id="getGradeForm">
<input type="hidden" name="grade">
</form>
<div  class = "tableHtml"></div>
</body>
</html>