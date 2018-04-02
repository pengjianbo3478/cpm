<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<TITLE>出让资产详情</TITLE>
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
<script type="text/javascript"
	src="${ctx}/js/common/my97DatePicker/WdatePicker.js?v=1.0.0"></script>
<style type="text/css">
li {
	list-style-type: none;
}
#dateOfInterest,#dueDate{
	float:right;
	margin-top: 20px;
	height: 40px;
	border:none;
	width: 200px;
	text-align: center;
	background: url(${ctx}/m/images/right.png) no-repeat;
	background-position: 150px ; 
	background-size: 10px;
}
</style>

<META name="GENERATOR" content="MSHTML 11.00.10240.16391">
</HEAD>

<body style="background-color: #f8f8f8; margin: 0px;">
	<c:set value="3" var="index" scope="session"></c:set>
	<div id="assetlist" class="j-page" style="background-color: #f8f8f8;">
		<div class="g-body" style="padding-bottom: 100px;">
			<div id="header" style="height: 300px; background-color: #35A3E9;">
				<div
					style="padding-top: 70px; font-size: 20px; color: #fff; text-align: center;">
					<span>${assets.assetsName}</span>
				</div>
				<div
					style="padding-top: 50px; height: 70px; width: 100%; text-align: center;">
					<span
						style="display: inline-block; width: 22%; text-align: center; border-right: 1px solid #7dc9f3; height: 80px;">
						<p style="color: #fff; font-size: 20px;">
							<c:forEach items="${financingCategoryList}"
								var="financingCategory">
								<c:if
									test="${financingCategory.key eq assets.financingCategory}">${financingCategory.value}</c:if>
							</c:forEach>
							<c:if test="${financingCategory.value == null}">

							</c:if>
						</p>
						<p style="font-size: 16px; color: #d1e7f9;">融资类型</p>
					</span> <span
						style="display: inline-block; width: 22%; text-align: center; border-right: 1px solid #7dc9f3; height: 80px;">
						<p style="color: #fff; font-size: 20px;">
							<c:if test="${assets.assetScales == null}">0.00</c:if>
							${assets.assetScales}
							<c:forEach items="${assetUnitSelectList}" var="assetUnit">
								<c:if test="${assetUnit.key eq assets.assetUnit}">${assetUnit.value}</c:if>
							</c:forEach>
						</p>
						<p style="font-size: 16px; color: #d1e7f9;">融资规模</p>
					</span> <span
						style="display: inline-block; text-align: center; height: 80px; width: 22%; border-right: 1px solid #7dc9f3;">
						<p style="color: #fff; font-size: 20px;">
							${assets.termMin}
							<c:if test="${assets.termMax!= NULL}">+${assets.termMax}</c:if>
							个月
						</p>
						<p style="font-size: 16px; color: #d1e7f9;">期限</p>
					</span> <span
						style="display: inline-block; text-align: center; height: 80px; width: 22%;">
						<p style="color: #fff; font-size: 20px;">
							${assets.yieldMin}%
							<c:if test="${item.assets.yieldMax!= NULL}">-${assets.yieldMax}%</c:if>
						</p>
						<p style="font-size: 16px; color: #d1e7f9;">预计收益率</p>
					</span>
				</div>
			</div>
			<div
				style="padding-top: 20px; font-size: 20px; color: #33333; text-align: center;">
				<span>我的进度</span>
			</div>
			<div style="padding-top: 15px;">
				<span
					style="width: 80%; height: 2px; background-color: #319de6; display: inline-block; margin-left: 10%;"></span>
			</div>
			<div style="width: 100%; padding-top: 15px; color: #33333;">
				<a onclick=""><span
					style="width: 25%; display: inline-block; text-align: center;">立项</span></a>
				<a><span
					style="width: 25%; display: inline-block; text-align: center;">开始审批</span></a>
				<a><span
					style="width: 25%; display: inline-block; text-align: center; float: left;">通过评审</span></a>
				<a><span
					style="width: 22%; display: inline-block; text-align: center; float: right;">发行</span></a>
			</div>

			<div style="height: 20px; background-color: #f8f8f8;"></div>
			<div>
			<form:form commandName="assets" action="${ctx}/assetsdeal/merge.do" modelAttribute="assets" method="POST"> 
				<ul
					style="height: 160px; list-style: none; border-bottom: 1px solid #d1d1d1; border-top: 1px solid #d1d1d1; background-color: #fff; margin: 0;">
					<li
						style="height: 80px; border-bottom: 1px solid #d1d1d1; line-height: 80px;">
						<span>起息日</span>
						<form:input path="dateOfInterest" readOnly="true" 
							onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
					
					</li>
					<li style="height: 80px; line-height: 80px;"><span>到期日</span>
							<form:input path="dueDate" readOnly="true"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
					</li>
				</ul>
			</form:form>	
			</div>
			<div style="height: 20px; background-color: #f8f8f8;"></div>
			<div style="height: 10px; background-color: #f8f8f8;"></div>
			<c:forEach var="item" items="${paginate.data}" varStatus="s">
				<ul
					style="background-color: #fff; width: 100%; padding: 0; margin: 0;">
					<li
						style="height: 60px; border-bottom: 1px solid #d1d1d1; width: 100%; line-height: 60px;">
						<span style="color: #333; font-size: 18px; padding-left: 5%;">${item.institutionName}</span>
						<span
						style="width: 130px; font-size: 14px; float: right; height: 30px; line-height: 30px; background-color: #ffb400; color: #fff; text-align: center; border-radius: 12px; margin: 15px 30px 0;">
							<span
							style="width:140px;background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/assets_10.png) no-repeat;background-size: 16px;font-size:16px;background-position:2px 1px ;">
								提醒更新 </span>
					</span>
					</li>
					<li
						style="height: 100px; border-bottom: 1px solid #d1d1d1; width: 100%; line-height: 100px;"></li>
					<li
						style="border-bottom: 1px solid #d1d1d1; width: 100%; line-height: 60px; height: 60px;">
						<span
						style="background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/shouyi.png) no-repeat;background-size: 16px;font-size:18px;background-position:2px 1px ;">认购金额</span>
						<span
						style="font-size: 18px; color: #35A3E9; float: right; line-height: 60px; text-align: center; padding-right: 5%;">
							${item.offerAmount}${item.amountUnit} </span>
					</li>
					<li
						style="border-bottom: 1px solid #d1d1d1; width: 100%; line-height: 60px; height: 60px;">
						<span
						style="background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/linkman.png) no-repeat;background-size: 16px;font-size:18px;background-position:2px 1px ;">联系人</span>
						<span
						style="font-size: 18px; color: #35A3E9; float: right; line-height: 60px; text-align: center; padding-right: 5%;">
							${item.name} </span>
					</li>
					<li
						style="border-bottom: 1px solid #d1d1d1; width: 100%; line-height: 60px; height: 60px;">
						<span
						style="background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/contactway.png) no-repeat;background-size: 16px;font-size:18px;background-position:2px 1px ;">联系方式</span>
						<span
						style="font-size: 18px; color: #35A3E9; float: right; line-height: 60px; text-align: center; padding-right: 5%;">
							${item.phone} </span>
					</li>

				</ul>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="Tail.jsp" />


</body>
</html>