<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<HTML>
<HEAD class="header">
<META content="IE=11.0000" http-equiv="X-UA-Compatible">
<TITLE>资产发布</TITLE>
<META charset="utf-8">
<META name="keywords" content="">
<META name="description" content="">
<META name="viewport"
	content="user-scalable=no,initial-scale=1.0,maximum-scale=1.0,width=device-width,min-width=800px">
<META name="apple-mobile-web-app-title" content="">
<META name="apple-mobile-web-app-capable" content="yes">
<META name="apple-mobile-web-app-status-bar-style"
	content="black-translucent">
<META name="format-detection" content="telephone=no">
<META name="format-detection" content="email=no">
<META name="renderer" content="webkit|ie-comp|ie-stand">
<script type="text/javascript" src="${ctx}/m/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
	function getFile1() {
		document.getElementById("uploadImage1").click();
	}
</script>
<style type="text/css">
.liF{
	height: 45px;
    line-height: 45px;
    border-bottom: solid 1px #eaeaea;
}
.subscribe{
	border-left: solid 2px #FFA200;
	margin-left: 5px;
	border-top: 1px solid #d1d1d1;
	padding: 0;
	margin-bottom: 10px; 
	background-color: #ffffff;
}
.buttype{
	display: block;
    float: right;
    margin: 28px 10px 0 0;
    width: 45px;
    height: 45px;
    line-height: 45px;
    border-radius: 50%;
    background-color: #319de6;
    text-align: center;
    color: #ffffff;
    font-size: 12px;
}
</style>

<META name="GENERATOR" content="MSHTML 11.00.10240.16391">
</HEAD>

<body style="background-color: #f8f8f8;margin: 0px;">
	<c:set value="1" var="index" scope="session"></c:set>
		<div class="g-body" style="padding-bottom: 100px;">
			<div style="height: 50px;background-color: white;margin-bottom: 10px;">
				<img alt="" src="${ctx }/m/images/assets_11.png" style="margin: 10px 10px 0;float: left;">
				<p style="color: #0099FF;float: left;">上传项目说明书</p>
			</div>
			<c:forEach var="item" items="${paginate.data }" varStatus="status">
					<ul id="ds" class="subscribe" onclick="window.location.href='${ctx }/m/assets/projectmanage.do?id=${item.id}&status=${item.status}'">
					<li class="liF">
						<span style="margin-left:5px;background-position:0 5px;padding-left:20px; background: url(${ctx}/m/images/assets_5.png) no-repeat;background-size: 12px;font-size:18px;background-position:0 3px;" >${item.assetsName }</span>
						<span style="width: 80px; font-size: 14px; float: right; height: 30px; line-height: 30px; border: solid 1px gray;color:#7DB6E3; text-align: center; border-radius: 12px; margin: 7px 10px 0;">
						<c:if test="${item.status == 'OL'}">
							已发布
						</c:if>	
						<c:if test="${item.status == 'PA'}">
							待审核
						</c:if>	
						<c:if test="${item.status == 'DF'}">
							未提交
						</c:if>	
						<c:if test="${item.status == 'OF'}">
							已失效
						</c:if>	
							
				        </span>
					</li>
					<li style="border-bottom: solid 1px #eaeaea;height: 100px;">
						<span style="display: inline-block;width: 30%;padding-left:5%;">
							<p style="color: gray;">融资规模</p>
							<p style="font-size: 20px;">
								<span style="font-size: 20px;">${item.assetScales}
								<c:forEach items="${assetUnitSelectList}" var="assetUnit">
									<c:if test="${assetUnit.key eq item.assetUnit}">${assetUnit.value}</c:if>
								</c:forEach>
								</span>
							 </p>
						</span>
						<span style="display: inline-block;width: 30%;">
							<p style="color: gray;">融资主体</p>
							<p style="font-size: 20px;"> 
							<c:forEach items="${financingCategoryList}" var="financingCategory">
									<c:if test="${financingCategory.key eq item.financingCategory}">${financingCategory.value}</c:if>
							</c:forEach>
							</p>
						</span>
					     <c:if test="${item.status=='DF'}">
					    	<span class="buttype">
							提交
							</span>
					     </c:if>
					     <c:if test="${item.status=='OL'}">
					    	<span class="buttype">
							终止
							</span>
					     </c:if>
						 <c:if test="${item.status!='PA'}">
					     	<span class="buttype" style="background-color: #ffa200;">
								修改
							</span>
					     </c:if>
					</li>
						<li class="liF">
						<span style="color:gray; margin-left:5%;">
							<img alt="" src="${ctx}/m/images/assets_10.png" style="margin-top: 10px;">
							发布时间:<f:formatDate value="${item.updatedDate}" pattern="yyyy-MM-dd HH:mm:ss " />
						</span>
						</li>
					</ul>
			</c:forEach>
				
			<div
				style='text-align: center; margin-top: 8px; margin-bottom: 15px; color: #999999;'>
				<span id="noMore"></span>
			</div>
			<jsp:include page="Tail.jsp"/> 
		</div>
	
</body>
</HTML>