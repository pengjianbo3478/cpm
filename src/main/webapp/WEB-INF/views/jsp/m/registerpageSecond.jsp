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
<TITLE>上传文件 </TITLE>
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
<link href="${ctx}/m/css/login.css" rel="stylesheet" type="text/css">
<link href="${ctx}/m/css/comm.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${ctx}/m/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.validate.js"></script>
<script src="${ctx}/js/my_comm.js" charset="UTF-8"></script>
<script src="${ctx}/js/businessuser/add.js"></script>


<style type="text/css">
td{
	border-bottom: 1px solid #eaeaea;
}
a{
	text-decoration:none;
}
body{
	margin: 0px;
	background: none;
}

.introduce{
	text-align: left;
    display: block;
    height: 40px;
    line-height:40px;
    border-top: solid 1px #eaeaea;
    border-bottom: solid 1px #eaeaea;
    font-size: 1.2em;
    color: #7DC4F5;
    padding: 10px;
    background-color: white;
    padding-left: 20px;
}
dd{
	border-bottom: solid 1px #eaeaea;
}
</style>
<META name="GENERATOR" content="MSHTML 11.00.10240.16391">
</HEAD>
<body style="background-color:#f8f8f8">
	<div  class="j-page" style="background-color:#f8f8f8">
	<div style="width: 100%;text-align: center;">
			<img src="${ctx}/m/images/tree.png" width="100%" style="margin: 0 auto 10px auto"/>
		<span class="introduce">
			上传附件
		</span>	
	</div>
	<form:form commandName="businessUser" modelAttribute="businessUser" action="${ctx}/m/authority/registerfinish.do" method="post" id="businessuser" enctype="multipart/form-data">
		<div class="m-reg m-reg2">
				<div class="m_login_wrap" style="background-color: #ffffff;width:100%;">
					<div class="main"  style="background-color: #ffffff;width:100%;padding:0px;">
						<dl class="dl1" style="width:100%">
							<dd style="width:100%">
								<div class="file-box1" style="wi">
									<input style="height: 45px; line-height: 45px;" type="text" id="textfield1" class="txt1" placeholder="上传身份证/工作证">
									<input type="button" class="btn1" value="浏览..." style="background: #309de6;">
									<input style="width:100%;height: 45px; line-height: 45px;" type="file" name="myfiles1" class="file1" id="myfiles1" size="28" onchange="document.getElementById('textfield1').value=this.value;document.getElementById('textfield1').style.textIndent='5px'">
								</div>
								<em class="error"></em>
							</dd>
						</dl>
						<dl class="dl1" style="width:100%">
							<dd style="width:100%"> 
								<div class="file-box1">
									<input style="height: 45px; line-height: 45px;" type="text" id="textfield2" class="txt1" placeholder="上传名片">
									<input type="button" class="btn1" value="浏览..." style="background: #309de6;">
									<input style="width:100%;height: 45px; line-height: 45px;" type="file" name="myfiles2" class="file1" id="myfiles2" size="28" onchange="document.getElementById('textfield2').value=this.value;document.getElementById('textfield2').style.textIndent='5px'">
								</div>
								<em class="error"></em>
							</dd>
						</dl>
						<dl class="dl1" style="width:100%">
							<dd style="width:100%"> 
								<div class="file-box1">
									<input style="height: 45px; line-height: 45px;" type="text" id="textfield3" class="txt1" placeholder="上传其他证明文件">
									<input type="button" class="btn1" value="浏览..." style="background: #309de6;">
									<input style="width:100%;height: 45px; line-height: 45px;" type="file" name="myfiles3" class="file1" id="myfiles3" size="28" onchange="document.getElementById('textfield3').value=this.value;document.getElementById('textfield3').style.textIndent='5px'">
								</div>
							</dd>
						</dl>
					</div>
				</div>
				<div class="m_login_blac"></div>
			</div>
		<div style="text-align: center;">
			<input type="hidden" name="institutionName" value="${businessUser.institutionName}"/>
			<input type="hidden" name="name" value="${businessUser.name}"/>
			<input type="hidden" name="email" value="${businessUser.email}"/>
			<input type="hidden" name="phone" value="${businessUser.phone}"/>
			<input type="submit" name="" value="注 册" style="background: #319DE6;border: none; border-radius:4px;width: 80%;height: 45px;margin: 15px auto 15px auto;color:#ffffff;">
			<div class="input_wrap link clearfix">
				<label>
					<a class="u-protocol" href="" target="_blank">《平台服务条款》</a>
					<a class="u-protocol" href="" target="_blank">《会员管理协议》</a>
				</label>
			</div>
			<input type="button" name="" onclick="window.location.href='${ctx}/authority/login.do'" value="已有账户?直接登陆" style="background: #ffffff;border: solid 1px #eaeaea; border-radius:4px;width: 80%;height: 45px;margin-top: 45px;">
		</div>
	</form:form>			
    </div>
</body>
<script type="text/javascript" charset="UTF-8">
	function changeCode() {
		$('#kaptchaImage').hide().attr(
				'src',
				'${ctx}/checkcode/captcha.do?'
						+ Math.floor(Math.random() * 100)).fadeIn();
		event.cancelBubble = true;
	}
	function phoneCode(){
		var url = "${ctx}/businessuser/phonecode.do";
		$.post(url,{mobile:$('#_phone').val()},function(data){
			if(data.result=="Y"){
				alert("获取成功");
			}else{
				alert(2);
			}
		},"json");
	}
</script>
</html>

