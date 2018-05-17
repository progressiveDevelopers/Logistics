<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/common/path.jspf"%>
<div class="modal-dialog modal-dialog-centered modal-lg" role="document" id="modalWindow">
    <div class="modal-content">
     <form action="${ctx}/check/updateCheckResult.shtml" method="post">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalCenterTitle">被评人: ${operationPost}</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
         <c:forEach items="${res}" var="key">
                <h3>${key.checkOption}</h3>
                <input id='${key.id}' value="6" type="num" class="rating" name='option${key.id}' >
         </c:forEach>
         <input id='${id}'  value='${id}' type="hidden" name='operationPostId'/>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            <button type="submit" class="btn btn-primary">提交</button>
          </div>
      </form>
    </div>
    <script type="text/javascript">
    	var modalWindow = $('#modalWindow');
    	var option = {
            min: 0, max: 10, step: 1, size: "lg", stars: "10",
            starCaptions : {
                1: '1 Star',
                2: '2 Stars',
                3: '3 Stars',
                4: '4 Stars',
                5: '5 Stars',
                6: '6 Stars',
                7: '7 Stars',
                8: '8 Stars',
                9: '9 Stars',
                10: '10 Stars'
            },
            starCaptionClasses : 
            {
                1: 'label label-danger',
                2: 'label label-danger',
                3: 'label label-warning',
                4: 'label label-warning',
                5: 'label label-info',
                6: 'label label-info',
                7: 'label label-primary',
                8: 'label label-primary',
                9: 'label label-success',
                10: 'label label-success'
            }
    	
        }
    	
    	if(+modalWindow.width() < 600){ // 宽度小于600则只加载5颗星
    		option.stars = "5";
    		option.size = "xs";
    	}
    	// 星星评分
        $(".rating").rating(option);
    </script>
<script type="text/javascript" src="${ctx}/common/common.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery/jquery-validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery/jquery.form.js"></script>
<script type="text/javascript" src="${ctx}/js/function/check/check.js"></script>
  </div>