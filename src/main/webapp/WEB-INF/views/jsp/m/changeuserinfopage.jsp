<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + ":/"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	request.setAttribute("page_sign","home_account");
  if(request.getProtocol().compareTo("HTTP/1.0")==0)   
        response.setHeader("Pragma","no-cache");   
  else   if(request.getProtocol().compareTo("HTTP/1.1")==0)   
        response.setHeader("Cache-Control","no-cache");   
  response.setDateHeader("Expires",0);   
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" /> 
<HTML>
<HEAD>
<META content="IE=11.0000" http-equiv="X-UA-Compatible">
<TITLE>修改个人信息</TITLE>
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
<LINK href="${ctx}/m/css/main.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${ctx}/m/css/header.css" />
<link rel="shortcut icon" href="${ctx}/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${ctx}/favicon.ico" type="image/x-icon" />
<link href="${ctx}/m/css/login.css" rel="stylesheet" type="text/css">
<link href="${ctx}/m/css/comm.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${ctx}/m/js/jquery-1.11.1.min.js"></script>
<script src="${static_ftiao_cn}/js/pop_up_w.js?v=1" charset="UTF-8"></script>
<script src="${static_ftiao_cn}/js/my_comm.js?v=1" charset="UTF-8"></script>
<script src="${static_ftiao_cn}/js/success_alter.js?v=1" charset="UTF-8"></script>
<script src="${static_ftiao_cn}/js/funds.js?v=1" charset="UTF-8"></script>
<script src="${static_ftiao_cn}/js/businessuser/merge.js?v=1"></script>
<script src="${static_ftiao_cn}/js/jquery.validate.js" type="text/javascript"></script>

<style type="text/css">
.left{
	width:75px;
	height:45px;
	line-height: 45px;
	border-bottom: solid 1px #eaeaea;
}
.right input,.right{
	width:100%;
    height: 45px;
    line-height: 45px;
	border-bottom: solid 1px #eaeaea;
}	
</style>

</HEAD>

<body style="background-color:#f8f8f8;">
   <c:set value="4" var="index" scope="session"></c:set>
	<div id="myAccount"  class="m-reg m-reg2" style="background-color:#f8f8f8; margin: 30px 2% 0 2% ;padding:0; border-top: solid 1px #eaeaea;">
	<form:form commandName="businessUser" id="form" modelAttribute="businessUser" action="${ctx}/m/user/changeuserinfo.do" enctype="multipart/form-data" method="POST">
		<table style="width: 100%;border-collapse: collapse;" >
			<tr style="width: 100%">
				<td class="left">
					<span>
						机构名称
					</span>
				</td>
				<td class="right">
					<form:input type="text" path="name"/>
				</td>
			</tr>
			<tr style="width: 100%">
				<td class="left">
					<span>部门</span> 
				</td>
				<td class="right">
					<form:input type="text" path="department"/>
				</td>
			</tr>
			<tr style="width: 100%">
				<td class="left">
					<span>
						职位
					</span>
				</td>
				<td class="right">
					<form:input type="text" path="jobTitle"/>
				</td>
			</tr>
			<tr style="width: 100%">
				<td class="left">
					<span>
						手机号
					</span>
				</td>
				<td class="right">
					<form:input type="text" path="phone"/>
						<input type="hidden" id="_phone" value="${businessUser.phone }" />
				</td>
			</tr>
			<tr style="width: 100%">
				<td class="left">
					<span>
						固话
					</span>
				</td>
				<td class="right">
					<form:input type="text" path="telNum"/>
				</td>
			</tr>
			<tr style="width: 100%">
				<td class="left">
					<span>
						邮箱
					</span>
				</td>
				<td class="right">
					<form:input type="text" path="email"/>
				</td>
			</tr>
			<tr style="width: 100%">
				<td class="left">
					<span>
						名片
					</span>
				</td>
				<td class="right">
				<div class="file-box1" style="wi">
					<input style="height: 45px; line-height: 45px;" type="text" id="textfield1" class="txt1" placeholder="上传名片">
					<input type="button" class="btn1" value="浏览..." style="background: #309de6;line-height: 25px;height:45px;color:#ffffff;">
					<input style="width:100%;height: 45px; line-height: 45px;" type="file" name="myfile" class="file1" id="doc" size="28" onchange="document.getElementById('textfield1').value=this.value;document.getElementById('textfield1').style.textIndent='5px'">
				</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="right">
					<div id="msg" id="codeMsg_"  style="color: red;">${codeMsg}</div>
				</td>
			</tr>
		</table>
		</form:form>
		<div>
			<input type="button" style="background-color: #309de6;height: 45px; line-height: 20px;color:#ffffff;width: 100%;" id="save" onclick="click_val()" value="保 存 个 人 信 息"/>
		</div>
				
	</div>
	
	<script type="text/javascript">
