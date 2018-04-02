<%@page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<!-- ABC -->
<script type="text/javascript"
	src="${static_ftiao_cn}/js/common/my97DatePicker/WdatePicker.js?v=1.0.0"></script>
	
<script type="text/javascript" charset="UTF-8">

$(function() {
		 $("body").delegate("#btn_concern","click",function(){
	         var ids="";
	         $("input[id='chkID']:checkbox").each(
	           function(){ 
	                     if($(this).attr("checked")){
	                    	 ids += $(this).val()+","
	                     }
	           }
	          )
	          alert(ids);  //得到了正确的投资人ID
	          var btn_ids = ids.substring(0,ids.length-1).split(",");
	        /*   var id1 = $("#id1").val();
	          var assetsId =id1.substring(0,id1.length-1).split(","); */
	          alert($("#_CONTEXT_PATH").val()+"/updateRemind.do?id="+btn_ids);
	 			/*  $().myPouUp("确认关注",1,2);
	 			 $("#sure_btn").click(function(){  */
	 		       $.ajax({
	 				url : $("#_CONTEXT_PATH").val()+"/assetsdeal/updateRemind.do?id="+btn_ids,
	 				type : "POST",
	 				dataType:"JSON",
	 				success : function(data) {
	 					if (data.result == "Y") {
							$().mySuccesW("批量提醒成功",1);
	 				          $(btn_ids).each(function(){
	 							/*  $("#concern_"+this).addClass("proj_btn3_click"); */
	 				          })
	 					}else{
							$().mySuccesW("批量提醒失败",1);
	 					}
	 				},
	 		       }); 
	 		     }); 
	 	/*  });   */
	 	 
	 
	   $("body").delegate(".check_input","click",function(){
			$(this).prev().toggleClass("check_icon_no");
		});
		$(".select_btn1,.select_btn2").click(function() {
			$(".select_btn2,.select_btn1,.check_box,.recommend").toggle();
		});
		$(".select_btn2").click(function() {
			/* $().mySuccesW("批量操作成功", 1); */
		});

	
		function checked(obj)
		{
			if ($(obj).attr('class')=='tips check_box active') {
				$("#"+obj.id+" [type='checkbox']").attr("checked",false);
			}
			if ($(obj).attr('class')=='tips check_box blue') 
				{
				$("#"+obj.id+" [type='checkbox']").attr("checked",true);
				}
		}

	
	//筛选按钮切换
	$(document).ready(function() {
		$(".funds_d_list ul li .tips").click(function() {
			$(this).toggleClass("blue");
		});
	});
	
	
	function update_status(obj) {
		var assetStatus = $("#assetStatus").val();
		if (assetStatus == 'SP' && obj == 'SP') {
			alert("抱歉,您不能修该此状态!");
			return false;
		} else if (assetStatus == 'SR' && (obj=='SP'||obj=='SR')) {
			alert("抱歉,您不能修该此状态!");
			return false;
		}else if(assetStatus == 'TR' &&(obj=='TR'||obj=='SR'||obj=='SP')){
			alert("抱歉,您不能修该此状态!");
			return false;
		}else if(assetStatus == 'IS' && (obj=='IS'||obj=='TR'||obj=='SR'||obj=='SP')){
			alert("抱歉,您不能修该此状态!");
			return false;
		} 
		var url = "${ctx}/assetsdeal/fundsselldetial.do";
		$.post(url, {
			assetStatus : obj,
			userId:"${assets.userId}",
			id:$("#id1").val()
		}, function(data) {
			alert("修改进度成功");
			if (data.result == "Y") {
				alert("恭喜您，进度修改修成功");
				window.location.reload();
			}else{
				alert("对不起，修改进度失败!");
			}
		}, "json")
	}
	
});	
</script>

