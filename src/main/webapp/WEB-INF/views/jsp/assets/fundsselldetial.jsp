<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<link href="${static_ftiao_cn}/css/comm.css?v=1" rel="stylesheet" type="text/css">
<link href="${static_ftiao_cn}/css/funds.css?v=1" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${static_ftiao_cn}/js/common/jquery-1.11.1.min.js"></script>
<script src="${static_ftiao_cn}/js/my_comm.js?v=1" charset="UTF-8" v=1></script>
<script src="${static_ftiao_cn}/js/success_alter.js?v=1" charset="UTF-8" v=1></script>
<script src="${static_ftiao_cn}/js/funds.js?v=1" charset="UTF-8" v=1></script>
<script type="text/javascript" src="${static_ftiao_cn}/js/common/WdatePicker.js?v=1"></script>
<script type="text/javascript" charset="UTF-8">
	$(function() {
		$("#id__").val();
		$(".proj_btn2").click(function() {
			var btn_id = $(this).attr("id");
			if (!$(this).hasClass('proj_btn2_click')) {
				var reflaut = $().myPouUp("确认意向认购", 1, 2);
				$("#sure_btn").click(function() {
					$("#" + btn_id).addClass("proj_btn2_click");
				})
			}
		});
		$(".proj_btn3").click(function() {
			$(this).toggleClass("proj_btn3_click");
			$().mySuccesW("关注项目成功", 1);
		});
		$(".check_input").click(function() {
			$(this).prev().toggleClass("check_icon_no");
		});
		$(".select_btn1,.select_btn2").click(function() {
			$(".select_btn2,.select_btn1,.check_box,.recommend").toggle();
		});
		$(".select_btn2").click(function() {
			$().mySuccesW("批量操作成功", 1);
		});

	})
	//筛选按钮切换
	$(document).ready(function() {
		$(".funds_d_list ul li .tips").click(function() {
			$(this).toggleClass("blue");
		});
	});
</script>

<script type="text/javascript">

	function update_status(obj) {
		var assetStatus = $("#assetStatus").val();
	/* 	if(assetStatus == "SP" && obj == "BT" ){
			return false;
		}else if(assetStatus){
			
		} */
		var url = "${ctx}/assetsdeal/mergeAssetstatus.do";
		$.post(url, {
			assetStatus : obj,
			userId:"${assets.userId}"
		}, function(data) {
			if (data.result == "Y") {
				alert("修改进度成功");
				window.location.reload();
			}else{
				alert("修改进度失败");
			}
		}, "json");
	}
</script>

