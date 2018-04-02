<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<TITLE>账户管理</TITLE>
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
<script type="text/javascript" src="${ctx}/m/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
var  errorTips = '${errorTips}';
if(errorTips!=null && ''!=errorTips && 'undefined'!=errorTips){
	 alert(errorTips);
}
</script>
<script type="text/javascript">
		function ign(string) {
			var temp = "";
			string = '' + string;
			splitstring = string.split(" ");
			for(var i = 0; i < splitstring.length; i++)
				temp += splitstring[i];
			return temp;
		}
		
		$(document).ready(function(){
			var path = '<%= request.getContextPath()%>';
			var name = "/images/headPortrait/"+'${photo}';
			$("#uploadPreview").attr("src",path+name);
		});
		
</script>

<META name="GENERATOR" content="MSHTML 11.00.10240.16391">
</HEAD>

<body style="background-color:#f8f8f8;margin: 0px;">
   <c:set value="4" var="index" scope="session"></c:set>
	<div id="myAccount" class=" j-page" style="background-color:#f8f8f8;height:100%;margin: 0 0 110px 0">
		<div  class="g-body">
		<div style="background-color:#309de6;height:300px;">
		<div style="text-align:center;padding-top:20px;color:#fffff;font-size:20px;"><img alt="" src="${ctx}/m/images/headpicture.png;"/></div>
		<div style="text-align:center;color:#e3f3ec;font-size:16px;"><p>尊敬的${businessUser.name },您好！<p>
		<p>已发布项目数：&nbsp;&nbsp;意向认购项目数：</p>
		</div>
		</div>
		<div style="background-color:#f8f8f8;height:20px;"></div>
		<ul style="height:180px;background-color:white;border-top:1px solid #d1d1d1;border-bottom:1px solid #d1d1d1;margin:0px;list-style: none;">
		<li style="height:60px;line-height:60px;border-bottom:1px solid #d1d1d1;">
		<span style="background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/InstitutionName.png) no-repeat;background-size: 18px;font-size:18px;background-position:2px 0px ;color:#333333;" >机构名称</span>
	    <span style=" font-size: 18px; color:#888888;float: right; height: 30px; line-height: 60px; text-align: center;padding-right:5%; ">
	${businessUser.institutionName }
	</span></li>
	<li style="height:60px;line-height:60px;border-bottom:1px solid #d1d1d1;">
		<span style="background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/department.png) no-repeat;background-size: 18px;font-size:18px;background-position:2px 0px ;color:#333333;" >部门</span>
	    <span style=" font-size: 18px; color:#888888;float: right; height: 30px; line-height: 60px; text-align: center;padding-right:5%; ">
	${businessUser.department }
	</span></li>
	<li style="height:60px;line-height:60px;">
		<span style="background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/position.png) no-repeat;background-size: 18px;font-size:18px;background-position:2px 0px ;color:#333333;" >职位</span>
	    <span style=" font-size: 18px; color:#888888;float: right; height: 30px; line-height: 60px; text-align: center;padding-right:5%; ">
	${businessUser.jobTitle}
	</span></li>
		</ul>
		<div style="background-color:#f8f8f8;height:20px;"></div>
	<ul style="height:240px;background-color:white;border-top:1px solid #d1d1d1;border-bottom:1px solid #d1d1d1;margin:0px;list-style: none;">
		<li style="height:60px;line-height:60px;border-bottom:1px solid #d1d1d1;">
		<span style="background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/phone.png) no-repeat;background-size: 18px;font-size:18px;background-position:2px 0px ;color:#333333;" >手机号</span>
	    <span style=" font-size: 18px; color:#888888;float: right; height: 30px; line-height: 60px; text-align: center;padding-right:5%; ">
	${phone1}
	</span></li>
	<li style="height:60px;line-height:60px;border-bottom:1px solid #d1d1d1;">
		<span style="background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/Telephone.png) no-repeat;background-size: 18px;font-size:18px;background-position:2px 0px ;color:#333333;" >固话</span>
	    <span style=" font-size: 18px; color:#888888;float: right; height: 30px; line-height: 60px; text-align: center;padding-right:5%; ">
	${businessUser.telNum}
	</span></li>
	<li style="height:60px;line-height:60px;border-bottom:1px solid #d1d1d1;">
		<span style="background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/email01.png) no-repeat;background-size: 18px;font-size:18px;background-position:2px 0px ;color:#333333;" >邮箱</span>
	    <span style=" font-size: 18px; color:#888888;float: right; height: 30px; line-height: 60px; text-align: center;padding-right:5%; ">
	${email01 }
	</span></li>
	<li style="height:60px;line-height:60px;">
		<span style="background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/card.png) no-repeat;background-size: 18px;font-size:18px;background-position:2px 0px ;color:#333333;" >名片</span>
	    <span style=" font-size: 18px; color:#888888;float: right; height: 30px; line-height: 60px; text-align: center;padding-right:5%;padding-top:12px; ">
	<img alt="" src="${ctx}/m/images/right.png">
	</span></li>
		</ul>
		<div style="background-color:#f8f8f8;height:20px;"></div>
		<ul style="height:60px;background-color:white;border-top:1px solid #d1d1d1;border-bottom:1px solid #d1d1d1;margin:0px;list-style: none;">
		<li style="height:60px;line-height:60px;" onclick="window.location.href='${ctx}/m/user/changepassword.do'">
		<span style="background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/password.png) no-repeat;background-size: 18px;font-size:18px;background-position:2px 0px ;color:#333333;" >修改密码</span>
	    <span style=" font-size: 18px; color:#888888;float: right; height: 30px; line-height: 60px; text-align: center;padding-right:5%;padding-top:12px; ">
	<img alt="" src="${ctx}/m/images/right.png">
	</span></li>
		</ul>
		<div style="background-color:#f8f8f8;height:20px;"></div>
		<ul style="height:60px;background-color:white;border-top:1px solid #d1d1d1;border-bottom:1px solid #d1d1d1;margin:0px;list-style: none;">
		<li style="height:60px;line-height:60px;" onclick="window.location.href='${ctx}/m/user/contactus.do'">
		<span style="background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/accountmanage.png) no-repeat;background-size: 18px;font-size:18px;background-position:2px 0px ;color:#333333;" >联系我们</span>
	    <span style=" font-size: 18px; color:#888888;float: right; height: 30px; line-height: 60px; text-align: center;padding-right:5%; padding-top:12px;">
	<img alt="" src="${ctx}/m/images/right.png">
	</span></li>
		</ul>
		
		<div style="text-align: center;background-color: #f8f8f8;padding-top:25px;padding-bottom:100px;">
			<a target="" href="${ctx}/m/user/changeuserinfo.do">
			 <button style="width: 40%;height: 60px;background-color:#f8f8f8;color:#309de6;border:1px solid #309de6;border-radius: 20px;font-size:18px;">
			 	修改个人信息
			 </button>
			</a>
		</div>
		</div>
		
		
		</div>
		<jsp:include page="Tail.jsp"/> 
	
</body>
</html>