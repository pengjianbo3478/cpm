<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<TITLE>联系我们</TITLE>
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
<link rel="shortcut icon" href="${ctx}/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${ctx}/favicon.ico" type="image/x-icon" />
<script type="text/javascript" src="${ctx}/m/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
		function ign(string) {
			var temp = "";
			string = '' + string;
			splitstring = string.split(" ");
			for(var i = 0; i < splitstring.length; i++)
				temp += splitstring[i];
			return temp;
		}
</script>

<style type="text/css">
	.my-div{
		width:100%; border-top: 1px solid #d1d11;border-bottom: 1px solid #d1d11; 
	}
	.my-d-b{
		height:100%;color:white;
	}
</style>

<META name="GENERATOR" content="MSHTML 11.00.10240.16391">
</HEAD>
<body style="margin:0px;background-color:#f8f8f8;">
	<div id="login" class=" j-page" style="height:100%; ">
		<div  class="g-body" style="top:0px;">
      		<div style="background-color:white;margin-top:20px;">
      			<div style="height:30px;"></div>
      			<div style="align:center;">
      				<center><img  src="${ctx}/m/images/logo.png" style="height:100px;"></center>
      			</div>
      			<div style="height:20px"></div>
      			<div style="align:center;">
      				<center><img  src="${ctx}/m/images/erweima.png" style="height:90px;"></center>
      			</div>
      			<div style="font-size:16px;color:#888888;padding-top:10px;">
      				<center>识别二维码，在微信公众号"欧巴金融咨询"留言，</center>
      			</div>
      			<div style="font-size:16px;color:#888888;">
      				<center>我们会及时回复您的问题</center>
      			</div>
      			<div style="height:30px;"></div>
      		</div>
      		<div style="height:20px;"></div>
			<ul style="height:220px;background-color:white;margin:0px;list-style: none;">
		<li style="height:60px;line-height:60px;border-bottom:1px solid #d1d1d1;">
		<span style="background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/Telephone.png) no-repeat;background-size: 18px;font-size:18px;background-position:2px 0px ;color:#333333;" >电话</span>
	    <span style=" font-size: 18px; color:#319de6;float: right; height: 30px; line-height: 60px; text-align: center;padding-right:5%; ">
	010-50854580
	</span></li>
	<li style="height:60px;line-height:60px;border-bottom:1px solid #d1d1d1;">
		<span style="background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/email01.png) no-repeat;background-size: 18px;font-size:18px;background-position:2px 0px ;color:#333333;" >邮箱</span>
	    <span style=" font-size: 18px; color:#888888;float: right; height: 30px; line-height: 60px; text-align: center;padding-right:5%; ">
	9hjf@9hjf.com
	</span></li>
	<li style="height:100px;line-height:60px;">
		<span style="background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/address01.png) no-repeat;background-size: 18px;font-size:18px;background-position:2px 0px ;color:#333333;" >地址</span>
	    <div style="float:right;">
	    <span style=" font-size: 18px; color:#888888;float: right; height: 30px; line-height: 60px; text-align: center;padding-right:5%; ">
	深圳市福田区商报路2号
	</span>
	<p style=" font-size: 18px; color:#888888;float: right; margin:0;height: 30px; line-height: 60px; text-align: center;padding-right:5%; ">
	奥林匹克大厦12层
	</p>
	</div>
	</li>
		</ul>

			</div> 
			</div>
   	 
        
</body>

</html>