<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<HTML>
<HEAD>
<META content="IE=11.0000" http-equiv="X-UA-Compatible">
<TITLE>登录</TITLE>
<META charset="utf-8">
<META name="keywords" content="">
<META name="description" content="">
<META name="viewport"  content="user-scalable=no,initial-scale=1.0,maximum-scale=1.0,width=device-width,min-width=800px">
<META name="apple-mobile-web-app-title" content="">
<META name="apple-mobile-web-app-capable" content="yes">
<META name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<META name="format-detection" content="telephone=no">
<META name="format-detection" content="email=no">
<META name="renderer" content="webkit|ie-comp|ie-stand">
<META name="GENERATOR" content="MSHTML 11.00.10240.16391">
<script src="${ctx}/m/js/jquery-1.11.1.min.js" type="text/javascript"></script>
<style type="text/css">

td{
	border-bottom: 1px solid #eaeaea;
}
a{
	text-decoration:none;
}
body{
	margin: 0px;
}
</style>
</HEAD>
<body>
	<div id="login" class="j-page">
		<div style="width: 100%;text-align: center;">
			<img src="${ctx}/m/images/logo.png" height="100px;" style="margin: 0 auto 10px auto"/></div>
		<form id="fm1" action="${ctx}/authentication.do" method="post">
		<div class="body">
			<table style="width: 100%;border-collapse:collapse;">
				<tr style="width:100%; height: 45px; line-height: 45px;border-bottom: 1px solid black;">
					<td style="width: 100px;">
						<img style="vertical-align: middle;height: 30px;padding:0 10px 0 10px;" src="${ctx}/m/images/icon_1.png" /><span style="display: inline-block;">账号</span>
					</td>
					<td colspan="2">
						<input style="width: 100%; border: none;height: 45px;" type="text" id="j_username" name="j_username" placeholder="手机号/邮箱"/>
					</td>
				</tr>
				<tr style="width:100%; height: 45px; line-height: 45px;">
					<td style="width: 100px;">
						<img style="vertical-align: middle;height: 30px;padding:0 10px 0 10px;"  src="${ctx}/m/images/icon_2.png" /><span style="display: inline-block;">密码</span>
					</td>
					<td colspan="2">
						<input style="width: 100%; border: none;height: 45px;" type="password" id="j_password" name="j_password" placeholder="请输入密码"/>
					</td>
				</tr>
				<tr style="width:100%; height: 45px; line-height: 45px;border-bottom: 1px solid black;">
					<td style="width: 100px;">
						<img style="vertical-align: middle;height: 30px;padding:0 10px 0 10px;"  src="${ctx}/m/images/icon_3.png" /><span style="display: inline-block;">验证码</span>
					</td>
					<td>
						<input style="width: 100%; border: none;height: 45px;" type="text" id="j_captcha" name="j_captcha" placeholder="请输入验证码"/>
					</td>
					<td style="width:120px;">
						<img alt="" style="height:40px;" src="${ctx}/checkcode/captcha.do" id="kaptchaImage" onclick="changeCode()">
					</td>
				</tr>
			</table>
			<div style="text-align: center;">
				<h3 style="color: red;"><spring:message code="${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}" /></h3>
				<input type="submit" value="登 录" style="background: #319DE6;border: none; border-radius:4px;width: 80%;height: 45px;margin: 30px auto 30px auto;">
				<input type="hidden" name="_eventId" value="submit" />
				<span style="display: block;margin-bottom: 50px;">
					<a href="${ctx}/m/authority/resetpassword.do">忘记密码?</a>
				</span>
				<input type="button" onclick="window.location.href='${ctx}/m/authority/register.do'" value="新用户注册" style="background: #ffffff;border: solid 1px #eaeaea; border-radius:4px;width: 80%;height: 45px;">
			</div>	
		</div>
	</form>
	</div>

<script type="text/javascript">
	function changeCode() {
		$('#kaptchaImage').hide().attr('src', '${ctx}/checkcode/captcha.do?' + Math.floor(Math.random() * 100)).fadeIn();
		event.cancelBubble = true;
	}
</script>
</body>
</html>