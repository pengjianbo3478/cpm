<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>
<link href="${static_ftiao_cn}/css/comm.css?v=1" rel="stylesheet" type="text/css">
<link href="${static_ftiao_cn}/css/assets.css?v=1" rel="stylesheet" type="text/css">
<script src="${static_ftiao_cn}/js/common/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="${static_ftiao_cn}/js/my_comm.js?v=1" charset="UTF-8"></script>
<script src="${static_ftiao_cn}/js/success_alter.js?v=1" charset="UTF-8"></script>
<script src="${static_ftiao_cn}/js/funds.js?v=1" charset="UTF-8"></script>
<script type="text/javascript">
	function update_status(obj) {
		var fundStatus = $("#fundStatus").val();
		if (fundStatus == 'BT' && obj == 'BT') {
			return false;
		} else if (fundStatus == 'SR' && (obj == 'BT' || obj == 'SR')) {
			return false;
		} else if (fundStatus == 'TR'
				&& (obj == 'BT' || obj == 'SR' || obj == 'TR')) {
			return false;
		} else if (fundStatus == 'CS'
				&& (obj == 'BT' || obj == 'SR' || obj == 'TR' || obj == 'CS')) {
			return false;
		} else if (fundStatus == 'TS'
				&& (obj == 'BT' || obj == 'SR' || obj == 'TR' || obj == 'CS')) {
			return false;
		} else if (fundStatus == 'IS') {
			return false;
		}
		var url = "${ctx}/assetstrading/updatestatus.do";
		$.post(url, {
			fundStatus : obj,
			id : "${assetsDeal.id}"
		}, function(data) {
			if (data.result == "Y") {
				window.location.reload();
			}
		}, "json")
	}
	function updateAmount() {
		var reg = /^-?\d+(?:\.\d+)?$/;
		if (!reg.test($("#updateAmount").val())) {
			alert("请输入一个正确的金额");
		}
		url = "${ctx}/assetsdeal/updateamount.do";
		$.post(url, {
			id : "${assetsDeal.id}",
			offerAmount : $("#updateAmount").val(),
			amountUnit:"${assets1.assetUnit}"
		}, function(data) {
			if (data.result == "Y") {
				alert("修改成功");
			}
		}, "json")
	}
	function over_(obj) {
		var url = "${ctx}/assetstrading/over.do";
		$.post(url, {
			id : "${assets1.id}",
			validStatus : obj
		}, function(data) {
			if (data.result == "Y") {
				alert("修改成功");
			}
		}, "json")

	}
