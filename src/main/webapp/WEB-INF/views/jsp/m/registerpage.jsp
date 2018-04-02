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
<TITLE>注册 </TITLE>
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
<script src="${ctx}/m/js/add.js"></script>


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
label{
	display: block;
    position: absolute;
    margin-top: -45px;
    right: 0px;
    color: red;
    font-size: 12px;
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
.removeDis{
	color:#ffffff;
	background: #319DE6;
}
</style>
<META name="GENERATOR" content="MSHTML 11.00.10240.16391">
</HEAD>
<body style="background-color:#f8f8f8">
	<div  class="j-page" style="background-color:#f8f8f8">
	<div style="width: 100%;text-align: center;">
			<img src="${ctx}/m/images/tree.png" width="100%" style="margin: 0 auto 10px auto"/>
		<span class="introduce">
			欧巴平台主要服务于机构会员及业务人员。请正确填写一下信息，我们会尽快与您联系，进行机构认证
		</span>	
	</div>
	<form:form commandName="businessUser" modelAttribute="businessUser" action="${ctx}/m/authority/registerfirst.do" method="post" id="businessuser" enctype="multipart/form-data">
		<table style="width: 100%;border-collapse:collapse;">
			<tr style="width:100%; height: 45px; line-height: 45px;border-bottom: 1px solid black;">
				<td style="width: 135px;">
					<img style="vertical-align: middle;height: 30px;padding:0 10px 0 10px;" src="${ctx}/m/images/icon_4.png" /><span style="display: inline-block;">机构名称</span>
				</td>
				<td colspan="2">
					<input style="width: 100%; border: none;height: 45px;" maxlength="40" type="text" id="institutionName" name="institutionName" placeholder="请输入机构名称"/>
				</td>
			</tr>
			<tr style="width:100%; height: 45px; line-height: 45px;">
				<td style="width: 135px;">
					<img style="vertical-align: middle;height: 30px;padding:0 10px 0 10px;"  src="${ctx}/m/images/icon_1.png" /><span style="display: inline-block;">姓名</span>
				</td>
				<td colspan="2">
					<input style="width: 100%; border: none;height: 45px;" type="text" id="name" name="name" placeholder="请输入姓名"/>
				</td>
			</tr>
			<tr style="width:100%; height: 45px; line-height: 45px;">
				<td style="width: 135px;">
					<img style="vertical-align: middle;height: 30px;padding:0 10px 0 10px;"  src="${ctx}/m/images/icon_2.png" /><span style="display: inline-block;">邮箱</span>
				</td>
				<td colspan="2">
					<input style="width: 100%; border: none;height: 45px;" type="text" id="_email" name="email" placeholder="请输入邮箱"/>
				</td>
			</tr>
			<tr style="width:100%; height: 45px; line-height: 45px;border-bottom: 1px solid black;">
				<td style="width: 135px;">
					<img style="vertical-align: middle;height: 30px;padding:0 10px 0 10px;"  src="${ctx}/m/images/icon_5.png" /><span style="display: inline-block;">手机号</span>
				</td>
				<td colspan="2">
					<input style="width: 100%; border: none;height: 45px;" type="text" id="_phone" name="phone" maxlength="11" placeholder="请输入手机号"/>
				</td>
			</tr>
			<tr style="width:100%; height: 45px; line-height: 45px;border-bottom: 1px solid black;">
				<td style="width: 135px;">
					<img style="vertical-align: middle;height: 30px;padding:0 10px 0 10px;"  src="${ctx}/m/images/icon_3.png" /><span style="display: inline-block;">验证码</span>
				</td>
				<td>
					<input style="width: 100%; border: none;height: 45px;" maxlength="4" type="text" id="code" name="code" placeholder="请输入验证码"/>
				</td>
				<td style="width:120px;">
					<img alt="" style="height:40px;" src="${ctx}/checkcode/captcha.do" id="kaptchaImage" onclick="changeCode()">
				</td>
			</tr>
			<tr style="width:100%; height: 45px; line-height: 45px;">
				<td style="width: 135px;">
					<img style="vertical-align: middle;height: 30px;padding:0 10px 0 10px;"  src="${ctx}/m/images/icon_5.png" /><span style="display: inline-block;">动态验证码</span>
				</td>
				<td>
					<input style="width: 100%; border: none;height: 45px;" type="text" id="msgCode" name="msgCode" placeholder="请输入动态验证码"/>
				</td>
				<td style="width:120px;">
					<input type="button" style="background-color: #008ae5;border-radius: 4px;color: white;width:110px;height: 40px;" maxlength="6" id="btn2" value="获取验证码" class="btn_input" onclick="phoneCode()">
				</td>
			</tr>
		</table>
		<div style="text-align: center;">
			<div style="color:red" id="msgcode">${msg}</div>
			<input type="submit" disabled="disabled" id="next" value="下 一 步" style="border: none; border-radius:4px;width: 80%;height: 45px;margin: 30px auto 30px auto;">
			<input type="button" onclick="window.location.href='${ctx}/m/authority/login.do'" value="已有账户?直接登陆" style="background: #ffffff;border: solid 1px #eaeaea; border-radius:4px;width: 80%;height: 45px;margin-top: 45px;">
		</div>
	</form:form>			
    </div>
</body>
<script type="text/javascript" charset="UTF-8">

	$("input").change(function(){
		if($("#institutionName").val() != '' && $("#name").val() != '' && $("#_email").val() != '' && $("#code").val() != '' && $("#_phone").val() != '' && $("#msgCode").val() != '' ){
			$("#next").addClass("removeDis");
			$("#next").attr("disabled",false);
		}else{
			$("#next").removeClass("removeDis");
			$("#next").attr("disabled",true);
		}		
	})
	function changeCode() {
		$('#kaptchaImage').hide().attr(
				'src',
				'${ctx}/checkcode/captcha.do?'
						+ Math.floor(Math.random() * 100)).fadeIn();
		event.cancelBubble = true;
	}
	var wait = 30;
	function phoneCode(o) {
		var _phone = $("#_phone").val();
		if($("#_phone").hasClass("error_1")){
			return false;
		}
		if (_phone == '') {
			$("#msgcode").text("请输入手机号码");
			return false;
		} else if (_phone != '') {
			$("#msgcode").text("");
		}
		if (wait == 0) {
			o.removeAttribute("disabled");
			o.value = "重新获取";
			wait = 30;
			var url = "${ctx}/businessuser/phonecode.do";
			$.post(url, {
				mobile : $('#_phone').val(),
				code:$("#code_").val()
			}, function(data) {
				if (data.result == "N") {
					alert("发送失败，请先确认图形验证码");
				}
			}, "json");
		} else {
			o.setAttribute("disabled", true);
			o.value = "已发送(" + wait + ")";
			wait--;
			setTimeout(function() {
				phoneCode(o)
			}, 1000)
		}
	}
	document.getElementById("btn2").onclick = function() {
		phoneCode(this);
	}
	function checkPhone() {
		var url = "${ctx}/businessuser/checkphone.do";
		$.post(url, {
			phone : $('#_phone').val()
		}, function(data) {
			if (data == false) {
				$("#btn2").attr("disabled", "disabled");
			} else {
				$("#btn2").attr("disabled", false);
			}
		}, "json");
	}
</script>
</html>

