<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib uri='http://java.sun.com/jstl/core_rt' prefix='c'%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<script type="text/javascript">
	function changeCode() {
		$('#kaptchaImage').hide().attr('src', '${ctx}/captcha.html?' + Math.floor(Math.random() * 100)).fadeIn();
	}
	function check(){
		var acctCode = $("#acctCode").val().trim();
		var password = $("#password").val().trim();
		var code = $("#code").val().trim();
		if(acctCode==""||password==""){
			$("#msg").text("登录名或密码不能为空");
			return false;
		}
		if(code==""){
			$("#msg").text("验证码不能为空"); 
			return false;
		}
	}
</script>
	<!--顶部页头start-->
	<div class="lg_head">
		<a href="#" class="logo"></a>
		<a href="${ctx}/sign_up.html" class="lg_btn">注册</a>
		<a href="" class="lg_btn lg_btn_curr">
			<span>登录</span>
		</a>
		<a href="#" class="lg_btn">首页</a>
	</div>
	<!--顶部页头end-->
	<!--内容主体start-->
	<div class="lg_warp">
		<div class="title_head">
			<h1>欢迎登录欧巴金融</h1>
			<p>专注金融资产交易信息技术服务</p>
		</div>
		<form id="fm1" action="${ctx}/authentication.do" onsubmit="return check()" method="post">
			<!--登录start-->
			<div class="m-login">
				<div class="m_login_wrap">
					<div class="header">
						<h2>登录平台</h2>
						<a href="${ctx}/sign_up.html">注册账户&gt;</a>
					</div>
					<div class="main">
						<p class="email">
							<i></i>
							<input name="j_username" id="acctCode" placeholder="邮箱/手机号码" type="text">
						</p>
						<p class="pass">
							<i></i>
							<input name="j_password" id="password" placeholder="密码" type="password">
						</p>
						<p class="ckcode f-dn clearfix">
							<i></i>
							<input name="j_captcha" id="code" placeholder="图形验证码" type="text">
							<a>
								<img alt="点击更新" title="点击更新" src="${ctx}/captcha.html" id="kaptchaImage" onclick="changeCode()">
							</a>
						</p>	
						<p id="msg" style="color:#ff3924;margin-bottom:5px;margin-top:-20px;line-height:30px;">&nbsp;
							<spring:message code="${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}" />
							<c:if test="${not empty sessionScope.SPRING_SECURITY_LAST_EXCEPTION && empty sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}">
								账号与密码不正确
							</c:if>
							</p>
				       <p><button type="submit" id="">登录</button></p>
						
						<p class="link clearfix">
							<label class="label_input">
								<%/* <input type="checkbox" checked="checked" id="rembMyPass">记住我  */%>
							</label>
							<a class="lgpass" href="${ctx}/forgot_password.html">忘记密码？</a>
						</p>
					</div>
				</div>
				<div class="m_login_blac"></div>
			</div>
		</form>
	</div>