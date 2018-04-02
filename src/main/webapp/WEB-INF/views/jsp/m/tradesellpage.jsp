<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<TITLE>出让资产</TITLE>
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
<style type="text/css">
	.cell-t {
	width: 20%;
}
.t0 {
	padding-left: 8%;
	padding-right: 8%;
	width: 100%;
	display: table;
}
ul, li {
    list-style: none;
    margin: 0;
    padding: 0;
}
.f12 {
    font-size: 12px;
}
.cell {
    display: table-cell;
}
.tc {
    text-align: center;
}
.p0 {
    padding: 0;
}
.m0 {
    margin: 0;
}
.t0 {
    top: 0;
}
.t1{
	height: 40px;
	line-height: 40px;
}
a{
	    color: #1e1e1e;
}
.sx{
	    width: 50px;
    height: 30px;
    line-height: 30px;
    border: 1px solid #A1CEEC;
    float: right;
    background: url(/cpm/m/images/assets_7.png) no-repeat 0 7px;
    background-size: 16px;
    background-position: 10px;
    padding-left: 20px;
    border-radius: 12px;
    margin-top: 10px;
    text-align: center;
    color: #A1CEEC;
}
.liF{
	height: 45px;
    line-height: 45px;
    border-bottom: solid 1px #eaeaea;
}
.subscribe{
	border-top: 1px solid #d1d1d1;
	padding: 0;
	margin-bottom: 10px; 
	background: url(${ctx}/m/images/subscribe.png) no-repeat;
	background-position: 66% 0px;
    background-size: 100px;
}
.subscribe1{
	border-top: 1px solid #d1d1d1;
	padding: 0;
	margin-bottom: 10px; 
	background:#ffffff;
}
.tradelogo{
	height: 20px;
    margin-right: 5px;
}
.statusS{
	float: right;
    height: 40px;
    border: none;
    width: 100px;
}
}

</style>

<META name="GENERATOR" content="MSHTML 11.00.10240.16391">
</HEAD>

<body style="background-color:#f8f8f8;">
<c:set value="3" var="index" scope="session"></c:set>
	<div id="assetlist" class="j-page" style="background-color:#f8f8f8;">
	<div style="height:50px;background-color:white;text-align:center;line-height:50px;">
		<a href="#">
			<span style="width:50%;float: left;color:#319de6;font-size:22px;border-bottom:solid 2px #309EE9;">
				<img class="tradelogo" alt="" src="${ctx }/m/images/trade_1_2.png">出让资产
			</span>
		</a>
		<a href="#" onclick="toPage('${ctx}/m/assetsDeal/subscribeproperty.do');">
			<span style="width:50%;float: right;color:#888888;font-size:22px;">
				<img class="tradelogo" alt="" src="${ctx }/m/images/trade_2_1.png">认购资产
			</span>
		</a>
	</div>
		<div class="g-body"   style="padding-bottom: 100px;">
		<div style="height:46px;line-height:46px;margin-left:5%; margin-top: 1px;">
			<button style="background-color: #319de6;border:1px solid #d1d1d1;height:30px;width:80px;border-radius:15px;color: white;">浏览次数</button>&nbsp;&nbsp;
			<span style="background: url(/cpm/m/images/assets_9.png) no-repeat;background-size: 14px;padding-right: 30px;background-position: 70px 3px;">意向认购</span>
			<select class="statusS" id="status">
				<option value=" " >显示全部</option>
				<option value="OL">已发布</option>
				<option value="PA">待审核</option>
				<option value="DF">未提交</option>
				<option value="OF">已失效</option>
			</select>	
				
		</div>
		
		<div>
			
				<c:forEach var="item" items="${paginate.data}" varStatus="status">
				<form action="${ctx}/m/assetsDeal/assetside.do" name="form${status.index}" accept-charset="utf-8" >
				<a href="javascript:void(0)" onclick="document.forms['form${status.index}'].submit();">
					<ul id="ds" class=" ${item.fundStatus == 'CS' ? 'subscribe':'subscribe1'}">
					<li class="liF">
						<span style="margin-left:5px;background-position:0 5px;padding-left:20px; background: url(${ctx}/m/images/assets_5.png) no-repeat;background-size: 12px;font-size:18px;background-position:0 3px;" >${item.assetsName}</span>
						<span style="width: 100px; font-size: 14px; float: right; height: 30px; line-height: 30px;color:#a8a8a8;margin: 7px 10px 0;">
							浏览次数：${item.countBrowseAssets}
				        </span>
					</li>
					<li style="border-bottom: solid 1px #eaeaea;height: 100px;">
						<span style="display: inline-block;width: 20%;">
							<p style="color: #383838;text-align: center;font-size: 20px;font-weight: bold;">${item.countJinTiaoAssets }</p>
							<p style="text-align: center;color: #a8a8a8">尽调</p>
						</span>
						<span style="display: inline-block;width: 20%;">
							<p style="color: #383838;text-align: center;font-size: 20px;font-weight: bold;">${item.countStartCheckAssets }</p>
							<p style="text-align: center;color: #a8a8a8">开始评审</p>
						</span>
						<span style="display: inline-block;width: 20%;">
							<p style="color: #383838;text-align: center;font-size: 20px;font-weight: bold;">${item.countPassCheckAssets }</p>
							<p style="text-align: center;color: #a8a8a8">通过评审</p>
						</span>
						<span style="display: inline-block;width: 20%;">
							<p style="color: #383838;text-align: center;font-size: 20px;font-weight: bold;">${item.countFinishAssets }</p>
							<p style="text-align: center;color: #a8a8a8">完成认购</p>
						</span>
						<span style="display:block;float:right;margin:20px 10px 0 0;width: 45px;height: 45px;line-height: 45px;border-radius: 50%;background-color: #319de6;text-align: center;color:#ffffff;">
							管理
						</span>
						<input type="hidden" id="assetId" name="assetId" value="${item.id}">
					</li>
						<li class="liF">
						<span style="color:#9e9e9e; margin-left:5%;">意向认购：<span style="color: #3e9de6;">${item.countIntentionAssets}</span></span>
						</li>
				</ul>
				</a>
				</form>
				</c:forEach>
		
		</div>
		 <div  style='text-align:center;margin-top: 8px;margin-bottom: 15px;color: #999999;'><span  id="noMore"></span></div>
		</div>
	 <jsp:include page="Tail.jsp"/> 
	</div>
<script type="text/javascript">
function toPage(pageUrl){
	window.location.href=pageUrl;
};
</script>
</body>
</html>