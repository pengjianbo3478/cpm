<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<TITLE>我的关注</TITLE>
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

<style type="text/css">
.proj_btn{
 background-color: #DFDFDF;
 border: 1px solid black; 
 height: 25px; 
 width: 70px; 
 font-size: 12px;
}
ul li{  
list-style-type:none;  
}  
.liF{
	height: 45px;
    line-height: 45px;
    border-bottom: solid 1px #eaeaea;
    margin-left: 8px;
}
.proj_btn2_click{
	padding-left:25px;
	background: url(${ctx}/m/images/menu_3_2.png) no-repeat;
	background-size: 20px;
	background-position: 0;
}
.proj_btn2{
	padding-left:25px;
	background: url(${ctx}/m/images/menu_3_1.png) no-repeat;
	background-size: 20px;
	background-position: 0;
}
.proj_btn3_click{
	padding-left:25px;
	background: url(${ctx}/m/images/assets_6_1.png) no-repeat;
	background-size: 20px;
	background-position: 0;
}
.proj_btn3{
	padding-left:25px;
	background: url(${ctx}/m/images/assets_6.png) no-repeat;
	background-size: 20px;
	background-position: 0;
}
.maintype{
	float: right;
    border-radius: 10px;
    border: solid 1px #ffffff;
    height: 25px;
    line-height: 25px;
    margin: 10px 15px 0;
    text-align: center;
    width: 80px;
}
.profit{
	width: 100px;
    display: inline-block
}
</style>
</HEAD>

<body style="background-color: #f8f8f8;margin: 0px;">
	<c:set value="2" var="index" scope="session"></c:set>
	<div id="assetlist" class="j-page" style="background-color: #f8f8f8;">
		<div style="padding-bottom: 100px;">
			<div>
			<c:forEach var="item" items="${paginate.data}" varStatus="s">
				<ul style="padding: 10px 10px 0px 10px;">
					<li style="width: 100%;height: 45px; line-height: 45px;background-color: #319DE6;color: #ffffff;	">
						<span style="display: inline-block;padding-left:20px; background: url(${ctx}/m/images/assets_5.png) no-repeat;background-size: 12px;background-position: 3px;">
							${item.assets.assetsName}
						</span>
						<span class="maintype">
							<c:forEach items="${financingCategoryList}" var="financingCategory" >
					          <c:if test="${financingCategory.key eq item.assets.financingCategory}">${financingCategory.value}</c:if>
					         </c:forEach>
						</span>
					</li>
					<li>
						<span style="display: inline-block;width: 40%;text-align: center;">
							<p>融资规模</p>
							<p style="color: #FCA615; font-size: 25px; margin-top: -7px;">
							 ${item.assets.assetScales}
							 <c:forEach items="${assetUnitSelectList}" var="assetUnit" >
		                     	<c:if test="${assetUnit.key eq item.assets.assetUnit}">${assetUnit.value}</c:if>
				            </c:forEach>
							</p>
						</span>
						<span style="display: inline-block;">
							<p><span class="profit">期限</span>${item.assets.termMin}
							<c:if test="${item.assets.termMax!= NULL}"> + ${item.assets.termMax}</c:if>个月</p>
							<p><span class="profit">预计收益率</span>${item.assets.yieldMin}%<c:if test="${item.assets.yieldMax!= NULL}"> - ${item.assets.yieldMax}%</c:if></p>
						</span>
					</li>
					<li class="liF">
							<span style="color:gray; margin-left:5%;">
								已认购</span>
							<span  style="color:#85B9DD;">
							${item.offerAmount}<c:forEach items="${assetUnitSelectList}" var="assetUnit" >
			                     <c:if test="${assetUnit.key eq item.assets.assetUnit}">${assetUnit.value}</c:if>
			                 </c:forEach></span>
							<span class="${item.assets.offerCount>0?'proj_btn2_click':'proj_btn2'}" id="offer_${item.assetsId}" style="float: right">意向认购</span>		
							<span class="${item.assets.concernCount>0?'proj_btn3_click':'proj_btn3'}" id="concern_${item.id}" style="float: right;padding-right: 15px;">取消关注</span>				
					</li>
					</ul>
				</c:forEach>
			</div>
		</div>
		<jsp:include page="./Tail.jsp"></jsp:include>
	</div>
	 
<script type="text/javascript">
$(function(){ 
		$("body").delegate(".proj_btn2","click",function(){
			 var btn_id=$(this).attr("id").substring(6);
			 if(confirm("确定意向认购吗?")){
			       $.ajax({
			    	   url : "${ctx}/m/assets/changeOfferFlag.do?id="+btn_id,
					type : "POST",
					dataType:"JSON",
					success : function(data) {
						if (data.result == "Y") {
							alert("意向认购成功");
							window.location.reload();
						}else{
							alert("意向认购失败");
						}
					},
			 });
			 };
		});
		
		$(".proj_btn3").click(function(){
			var btn_id=$(this).attr("id").substring(8);
			 if(confirm("确定取消关注吗?")){
			       $.ajax({
			    	url : "${ctx}/m/assetsconcern/mergeDeletedFlag.do?id="+btn_id,
					type : "POST",
					dataType:"JSON",
					success : function(data) {
						if (data.result == "Y") {
							alert("取消关注成功");
							window.location.reload();
						}else{
							alert("取消关注失败");
						}
					},
			     	}); 
	         	};
		});
});
</script>
</body>
</html>