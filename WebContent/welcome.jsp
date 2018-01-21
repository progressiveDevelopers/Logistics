<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



  <style>
    .demo-carousel{height: 200px; line-height: 200px; text-align: center;}
  </style>




<div class="layui-tab layui-tab-brief" lay-filter="demo">
  <ul class="layui-tab-title">
    <li class="layui-this">演示说明111</li>
    <li>日期</li>
    <li>分页</li>
    <li>上传</li>
  </ul>
  <div class="layui-tab-content">
    <div class="layui-tab-item layui-show">
    
      <div class="layui-carousel" id="test1">
        <div carousel-item>
          <div><p class="layui-bg-green demo-carousel">在这里，你将以最直观的形式体验 layui！</p></div>
          <div><p class="layui-bg-red demo-carousel">在编辑器中可以执行 layui 相关的一切代码</p></div>
          <div><p class="layui-bg-blue demo-carousel">你也可以点击左侧导航针对性地试验我们提供的示例</p></div>
          <div><p class="layui-bg-orange demo-carousel">如果最左侧的导航的高度超出了你的屏幕</p></div>
          <div><p class="layui-bg-cyan demo-carousel">你可以将鼠标移入导航区域，然后滑动鼠标滚轮即可</p></div>
        </div>
      </div>
    </div>
    <div class="layui-tab-item">
      <div id="laydateDemo"></div>
    </div>
    <div class="layui-tab-item">
      <div id="pageDemo"></div>
    </div>
    <div class="layui-tab-item">
      <div class="layui-upload-drag" id="uploadDemo">
        <i class="layui-icon"></i>
        <p>点击上传，或将文件拖拽到此处</p>
      </div>
    </div>
  </div>
</div>










<script>

layui.use(['laydate', 'laypage', 'layer', 'table', 'carousel', 'upload', 'element'], function(){
  var laydate = layui.laydate //日期
  ,laypage = layui.laypage //分页
  layer = layui.layer //弹层
  ,table = layui.table //表格
  ,carousel = layui.carousel //轮播
  ,upload = layui.upload //上传
  ,element = layui.element; //元素操作
  
  //向世界问个好
  layer.msg('Hello World');
  
  //监听Tab切换
  element.on('tab(demo)', function(data){
    layer.msg('切换了：'+ this.innerHTML);
    console.log(data);
  });
  
  //执行一个 table 实例
  table.render({
    elem: '#test'
    ,height: 332
    ,url: '/demo/table/user/' //数据接口
    ,page: true //开启分页
    ,cols: [[ //表头
      {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
      ,{field: 'username', title: '用户名', width:80}
      ,{field: 'sex', title: '性别', width:80, sort: true}
      ,{field: 'city', title: '城市', width:80} 
      ,{field: 'sign', title: '签名', width: 170}
      ,{field: 'experience', title: '积分', width: 80, sort: true}
      ,{field: 'score', title: '评分', width: 80, sort: true}
      ,{field: 'classify', title: '职业', width: 80}
      ,{field: 'wealth', title: '财富', width: 135, sort: true}
      ,{fixed: 'right', width: 165, align:'center', toolbar: '#barDemo'}
    ]]
  });
  
  //监听工具条
  table.on('tool(demo)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
    var data = obj.data //获得当前行数据
    ,layEvent = obj.event; //获得 lay-event 对应的值
    if(layEvent === 'detail'){
      layer.msg('查看操作');
    } else if(layEvent === 'del'){
      layer.confirm('真的删除行么', function(index){
        obj.del(); //删除对应行（tr）的DOM结构
        layer.close(index);
        //向服务端发送删除指令
      });
    } else if(layEvent === 'edit'){
      layer.msg('编辑操作');
    }
  });
  
  //执行一个轮播实例
  carousel.render({
    elem: '#test1'
    ,width: '100%' //设置容器宽度
    ,height: 200
    ,arrow: 'none' //不显示箭头
    ,anim: 'fade' //切换动画方式
  });
  
  //将日期直接嵌套在指定容器中
  var dateIns = laydate.render({
    elem: '#laydateDemo'
    ,position: 'static'
    ,calendar: true //是否开启公历重要节日
    ,mark: { //标记重要日子
      '0-10-14': '生日'
      ,'2017-11-11': '剁手'
      ,'2017-11-30': ''
    } 
    ,done: function(value, date, endDate){
      if(date.year == 2017 && date.month == 11 && date.date == 30){
        dateIns.hint('一不小心就月底了呢');
      }
    }
    ,change: function(value, date, endDate){
      layer.msg(value)
    }
  });
  
  //分页
  laypage.render({
    elem: 'pageDemo' //分页容器的id
    ,count: 100 //总页数
    ,skin: '#1E9FFF' //自定义选中色值
    //,skip: true //开启跳页
    ,jump: function(obj, first){
      if(!first){
        layer.msg('第'+ obj.curr +'页');
      }
    }
  });
  
  //上传
  upload.render({
    elem: '#uploadDemo'
    ,url: '' //上传接口
    ,done: function(res){
      console.log(res)
    }
  });
  
  //底部信息
  var footerTpl = lay('#footer')[0].innerHTML;
  lay('#footer')[0].innerHTML = layui.laytpl(footerTpl).render({});
});
</script>


































<div class="container">
    <div class="page-header">
        <h2>Bootstrap Star Rating Examples
            <small>&copy; Kartik Visweswaran, Krajee.com</small>
        </h2>
    </div>

    <!-- <form>
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
    <hr> -->
   
    
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
</div>