</head>
	<!--右侧主内容start-->
	<div id="fr_main" class="fr_main ">
		<!--标题start-->
		<div class="title_h1">
			<h1>出让资产详情</h1>
			<a class="select_btn btn_blue select_btn1"> 批量提醒更新</a>
			<a class="select_btn btn_orange select_btn2">取消</a> 
			<input class="select_btn btn_orange select_btn2" type="button" value="确认">
		</div>
		<!---出让资产详情---->
		<div class="funds_sell_dt">
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
					<td><h3>${assets.assetsName}</h3></td>
					<td>${assets.financingCategory}</td>
					<td>${assets.assetArea}</td>
					<td>${assets.assetScales}
						<c:forEach items="${assetUnitSelectList}" var="status" >
	                        <c:if test="${status.key eq assets.assetUnit}">${status.value}</c:if>
	                    </c:forEach>
                    </td>
					<td>${assets.yieldMin}%-${assets.yieldMax}%</td>
					<td>${assets.termMin}-${assets.termMax}个月</td>
				</tr>
			</table>
			<!---我的进度---->
			<form:form commandName="assets" id="form" modelAttribute="assets" action="${ctx}/assets/mergeAssetstatus.do" method="GET" cssClass="validate">
				<div class="my_progress">
					<h4>我的进度</h4>
					<ul class="<c:if test="${assets.assetStatus == 'SP' }">s1</c:if>
								<c:if test="${assets.assetStatus == 'SR' }">s2</c:if>
								<c:if test="${assets.assetStatus == 'TR' }">s3</c:if>
								<c:if test="${assets.assetStatus == 'IS' }">s4</c:if>">
						<li class="p1 ${assets.assetStatus == 'SP' || assets.assetStatus == 'SR' || assets.assetStatus == 'TR' || assets.assetStatus == 'IS' ? 'passed' : '' }" onclick="update_status('SP')">立项</li>
						<li class="p2 ${assets.assetStatus == 'SR' || assets.assetStatus == 'TR' || assets.assetStatus == 'IS' ? 'passed' : '' }" onclick="update_status('SR')">开始审评</li>
						<li class="p3 ${assets.assetStatus == 'TR' || assets.assetStatus == 'CS' ? 'passed' : '' }" onclick="update_status('TR')">通过审评</a></li>
						<li class="p4 ${assets.assetStatus == 'IS' ? 'passed' : '' }"  onclick="update_status('IS')">发行</li>
					</ul>
					<div class="date">
						<div class="name">起息日</div>
						<div class="input">
						 	<form:input path="dateOfInterest" readonly="true" onclick="WdatePicker({dateFmt:'yyyy-MM-d'})"  cssStyle="width:80px" cssClass="input_txt_l"/> 
						</div>
						<div class="arrow"></div>
						<div class="name">到期日</div>
						<div class="input">
							<form:input path="dueDate" readonly="true" onclick="WdatePicker({dateFmt:'yyyy-MM-d'})"  cssStyle="width:80px" cssClass="input_txt_l"/>
					 	</div> 
					</div>
				</div>
			</form:form>
			
			
			<div id="_FTIAO_PAGINATE_CONTENT"></div>

			<!---出让资产详情---->
			<div class="funds_d_list">
				<ul>
		 		 <c:forEach var="item" items="${paginate.data}" varStatus="s">
					<li>
						<div class="tips active">
							<i><a href=""></a></i>
							<div class="tips_wz">提醒更新，提示对应资金方用户尽快更新进度</div>
						</div>
						<div class="tips active check_box" style="display: none">
							<i class="t01"></i>
						</div>
						<div class="funds_d_fl">
							<div class="name">认购机构：${item.institutionName}</div>
							<div class="schedule">
							<c:if test="${item.fundStatus!='TS'}">
								<div class="line_fff"></div>
								<div class="line" style="width: 276px; left: 19px"></div>
								<ul>
									<li style="left: 0;">
										<div class="schedule01 sc1"></div>
											<div class=" sc_bg"></div> 
										<div class="schedule02">意向认购</div>
									</li>
									<li style="left: 70px;">
										<div class="schedule01 sc1"></div>
										<c:if test="${item.fundStatus=='BT'}">
											<div class=" sc_bg"></div>
										</c:if>
										<div class="schedule02">尽调</div>
									</li>
									<li style="left: 140px;">
										<div class="schedule01 sc2"></div>
										<c:if test="${item.fundStatus=='SR'}">
											<div class=" sc_bg"></div>
										</c:if>
										<div class="schedule02" style="color: #309de6">开始评审</div>
									</li>
									<li style="left: 210px;">
										<div class="schedule01 sc3">4</div>
										<c:if test="${item.fundStatus=='TR'}">
											<div class=" sc_bg"></div>
										</c:if>
										<div class="schedule02">通过评审</div>
									</li>
									<li style="left: 280px;">
										<div class="schedule01 sc3">5</div>
										<c:if test="${item.fundStatus=='CS'}">
										<div class=" sc_bg"></div>
									 </c:if>
									<div class="schedule02">完成认购</div>
									</li>
								</ul>
							   </c:if>
							   <c:if test="${item.fundStatus=='TS'}">
								<div class="line_fff"></div>
								<div class="line" style="width: 276px; left: 19px"></div>
								<div class="line" style=" background-color:#ff0000; width:63px;  left:295px"></div>
								<ul>
									<li style="left: 0;">
										<div class="schedule01 sc1"></div>
											<div class=" sc_bg"></div> 
										<div class="schedule02">意向认购</div>
									</li>
									<li style="left: 70px;">
										<div class="schedule01 sc1"></div>
										<c:if test="${item.fundStatus=='BT'}">
											<div class=" sc_bg"></div>
										</c:if>
										<div class="schedule02">尽调</div>
									</li>
									<li style="left: 140px;">
										<div class="schedule01 sc2"></div>
										<c:if test="${item.fundStatus=='SR'}">
											<div class=" sc_bg"></div>
										</c:if>
										<div class="schedule02" style="color: #309de6">开始评审</div>
									</li>
									<c:if test="${item.fundStatus!='TS'}">
										<li style="left: 210px;">
											<div class="schedule01 sc3">4</div>
											<c:if test="${item.fundStatus=='TR'}">
												<div class=" sc_bg"></div>
											</c:if>
											<div class="schedule02">通过评审</div>
										</li>
										
										<li style="left: 280px;">
										
											<div class="schedule01 sc3">5</div>
											<c:if test="${item.fundStatus=='CS'}">
												<div class=" sc_bg"></div>
										    </c:if>
												<div class="schedule02">完成认购</div>
										</li>
									</c:if>
									<c:if test="${item.fundStatus=='TS'}">
										<li style="left:210px;">
											<div class="schedule01 sc4"></div>
											<div class=" sc_bg" ></div>
											<div class="schedule02" style="color:#ff0000"> 终止认购 </div>
										</li>
									</c:if>
								</ul>
							   </c:if>
							</div>
						</div>
						<div class="funds_d_fr">
							<div class="funds_d_je">
								认购金额：<span><i>${item.offerAmount}</i>${item.amountUnit}</span>
							</div>
							<c:if test="${item.fundStatus=='TR'}">
								<div class="funds_d_fs">
									联系方式：<span>${item.name} ${item.phone}</span>
								</div>
							</c:if>
						</div>
					</li>
				</c:forEach> 
			</ul>
			<input type="hidden" value="${assets.assetStatus}" id="assetStatus">
			<input type="hidden" value="${id}" id="id__">
			
