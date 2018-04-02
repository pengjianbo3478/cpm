<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="${ctx}/js/common/pageUtils4Ajax.js"></script>
<script type="text/javascript" src="${ctx}/js/accountregistry/add.js"></script>
<input type="hidden" id="_MENU_L0" value="1" />
<input type="hidden" id="_MENU_L1" value="0" />
<head>
<script type="text/javascript">
	function changeCode() {
		$('#kaptchaImage').hide().attr('src', '${ctx}captcha.html?' + Math.floor(Math.random() * 100)).fadeIn();
		<%/* event.cancelBubble = true; */%>
	}
</script>
</head>
<div id="_dtl_area">
	<form:form commandName="accountRegistry" modelAttribute="accountRegistry" action="${ctx}/accountregistry/add.do" method="POST" class="accountregistry">
		<div style="color: red">${add}</div>
		<table id="content" class="tab_list mb20">
			<tr>
				<td style="width: 8%">邮箱：</td>
				<td>
					<form:input path="email" cssClass="input_txt_l {}" />
				</td>
			</tr>
			<tr>
				<td style="width: 8%">姓名：</td>
				<td>
					<form:input path="name" cssClass="input_txt_l {}" />
				</td>
			</tr>
			<tr>
				<td style="width: 8%">公司：</td>
				<td>
					<form:input path="company" cssClass="input_txt_l {}" />
				</td>
			</tr>
			<tr>
				<td style="width: 8%">部门：</td>
				<td>
					<form:input path="department" cssClass="input_txt_l {}" />
				</td>
			</tr>
			<tr>
				<td style="width: 8%">账号：</td>
				<td>
					<form:input path="account" id="account" cssClass="input_txt_l {}" />
				</td>
			</tr>
			<tr>
				<td style="width: 8%">密码 ：</td>
				<td>
					<form:input path="password" id="password_" type="password" cssClass="input_txt_l {}" />
				</td>
			</tr>
			<tr>
				<td style="width: 8%">确认密码 ：</td>
				<td>
					<form:input path="confirmNewPassword" type="password" cssClass="input_txt_l {}" />
				</td>
			</tr>
			<tr>
				<td style="width: 8%">验证码 ：</td>
				<td>
					<form:input path="validateCode" id="volidateCode_" cssClass="input_txt_l {}" />
					<span style='color: #F00'>${captcha}</span>
					<img alt="" src="${ctx}/captcha.html" id="kaptchaImage">
					<a href="javascript:;" onclick="changeCode()">看不清?换一张</a>
				</td>
			</tr>
		</table>
		<div>
			<span style='color: #F00'>${err_message}</span>
		</div>
		<input type="submit" value="提交" class="inp_btn">
		<input type="reset" value="重置" class="inp_btn">
	</form:form>
</div>