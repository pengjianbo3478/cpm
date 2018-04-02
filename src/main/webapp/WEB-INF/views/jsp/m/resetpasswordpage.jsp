<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + ":/"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<HTML>
<HEAD>
<META content="IE=11.0000" http-equiv="X-UA-Compatible">
<TITLE>重置密码 </TITLE>
<META charset="utf-8">
<META name="keywords" content="">
<META name="description" content="">
<META name="apple-mobile-web-app-title" content="">
<META name="apple-mobile-web-app-capable" content="yes">
<META name="viewport"  content="user-scalable=no,initial-scale=1.0,maximum-scale=1.0,width=device-width,min-width=800px">
<META name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<META name="format-detection" content="telephone=no">
<META name="format-detection" content="email=no">
<META name="renderer" content="webkit|ie-comp|ie-stand">
<script type="text/javascript" src="${ctx}/m/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.validate.js"></script>
<script src="${ctx}/js/businessuser/resetpwd.js?v=1"></script>
<script src="${ctx}/js/my_comm.js?v=1" charset="UTF-8"></script>


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

.introduce{
	text-align: left;
    display: block;
    height: 40px;
    border-top: solid 1px #eaeaea;
    border-bottom: solid 1px #eaeaea;
    font-size: 0.9em;
    color: gray;
    padding: 10px;
    background-color: white;
}
label{
	display: block;
    position: absolute;
    margin-top: -45px;
    right: 0px;
    color: red;
    font-size: 12px;
}
.removeDis{
	color:#ffffff;
	background: #319DE6;
}
</style>
<META name="GENERATOR" content="MSHTML 11.00.10240.16391">
</HEAD>
<body style="background-color:#f8f8f8">
	<div  class="j-page" style="background-color:#f8f8f8; margin-top: 20px; border-top: solid 1px #eaeaea;">
	<form action="${ctx}/m/authority/resetpassword.do" method="post" id="businessuser">
		<table style="width: 100%;border-collapse:collapse;">
			<tr style="width:100%; height: 45px; line-height: 45px;border-bottom: 1px solid black;">
				<td style="width: 135px;">
					<img style="vertical-align: middle;height: 30px;padding:0 10px 0 10px;"  src="${ctx}/m/images/icon_5.png" /><span style="display: inline-block;">手机号</span>
				</td>
				<td  colspan="2">
					<input style="width: 100%; border: none;height: 45px;" type="text" id="_phone" name="phone" placeholder="请输入手机号"/>
				</td>
			</tr>
			<tr style="width:100%; height: 45px; line-height: 45px;">
				<td style="width: 135px;">
					<img style="vertical-align: middle;height: 30px;padding:0 10px 0 10px;"  src="${ctx}/m/images/icon_5.png" /><span style="display: inline-block;">验证码</span>
				</td>
				<td>
					<input style="width: 100%; border: none;height: 45px;" type="text" id="msgCode" name="msgCode" placeholder="请输入验证码"/>
				</td>
				<td style="width:120px;">
					<input type="button" style="background-color: #008ae5;border-radius: 4px;color: white;width:110px;height: 40px;" id="btn2" value="获取验证码" class="btn_input" onclick="phoneCode()">
				</td>
			</tr>
			<tr style="width:100%; height: 45px; line-height: 45px;border-bottom: 1px solid black;">
				<td style="width: 135px;">
					<img style="vertical-align: middle;height: 30px;padding:0 10px 0 10px;" src="${ctx}/m/images/icon_2.png" /><span style="display: inline-block;">新密码</span>
				</td>
				<td colspan="2">
					<input style="width: 100%; border: none;height: 45px;" type="password" id="acctPassword_" name="acctPassword" placeholder="请输入新密码"/>
				</td>
			</tr>
			<tr style="width:100%; height: 45px; line-height: 45px;border-bottom: 1px solid black;">
				<td style="width: 135px;">
					<img style="vertical-align: middle;height: 30px;padding:0 10px 0 10px;" src="${ctx}/m/images/icon_2.png" /><span style="display: inline-block;">确认密码</span>
				</td>
				<td colspan="2">
					<input style="width: 100%; border: none;height: 45px;" type="password" id="confirmNewPassword" name="confirmNewPassword" placeholder="请输入确认密码"/>
				</td>
			</tr>
		</table>
		<div style="color: #FF0000"  id="msgCode">${msgCode}</div>
		<div style="text-align: center;">
			<input type="submit" disabled="disabled" id="submit" value="提 交" style="border: none; border-radius:4px;width: 80%;height: 45px;margin: 30px auto 30px auto;">
			<input type="button" onclick="window.location.href='${ctx}/m/authority/login.do'" value="返回登陆" style="background: #ffffff;border: solid 1px #eaeaea; border-radius:4px;width: 80%;height: 45px;margin-top: 45px;">
		</div>
	</form>		
    </div>
</body>
<script type="text/javascript">


$("input").change(function(){
	if($("#_phone").val() != '' && $("#msgCode").val() != '' && $("#acctPassword_").val() != '' && $("#confirmNewPassword").val() != '' ){
		$("#submit").addClass("removeDis");
		$("#submit").attr("disabled",false);
	}else{
		$("#submit").removeClass("removeDis");
		$("#submit").attr("disabled",true);
	}		
})


	function changeCode() {
		$('#kaptchaImage').hide().attr('src', '${ctx}/captcha.html?' + Math.floor(Math.random() * 100)).fadeIn();
	}
	
	var wait = 30;
	function phoneCode(o) {
		var _phone = $("#_phone").val();
		if (_phone == '') {
			return false;
		}else if (_phone != '') {
			$("#msgcode").text("");
		}
		var url = "${ctx}/m/authority/phonecode.do";
		$.post(url, {
			mobile : $('#_phone').val(),
			type : 3
		}, function(data) {
				count();
		}, "json");
		
	}
	function count(){
		$("#codeMsg_").text("");
		var o = document.getElementById("btn2");
		if (wait == 0) {
			o.removeAttribute("disabled");
			o.value = "重新获取";
			wait = 30;
		} else {
			o.setAttribute("disabled", true);
			o.value = "已发送(" + wait + ")";
			wait--;
			setTimeout(function() {
				count(wait);
			}, 1000);
		}
	}
</script>
</html>

