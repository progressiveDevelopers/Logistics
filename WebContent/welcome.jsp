<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/common/path.jspf"%>
    <style>
    .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
    </style>
    <link href="${ctx}/layui/css/layui.css" rel="stylesheet">
    <script type="text/javascript" src="${ctx}/layui/layui.js"></script>
</head>
<body>

<div class="layui-tab layui-tab-brief" lay-filter="demo">
  <ul class="layui-tab-title">
    <li class="layui-this">评分说明</li>
  </ul>
  <div class="layui-tab-content">
    <div class="layui-tab-item layui-show">
      <div class="layui-carousel" id="carouselDemo">
        <div carousel-item>
          <div><p class="layui-bg-green demo-carousel"><b>服务量考评：</b>日常工作是否饱和，有效完成本职工作</p></div>
          <div><p class="layui-bg-red demo-carousel"><b>服务时效：</b>对客户经理需求相应迅速，在承诺时间内完成</p></div>
          <div><p class="layui-bg-blue demo-carousel"><b>服务质量：</b>按照服务承诺保质保量完成工作</p></div>
          <div><p class="layui-bg-orange demo-carousel"><b>服务表现：</b>贯彻执行首问责任制，积极主动为客户经理排忧解难</p></div>
          <div><p class="layui-bg-cyan demo-carousel"><b>服务态度：</b>工作热情、积极；处事态度端正</p></div>
          <div><p class="layui-bg-cyan demo-carousel"><b>综合满意度打分：</b>对于综合工作满意度打分</p></div>
        </div>
      </div>
    </div>
  </div>
</div>
<script>

layui.use([ 'carousel'], function(){
  var carousel = layui.carousel //轮播
  
  //执行一个轮播实例
  carousel.render({
    elem: '#carouselDemo'
    ,width: '100%' //设置容器宽度
    ,height: 200
    ,arrow: 'none' //不显示箭头
    ,anim: 'fade' //切换动画方式
  });
});
</script>
</body>
</html>

































<!-- <div class="container">
    <div class="page-header">
        <h2>Bootstrap Star Rating Examples
            <small>&copy; Kartik Visweswaran, Krajee.com</small>
        </h2>
    </div>

    <form>
        <input id="input-21b" value="4" type="text" class="rating" data-min=0 data-max=5 data-step=0.2 data-size="lg"
               required title="">
        <div class="clearfix"></div>
        <hr>
        <input required id="input-21c" value="" type="text" title="">
        <div class="clearfix"></div>
        <hr>
        <input id="input-21d" value="2" type="text" class="rating" data-min=0 data-max=5 data-step=0.5 data-size="sm"
               title="">
        <hr>
        <input id="input-21e" value="0" type="text" class="rating" data-min=0 data-max=5 data-step=0.5 data-size="xs"
               title="">
        <hr>
        <input id="input-21f" value="0" type="text" data-min=0 data-max=5 data-step=0.1 data-size="md" title="">
        <hr>
        <input id="input-2ba" type="text" class="rating" data-min="0" data-max="5" data-step="0.5" data-stars=5
               data-symbol="&#xe005;" data-default-caption="{rating} hearts" data-star-captions="{}" title="">
        <hr>
        <input id="input-22" value="0" type="text" class="rating" data-min=0 data-max=5 data-step=0.5 data-rtl=1
               data-container-class='text-right' data-glyphicon=0 title="">
        <div class="clearfix"></div>
        <hr>
        <input required class="rb-rating" type="text" value="" title="">
        <hr>
        <input id="rating-input" type="text" title=""/>
        <button id="btn-rating-input" type="button" class="btn btn-primary">Toggle Disable</button>
        <hr>
        <input id="kartik" class="rating" data-stars="5" data-step="0.1" title=""/>
        <div class="form-group" style="margin-top:10px">
            <button type="submit" class="btn btn-primary">Submit</button>
            <button type="reset" class="btn btn-default">Reset</button>
            <button type="button" class="btn btn-danger">Destroy</button>
            <button type="button" class="btn btn-success">Create</button>
        </div>
    </form>
    <hr>
   
    
     <input id="rating-input" type="text" title=""/>
    
     <script>
        jQuery(document).ready(function () {
        /*    $("#input-21f").rating({
                starCaptions: function (val) {
                    if (val < 3) {
                        return val;
                    } else {
                        return 'high';
                    }
                },
                starCaptionClasses: function (val) {
                    if (val < 3) {
                        return 'label label-danger';
                    } else {
                        return 'label label-success';
                    }
                },
                hoverOnClear: false
            });   */
            var $inp = $('#rating-input');

            $inp.rating({
                min: 0,
                max: 5,
                step: 1,
                size: 'lg',
                showClear: false
            });
    
         /*   $('#btn-rating-input').on('click', function () {
                $inp.rating('refresh', {
                    showClear: true,
                    disabled: !$inp.attr('disabled')
                });
            });


            $('.btn-danger').on('click', function () {
                $("#kartik").rating('destroy');
            });

            $('.btn-success').on('click', function () {
                $("#kartik").rating('create');
            });

            $inp.on('rating.change', function () {
                alert($('#rating-input').val());
            });

*/
            $('.rb-rating').rating({
                'showCaption': true,
                'stars': '3',
                'min': '0',
                'max': '3',
                'step': '1',
                'size': 'xs',
                'starCaptions': {0: 'status:nix', 1: 'status:wackelt', 2: 'status:geht', 3: 'status:laeuft'}
            });
       $("#input-21c").rating({
                min: 0, max: 8, step: 0.5, size: "xl", stars: "8"
            });
        });  
    </script>
</div> -->



