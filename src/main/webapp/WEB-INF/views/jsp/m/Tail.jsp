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
<style type="text/css">
.menuA{
	width: 20%;
    display: inline-block;
    margin-left: -8px;
    
}
.menuW{
	height: 20px;
	margin-top: 5px;
	margin-bottom:-10px;
}
a{
	text-decoration:none;
	color:black;
}
</style>
</HEAD>
<body>
 <div class="privateTail" style="background-color:#ffffff; position:fixed;bottom:0px;width:100%;z-index: 9;text-align: center;" >
       <c:if test="${index==0 }">
	    	<a class="menuA" href="${ctx}/m/assets/assetlist.do" class="pTailTitle" style="color:#309de6;">
	    	<img class="menuW" class="menuW" src="${ctx}/m/images/menu_1_2.png" id="pt0">
	    	<p>资产信息</p></a>
		</c:if>
		<c:if test="${index!=0 }">
			<a class="menuA" href="${ctx}/m/assets/assetlist.do" class="pTailTitle">
			<img class="menuW" src="${ctx}/m/images/menu_1_1.png" id="pt0" >
			<p>资产信息</p></a>
		</c:if>
		<c:if test="${index==1}">
		    <a class="menuA" href="${ctx}/m/assets/assetrelease.do" class="pTailTitle">
		    <img class="menuW" src="${ctx}/m/images/menu_2_2.png" id="pt1">
		    <p>资产发布</p></a>
		</c:if>
		<c:if test="${index!=1}">
		    <a class="menuA" href="${ctx}/m/assets/assetrelease.do" class="pTailTitle">
		    <img class="menuW" src="${ctx}/m/images/menu_2_1.png" id="pt1">
		    <p>资产发布</p></a>
		</c:if>
		<c:if test="${index==2}">
		   <a class="menuA" href="${ctx}/m/assetsconcern/myconcern.do"  class="pTailTitle" style="color:#309de6;">
		   <img class="menuW" src="${ctx}/m/images/menu_3_2.png" id="pt2">
		   <p>我的关注</p></a>
		</c:if>
		<c:if test="${index!=2}">
		   <a class="menuA" href="${ctx}/m/assetsconcern/myconcern.do"  class="pTailTitle">
		   <img class="menuW" src="${ctx}/m/images/menu_3_1.png" id="pt2">
		   <p>我的关注</p></a>
		</c:if>
		<c:if test="${index==3}">
			<a class="menuA" href="${ctx}/m/assetsDeal/sellproperty.do"  class="pTailTitle" style="color:#309de6;">
			<img class="menuW" src="${ctx}/m/images/menu_4_2.png" id="pt3">
			<p>交易管理</p></a>
		</c:if>
		<c:if test="${index!=3}">
			<a class="menuA" href="${ctx}/m/assetsDeal/sellproperty.do"  class="pTailTitle">
			<img class="menuW" src="${ctx}/m/images/menu_4_1.png" id="pt3">
			<p>交易管理</p></a>
		</c:if>
		<c:if test="${index==4}">
			<a class="menuA" href="${ctx}/m/user/accountmanage.do"  class="pTailTitle" style="color:#309de6;">
			<img class="menuW" src="${ctx}/m/images/menu_5_2.png" id="pt4">
			<p>账户管理</p></a>
		</c:if>
		<c:if test="${index!=4}">
			<a class="menuA" href="${ctx}/m/user/accountmanage.do"  class="pTailTitle">
			<img class="menuW" src="${ctx}/m/images/menu_5_1.png" id="pt4">
			<p>账户管理</p></a>
		</c:if>
</div>
 </body>
 </HTML>