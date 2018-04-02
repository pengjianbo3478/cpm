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
<TITLE>认购资产</TITLE>
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
</style>

<META name="GENERATOR" content="MSHTML 11.00.10240.16391">
</HEAD>

<body style="background-color:#f8f8f8;margin: 0px;">
<c:set value="3" var="index" scope="session"></c:set>
	<div id="assetlist" class="j-page" style="background-color:#f8f8f8;">
		<div style="height:50px;background-color:white;text-align:center;line-height:50px;">
		<a href="#" onclick="toPage('${ctx}/m/assetsDeal/sellproperty.do');">
			<span style="width:50%;float: left;color:#888888;font-size:22px;"><img alt="" class="tradelogo" src="${ctx }/m/images/trade_1_1.png">出让资产</span>
		</a>
		<a href="#" ">
			<span style="width:50%;float: right;color:#319de6;font-size:22px;border-bottom:solid 2px #309EE9;"><img alt="" class="tradelogo" src="${ctx }/m/images/trade_2_2.png">认购资产</span>
		</a>
	</div>
		<div class="g-body"   style="padding-bottom: 100px;">
		<div style="height:46px;line-height:46px;margin-left:5%;margin-top: 1px;">
			<button style="background-color: #319de6;border:1px solid #d1d1d1;height:30px;width:80px;border-radius:15px;color: white;">融资规模</button>&nbsp;&nbsp;
			<span style="background: url(/cpm/m/images/assets_9.png) no-repeat;background-size: 14px;padding-right: 30px;background-position: 60px 3px;">收益率</span>
		     <span style="width: 150px; font-size: 14px; float: right; height: 30px; line-height: 30px; border: solid 1px #319de6;color:#319de6; text-align: center; border-radius: 12px; margin: 7px 30px 0;">
				<span style="width:140px;background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/assets_10.png) no-repeat;background-size: 16px;font-size:16px;background-position:2px 1px ;" >
				 融资主体类型
				</span>	
		   </span>
		<span style="width: 120px; font-size: 14px; float: right; height: 30px; line-height: 30px; border: solid 1px #319de6;color:#319de6; text-align: center; border-radius: 12px; margin: 7px 30px 0;">
		<span style="width:100px;background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/assets_10.png) no-repeat;background-size: 16px;font-size:16px;background-position:2px 1px ;" >
				 进度
				</span>
				</span>
		</div>
		<div>
				<c:forEach var="item" items="${paginate.data}" varStatus="status">
					<ul id="ds" class=" ${item.fundStatus == 'CS' ? 'subscribe':'subscribe1'}" 
					onclick="window.location.href='${ctx}/m/assetsDeal/fundside.do?id=${item.id}&userId=${item.userId}'">
					<li class="liF">
						<span style="margin-left:5px;background-position:0 5px;padding-left:20px; background: url(${ctx}/m/images/assets_5.png) no-repeat;background-size: 12px;font-size:18px;background-position:0 3px;" >${item.assetsName}</span>
					</li>
					<li style="border-bottom: solid 1px #eaeaea;height: 100px;">
						<span style="display: inline-block;width: 20%;">
							<p style="color: #383838;text-align: center;font-size: 20px;font-weight: bold;">
						<c:if test="${item.financingCategory==1}">房地产</c:if>
						<c:if test="${item.financingCategory==2}">政府平台</c:if>
						<c:if test="${item.financingCategory==3}">工商企业</c:if>
						<c:if test="${item.financingCategory==99}">其他</c:if></p>
							<p style="text-align: center;color: #a8a8a8">融资主体</p>
						</span>
						<span style="display: inline-block;width: 25%;">
							<p style="color: #F1B86B;text-align: center;font-size: 20px;font-weight: bold;">${item.assetScales}
								<c:forEach items="${assetUnitSelectList}" var="assetUnit">
								<c:if test="${assetUnit.key eq item.assetUnit}">${assetUnit.value}</c:if>
								</c:forEach></p>
							<p style="text-align: center;color: #a8a8a8">融资规模</p>
						</span>
						<span style="display: inline-block;width: 25%;">
							<p style="text-align: center;font-size: 20px;">
							${item.termMin}
							<c:if test="${item.termMax!= NULL}"><span style="font-size: 14px;margin-left: -10px;">+${item.termMax}个月</span></c:if>
							<c:if test="${item.termMax == NULL}"><span style="margin-left: -10px;">个月</span></c:if></p>
							<p style="text-align: center;color: #a8a8a8">期限</p>
						</span>
						<span style="display: inline-block;width: 25%;">
							<p style="color: #383838;text-align: center;font-size: 16px;">
							${item.yieldMin}%<c:if test="${item.yieldMax!= NULL}">-${item.yieldMax}%</c:if></p>
							<p style="text-align: center;color: #a8a8a8">预期收益</p>
						</span>
						<input type="hidden" id="assetId" name="assetId" value="${item.id}">
					</li>
						<li class="liF">
						<span style="color:#9e9e9e; margin-left:5%;">进度：<span style="color: #3e9de6;">
                        <c:if test="${item.assetStatus=='AS'}">接受认购</c:if>
						<c:if test="${item.assetStatus=='SP'}">立项</c:if>
						<c:if test="${item.assetStatus=='SR'}">开始审核</c:if>
						<c:if test="${item.assetStatus=='TR'}">通过评审</c:if>
						<c:if test="${item.assetStatus=='IS'}">发行</c:if></span></span>
						<span style="width: 120px; font-size: 14px; float: right; height: 30px; line-height: 30px; border: solid 1px #319de6;color:#319de6; text-align: center; border-radius: 12px; margin: 7px 30px 0;">
						<c:forEach items="${assetTypelist}" var="assetType">
								<c:if test="${assetType.key eq item.assetType}">${assetType.value}</c:if>
								</c:forEach>
						</span>
						</li>
				</ul>
				</c:forEach>
		
		</div>
		</div>
		</div>
		<jsp:include page="Tail.jsp"/> 
	
<script type="text/javascript">
function toPage(pageUrl){
	window.location.href=pageUrl;
};
</script>
<script type="text/javascript">
	function DropDown(el) {
		this.dd = el;
		this.placeholder = this.dd.children('span');
		this.opts = this.dd.find('ul.dropdown > li');
		this.val = '';
		this.index = -1;
		this.initEvents();
	}

	DropDown.prototype = {
		initEvents : function() {
			var obj = this;

			obj.dd.on('click', function(event) {
				if ($(obj.dd).attr("class").indexOf("active") != -1) {
					$('.wrapper-dropdown-5').removeClass('active');
				} else {
					$('.wrapper-dropdown-5').removeClass('active');
					$(this).toggleClass('active');
				}
				event.stopPropagation();
			});
			obj.opts.on('click', function() {
				var opt = $(this);
				obj.val = opt.text();
				obj.index = opt.index();
				obj.placeholder.text(obj.val);
				document.getElementById("queryType").title = obj.index;
				getQueryType();
			});
		}
	}

	$(function() {

		//类型选择列表款
		new DropDown($('#periodicType'));

		//频率列表框
		new DropDown($('#frequencyType'));

		new DropDown($('#plan_date'));

		new DropDown($('#product'));

		$(document).click(function() {
			// all dropdowns
			$('.wrapper-dropdown-5').removeClass('active');
		});

	});
	</script>	
</body>
</html>