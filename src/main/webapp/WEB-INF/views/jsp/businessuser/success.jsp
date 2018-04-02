<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link href="${static_ftiao_cn}/css/comm.css?v=1" rel="stylesheet" type="text/css">
<link href="${static_ftiao_cn}/css/login.css?v=1" rel="stylesheet" type="text/css">
<script src="${static_ftiao_cn}/js/common/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="${static_ftiao_cn}/js/my_comm.js?v=1" charset="UTF-8"></script> 
<script type="text/javascript" charset="UTF-8">
	$(function() {
		function jump(count) {
			window.setTimeout(function() {
				count--;
				if (count > 0) {
					$('.showbox').html(count);
					;
					jump(count);
				} else {
					location.href = $("#jump_href").attr("href");
					;
				}
			}, 1000);
		}
		jump(4);

	})
</script>
<!--顶部页头start-->
<div class="lg_head">
	<a href="#" class="logo"></a> <a href="${ctx}/businessuser/add.do"
		class="lg_btn">注册</a> <a href="${ctx}/login.do"
		" class="lg_btn lg_btn_curr"><span>登录</span></a> <a href="#"
		class="lg_btn">首页</a>
</div>
<!--顶部页头end-->
<!--内容主体start-->
<div class="lg_banner_wrap">
	<div class="lg_banner" id="gLogin">
		<!--start-->
		<div class="fine_login box_shadow reset_right regist_succ">
			<p>${msg}</p>
			<p class="jump_p">
				页面将在<span class="showbox">4</span>秒后跳转至<a href="${ctx}/login.do"
					id="jump_href">登录</a>界面...
			</p>
		</div>
	</div>
</div>