</script>
<!--内容主体start-->
<div class="content clearfix">
	<!--右侧主内容start-->
	<!--标题start-->
	<div class="title_h1">
		<h1>认购资产详情</h1>
	</div>
	<!---认购资产详情---->
	<div class="assets_detail_dt">
		<!---项目信息---->
		<table width="100%" border="0">
			<tr class="header">
				<td width="20%">项目名称</td>
				<td width="11%">融资主体类型</td>
				<td width="9%">资产地区</td>
				<td width="12%">融资规模</td>
				<td width="12%">预计收益率</td>
				<td width="12%">期限</td>
			</tr>
			<tr>
				<td>
					<h3>${assets1.assetsName}</h3>
				</td>
				<td>
					<c:if test="${assets1.financingCategory==1}">房地产</c:if>
					<c:if test="${assets1.financingCategory==2}">政府平台</c:if>
					<c:if test="${assets1.financingCategory==3}">工商企业</c:if>
					<c:if test="${assets1.financingCategory==99}">其他</c:if>
				</td>
				<td>${assets1.assetArea}</td>
				<td>${assets1.assetScales}<c:if test="${assets1.assetUnit =='K'}">万元</c:if>
					<c:if test="${assets1.assetUnit =='M'}">亿元</c:if></td>
				<td>${assets1.yieldMin}%-${assets1.yieldMax}%</td>
				<td>${assets1.termMin}-${assets1.termMax}个月</td>
			</tr>
		</table>
		<!---出让资产详情---->
		<div class="assets_d_list">
			<ul>
				<li>
					<div class="tips active check_box" style="display: none">
						<i class="t01"></i>
					</div>
					<div class=" assets_d_fl">
						<div class="name">认购机构：${businessUser.institutionName}</div>
						<a href="#" class=" select_btn2" style="display: none">需求详情</a>
						<div class="schedule">
							<div class="line_fff"></div>
							<div class="line 
							<c:if test="${assets1.assetStatus == 'AS'}">line1</c:if>
							<c:if test="${assets1.assetStatus == 'SP'}">line2</c:if>
							<c:if test="${assets1.assetStatus == 'SR'}">line3</c:if>
							<c:if test="${assets1.assetStatus == 'TR'}">line4</c:if>
							<c:if test="${assets1.assetStatus == 'IS'}">line5</c:if>
							"></div>
							<input id="assetStatus" type="hidden" value="${assets1.assetStatus}" />
							<ul>
								<li style="left: 0;">
									<div class="schedule01 
										<c:if test="${assets1.assetStatus == 'AS'}">sc2</c:if>
										<c:if test="${assets1.assetStatus == 'SP'}">sc1</c:if>
										<c:if test="${assets1.assetStatus == 'SR'}">sc1</c:if>
										<c:if test="${assets1.assetStatus == 'TR'}">sc1</c:if>
										<c:if test="${assets1.assetStatus == 'IS'}">sc1</c:if>
										"></div>
									<div class=" sc_bg"></div>
									<div class="schedule02">接受认购</div>
								</li>
								<li style="left: 70px;">
									<div class="schedule01  
										<c:if test="${assets1.assetStatus == 'AS'}">sc3</c:if>
										<c:if test="${assets1.assetStatus == 'SP'}">sc2</c:if>
										<c:if test="${assets1.assetStatus == 'SR'}">sc1</c:if>
										<c:if test="${assets1.assetStatus == 'TR'}">sc1</c:if>
										<c:if test="${assets1.assetStatus == 'IS'}">sc1</c:if>
										"></div>
									<div class=" sc_bg"></div>
									<div class="schedule02">立项</div>
								</li>
								<li style="left: 140px;">
									<div class="schedule01 
										<c:if test="${assets1.assetStatus == 'AS'}">sc3</c:if>
										<c:if test="${assets1.assetStatus == 'SP'}">sc3</c:if>
										<c:if test="${assets1.assetStatus == 'SR'}">sc2</c:if>
										<c:if test="${assets1.assetStatus == 'TR'}">sc1</c:if>
										<c:if test="${assets1.assetStatus == 'IS'}">sc1</c:if>
										"></div>
									<div class=" sc_bg"></div>
									<div class="schedule02">开始评审</div>
								</li>
								<li style="left: 210px;">
									<div class="schedule01 
										<c:if test="${assets1.assetStatus == 'AS'}">sc3</c:if>
										<c:if test="${assets1.assetStatus == 'SP'}">sc3</c:if>
										<c:if test="${assets1.assetStatus == 'SR'}">sc3</c:if>
										<c:if test="${assets1.assetStatus == 'TR'}">sc2</c:if>
										<c:if test="${assets1.assetStatus == 'IS'}">sc1</c:if>
										"></div>
									<div class=" sc_bg"></div>
									<div class="schedule02">通过评审</div>
								</li>
								<li style="left: 280px;">
									<div class="schedule01 
										 <c:if test="${assets1.assetStatus == 'AS'}">sc3</c:if>
										<c:if test="${assets1.assetStatus == 'SP'}">sc3</c:if>
										<c:if test="${assets1.assetStatus == 'SR'}">sc3</c:if>
										<c:if test="${assets1.assetStatus == 'TR'}">sc3</c:if>
										<c:if test="${assets1.assetStatus == 'IS'}">sc2</c:if>"></div>
									<div class=" sc_bg"></div>
									<div class="schedule02">发行</div>
								</li>
							</ul>
						</div>
					</div>
					<div class=" assets_d_fr">
						<div class="assets_d_je">
							起息日：
							<span>
								<f:formatDate value="${assetsDeal.dateOfInterest}" pattern="yyyy-MM-dd HH:mm:ss " />
							</span>
						</div>
						<div class="assets_d_je">
							到期日：
							<span>
								<f:formatDate value="${assetsDeal.dueDate}" pattern="yyyy-MM-dd HH:mm:ss " />
							</span>
						</div>
						<div class="assets_d_fs">
							<c:if test="${assets1.assetStatus == 'TR' || assets1.assetStatus == 'IS'}">
								联系方式：${businessUser.name}：${businessUser.phone}
							</c:if>
							<span class="zbkj">
								<c:if test="${assets1.assetStatus == 'AS' || assets1.assetStatus == 'SP'||assets1.assetStatus == 'SR'}">
									暂不可见
								</c:if>
								<i>
									<div class="zbkj_wz">联系方式待资金进度到达"通过评审"后显示</div>
								</i>
							</span>
						</div>
					</div>
				</li>
			</ul>
		</div>
		<input type="hidden" value="${assetsDeal.fundStatus}" id="fundStatus">
		<div class="my_progress">
			<h4>我的进度</h4>
			<ul class="<c:if test="${assetsDeal.fundStatus == 'BT' }">s1</c:if>
				<c:if test="${assetsDeal.fundStatus == 'SR' }">s2</c:if>
				<c:if test="${assetsDeal.fundStatus == 'TR' }">s3</c:if>
				<c:if test="${assetsDeal.fundStatus == 'CS' }">s4</c:if>
				<c:if test="${assetsDeal.fundStatus == 'TS' }">s5</c:if>">
				<li class="p1 ${assetsDeal.fundStatus == 'BT' || assetsDeal.fundStatus == 'SR' || assetsDeal.fundStatus == 'TR' || assetsDeal.fundStatus == 'CS' ? 'passed' : '' }" onclick="update_status('BT')">尽调</li>
				<li class="p2  ${assetsDeal.fundStatus == 'SR' || assetsDeal.fundStatus == 'TR' || assetsDeal.fundStatus == 'CS' ? 'passed' : '' }" onclick="update_status('SR')">开始审评</li>
				<li class="p3  ${assetsDeal.fundStatus == 'TR' || assetsDeal.fundStatus == 'CS' ? 'passed' : '' }" onclick="update_status('TR')">通过审评</li>
				<li class="p4  ${assetsDeal.fundStatus == 'CS' ? 'passed' : '' }" onclick="update_status('CS')">完成认购</li>
			</ul>
			<div class="rgzj">
				<div class="name">认购资金</div>
				<div class="input">
					<input type="text" id="updateAmount" value="${assetsDeal.offerAmount}"><c:if test="${assets1.assetUnit =='K'}">万元</c:if>
					<c:if test="${assets1.assetUnit =='M'}">亿元</c:if>
					
				</div>
				<input type="submit" class="btn_sumit btn_blue" onclick="updateAmount()" value="确定">
			</div>
		</div>
		<div class="button">
			<button type="button" id="" class="btn_blue" onclick="over_(0)">终止认购</button>
		</div>
	</div>
</div>
<!--内容主体end-->