function checkCode() {
	var url = "${ctx}/businessuser/checkcode.do"
	$.post(url, {
		code : $("#code_").val()
	}, function(data) {
		if (data.result == "N") {
			$("#phoneCode").removeAttr("onclick");
			$("#save").removeAttr("onclick");
			$("#codeMsg_").text("图形验证码不正确");
		} else {
			$("#codeMsg_").text("");
			$("#phoneCode").attr("onclick","phoneCode(this)");
			$("#save").attr("onclick","click_val()");
		}
	}, "json")
}
function changeCode() {
	$('#kaptchaImage').hide().attr('src', '${ctx}/captcha.html?' + Math.floor(Math.random() * 100)).fadeIn();
}
	function click_val() {
		$('#form').submit();
	}
	var wait = 30;
	function phoneCode() {
		var _phone = $("#_phone").val();
		var code_ = $("#code_").val();
		if (_phone == '') {
			$("#msgcode").text("手机号不能为空");
			return false;
		}else if (code_  == '') {
			$("#msgcode").text("图形验证码不能为空");
			return false;
		}
		else if (_phone != '') {
			$("#msgcode").text("");
		}
		var url = "${ctx}/businessuser/phonecode.do";
		$.post(url, {
			mobile : $('#_phone').val(),
			code : $("#code_").val(),
			type : 2
		}, function(data) {
			if (data.result == "N") {
				$("#msgcode").text("发送短信验证码失败，请先确认图形验证码");
			}
			else{
				count();
			}
		}, "json");
		
	}
	function count(){
		$("#msgcode").text("");
		var o = document.getElementById("phoneCode"); 
		if (wait == 0) {
			$("#phoneCode").attr("onclick","phoneCode(this)");
			o.text = "重新获取";
			wait = 30;
		} else {
			$("#phoneCode").attr("onclick","");
			o.text = "已发送(" + wait + ")";
			wait--;
			setTimeout(function() {
				count(wait);
			}, 1000);
		}
	}
	//下面用于图片上传预览功能
	function setImagePreview(avalue) {
		var docObj = document.getElementById("doc");

		var imgObjPreview = document.getElementById("preview");
		if (docObj.files && docObj.files[0]) {
			//火狐下，直接设img属性
			imgObjPreview.style.display = 'block';
			//imgObjPreview.src = docObj.files[0].getAsDataURL();
			//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
			$("#save-btn").removeClass("disabled");
			$("#save-btn").attr("disabled", "false");
		} else {
			//IE下，使用滤镜
			docObj.select();
			var imgSrc = document.selection.createRange().text;
			var localImagId = document.getElementById("localImag");
			//必须设置初始大小 
			localImagId.style.height = "78px";
			//图片异常的捕捉，防止用户修改后缀来伪造图片
			try {
				localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				localImagId.filters
						.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			} catch (e) {
				alert("您上传的图片格式不正确，请重新选择!");
				return false;
			}
			imgObjPreview.style.display = 'none';
			document.selection.empty();
		}
		return true;
	}
</script>
	
</body>
</html>