<!--右侧主内容start-->
<div id="fr_main" class="fr_main ">
	<!--标题start-->
	<div class="title_h1">
		<h1>出让资产详情</h1>
		<a class="select_btn btn_blue select_btn1"> 批量提醒更新</a> <a
			class="select_btn btn_orange select_btn2">取消</a> <input
			class="select_btn btn_orange select_btn2" type="button" value="确认" id='btn_concern'>
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
				<td><h3>${assets.shortName}</h3></td>
				<td>
					<%-- <c:forEach items="${financingCategoryList}" var="status" >
	                        <c:if test="${status.key eq assets.financingCategory}">${status.value}</c:if>
	                     </c:forEach> --%> <c:if
						test="${assets.financingCategory==1}">房地产</c:if> <c:if
						test="${assets.financingCategory==2}">政府平台</c:if> <c:if
						test="${assets.financingCategory==3}">工商企业</c:if> <c:if
						test="${assets.financingCategory==99}">其他</c:if>
				</td>
				<td>${assets.assetArea}</td>
				<td>${assets.assetScales}<%-- <c:forEach items="${assetUnitSelectList}" var="status" >
	                        <c:if test="${status.key eq assets.assetUnit}">${status.value}</c:if>
	                    </c:forEach> --%> <c:if
						test="${assets.assetUnit=='K'}">万元</c:if> <c:if
						test="${assets.assetUnit=='M'}">亿元</c:if>
				</td>
				<td>${assets.yieldMin}%-${assets.yieldMax}%</td>
				<td>${assets.termMin}+${assets.termMax}个月</td>
			</tr>
		</table>
		<!---我的进度---->
		<div class="my_progress">
			<h4>我的进度</h4>
			<ul
				class="<c:if  test="${assets.assetStatus == 'SP'}">s1</c:if>
								 <c:if test="${assets.assetStatus == 'SR' }">s2</c:if>
								 <c:if test="${assets.assetStatus == 'TR' }">s3</c:if>
								 <c:if test="${assets.assetStatus == 'IS' }">s4</c:if>">
				<li
					class="p1 ${assets.assetStatus == 'SP' || assets.assetStatus == 'SR' || assets.assetStatus == 'TR' || assets.assetStatus == 'IS' ? 'passed' : '' }"
					onclick="update_status('SP')">立项</li>
				<li
					class="p2 ${assets.assetStatus == 'SR' || assets.assetStatus == 'TR' || assets.assetStatus == 'IS' ? 'passed' : '' }"
					onclick="update_status('SR')">开始审评</li>
				<li
					class="p3 ${assets.assetStatus == 'TR' || assets.assetStatus == 'CS' ? 'passed' : '' }"
					onclick="update_status('TR')">通过审评</li>
				<li class="p4 ${assets.assetStatus == 'IS' ? 'passed' : '' }"
					onclick="update_status('IS')">发行</li>
			</ul>
			<form:form commandName="assets" action="${ctx}/assetsdeal/merge.do" modelAttribute="assets" method="POST"> 
				<form:input type="hidden" path="id"  />
				<div class="date">
					<div class="name">起息日</div>
					<div class="input">
						<form:input path="dateOfInterest" readOnly="true" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
					</div>
					<div class="arrow"></div>
					<div class="name">到期日</div>
					<div class="input">
						<form:input path="dueDate" readOnly="true" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" />
					</div>
					<input type="submit"  class="btn_sumit btn_blue" value="确定">
				</div>
			</form:form>
		</div>

		<!---出让资产详情---->
		<div class="funds_d_list">
			<ul>
				<c:forEach var="item" items="${paginate.data}" varStatus="s">
					<li>
						<div class="tips active"  >
							<i><a href=""></a></i>
							<div class="tips_wz">提醒更新，提示对应资金方用户尽快更新进度</div>
						</div>
						<div class="tips check_box active" style="display: none" onclick="checked(this);" id="div${item.investerId}" >
							<i class="t01"><input type="checkbox" class="check_input"  id="chkID"  value="${item.investerId}" checked="true" style="display: none"></i>
						</div>
						<div class="funds_d_fl">
							<div class="name">认购机构：${item.institutionName}</div>
							<div class="schedule">
								<div class="line_fff line_fff4"></div>
								<div class="line 
									<c:if test="${item.fundStatus == 'IS'}">line1</c:if>
									<c:if test="${item.fundStatus == 'BT'}">line2</c:if>
									<c:if test="${item.fundStatus == 'SR'}">line3</c:if>
									<c:if test="${item.fundStatus == 'TR'}">line4</c:if>
									<c:if test="${item.fundStatus == 'CS'}">line5</c:if>">
								</div>
								
								<c:if test="${item.status =='0'}">
								 	<div class="line <c:if test="${item.fundStatus == 'IS'}">line_red1</c:if>
												 	 <c:if test="${item.fundStatus == 'BT'}">line_red2</c:if>
													 <c:if test="${item.fundStatus == 'SR'}">line_red3</c:if>
													 <c:if test="${item.fundStatus == 'TR'}">line_red4</c:if>
													 " ></div> 
								</c:if>
								
								<ul>
									<li style="left: 0;">
										<div class="schedule01 
											<c:if test="${item.fundStatus == 'IS'}">sc1</c:if>
											<c:if test="${item.fundStatus == 'BT'}">sc1</c:if>
											<c:if test="${item.fundStatus == 'SR'}">sc1</c:if>
											<c:if test="${item.fundStatus == 'TR'}">sc1</c:if>
											<c:if test="${item.fundStatus == 'CS'}">sc1</c:if>">
										</div>
										<div class=" sc_bg"></div> 
										<div class="schedule02">意向认购</div>
									</li>
									
									<li style="left: 70px;">
									 	 	<div class="schedule01 
													<c:if test="${item.fundStatus == 'IS' && item.status == '1'}">sc3</c:if>
													<c:if test="${item.fundStatus == 'BT' && item.status == '1'}">sc2</c:if>
													<c:if test="${item.fundStatus == 'SR' && item.status == '1'}">sc1</c:if>
													<c:if test="${item.fundStatus == 'TR' && item.status == '1'}">sc1</c:if>
													<c:if test="${item.fundStatus == 'CS' && item.status == '1'}">sc1</c:if>
													<c:if test="${item.fundStatus == 'IS' && item.status == '0'}">sc4</c:if>
													<c:if test="${item.fundStatus == 'BT' && item.status == '0'}">sc1</c:if>
													<c:if test="${item.fundStatus == 'SR' && item.status == '0'}">sc1</c:if>
													<c:if test="${item.fundStatus == 'TR' && item.status == '0'}">sc1</c:if>">
											</div>
											<div class=" sc_bg"></div> 
												<c:if test="${!(item.fundStatus == 'IS' && item.status == '0')}">
													<div class="schedule02">尽调</div>
												</c:if>
												<c:if test="${item.fundStatus == 'IS' && item.status == '0'}">
													<div class="schedule02" style="color:#ff0000"> 终止认购 </div>
												</c:if>
									</li>
									
									<li style="left: 140px;">
												<div class="schedule01 
													<c:if test="${item.fundStatus == 'IS' && item.status == '1'}">sc3</c:if>
													<c:if test="${item.fundStatus == 'BT' && item.status == '1'}">sc3</c:if>
													<c:if test="${item.fundStatus == 'SR' && item.status == '1'}">sc2</c:if>
													<c:if test="${item.fundStatus == 'TR' && item.status == '1'}">sc1</c:if>
													<c:if test="${item.fundStatus == 'CS' && item.status == '1'}">sc1</c:if>
													<c:if test="${item.fundStatus == 'BT' && item.status == '0'}">sc4</c:if>
													<c:if test="${item.fundStatus == 'SR' && item.status == '0'}">sc1</c:if>
													<c:if test="${item.fundStatus == 'TR' && item.status == '0'}">sc1</c:if>">
													
												</div>
												<div class=" sc_bg"></div>
												<c:if test="${!((item.fundStatus == 'BT' || item.fundStatus == 'IS') && item.status == '0')}">
													<div class="schedule02" style="color: #309de6">开始评审</div>
												</c:if>
												<c:if test="${item.fundStatus == 'BT' && item.status == '0'}">
													<div class="schedule02" style="color:#ff0000"> 终止认购 </div>
												</c:if>
									</li>
									
									<li style="left: 210px;">
											<div class="schedule01 
												<c:if test="${item.fundStatus == 'IS' && item.status == '1'}">sc3</c:if>
												<c:if test="${item.fundStatus == 'BT' && item.status == '1'}">sc3</c:if>
												<c:if test="${item.fundStatus == 'SR' && item.status == '1'}">sc3</c:if>
												<c:if test="${item.fundStatus == 'TR' && item.status == '1'}">sc2</c:if>
												<c:if test="${item.fundStatus == 'CS' && item.status == '1'}">sc1</c:if>
												<c:if test="${item.fundStatus == 'SR' && item.status == '0'}">sc4</c:if>
												<c:if test="${item.fundStatus == 'TR' && item.status == '0'}">sc1</c:if>">
											</div>
											<div class=" sc_bg"></div>
											<c:if test="${!((item.fundStatus == 'SR' || item.fundStatus == 'IS' ||item.fundStatus == 'BT') && item.status == '0')}"> 
												<div class="schedule02">通过评审</div>
											</c:if>
											<c:if test="${item.fundStatus == 'SR' && item.status == '0'}">
													<div class="schedule02" style="color:#ff0000"> 终止认购 </div>
											</c:if>
									</li>
									<li style="left: 280px;">
											<div class="schedule01 
												<c:if test="${item.fundStatus == 'IS' && item.status == '1'}">sc3</c:if>
												<c:if test="${item.fundStatus == 'BT' && item.status == '1'}">sc3</c:if>
												<c:if test="${item.fundStatus == 'SR' && item.status == '1'}">sc3</c:if>
												<c:if test="${item.fundStatus == 'TR' && item.status == '1'}">sc3</c:if>
												<c:if test="${item.fundStatus == 'CS' && item.status == '1'}">sc1</c:if>
												<c:if test="${item.fundStatus == 'TR' && item.status == '0'}">sc4</c:if>">
											</div>
											<div class=" sc_bg"></div>
											<c:if test="${(item.fundStatus == 'IS' || item.fundStatus == 'BT' || item.fundStatus == 'SR' ||item.fundStatus == 'TR' ||item.fundStatus == 'CS') && item.status == '1'}"> 
												<div class="schedule02">完成认购</div>
											</c:if>
											<c:if test="${item.fundStatus == 'TR' && item.status == '0'}">
													<div class="schedule02" style="color:#ff0000"> 终止认购 </div>
											</c:if>
									</li>
								</ul>
							</div>
						</div>
						<div class="funds_d_fr">
							<div class="funds_d_je">
								认购金额：<span><i>${item.offerAmount}</i>${item.amountUnit}</span>
							</div>
							<div class="funds_d_fs">
								<c:if
									test="${item.fundStatus == 'TR' || item.fundStatus == 'CS'}">
										联系方式：${item.name}:${item.phone}
								   </c:if>
								<span class="zbkj"> <c:if
										test="${item.fundStatus == 'BT' || item.fundStatus == 'SR'}">
										暂不可见
										</c:if> <i>
										<div class="zbkj_wz">联系方式待资金进度到达"通过评审"后显示</div>
								</i>
								</span>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</div>
<input type="hidden" id="_MERGE" value="${ctx}/assetsdeal/merge.do">
<input type="hidden" value="${assets.assetStatus}" id="assetStatus" />
<input type="hidden" value="${assets.id}" id="id1" />
<input type="hidden" value="${assets.dueDate}" id="dueDate1" />
<input type="hidden" value="${assets.dateOfInterest}"
	id="dateOfInterest1" />

