<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<TITLE>资产展示</TITLE>
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
<link href="${ctx}/m/css/index.css" rel="stylesheet" type="text/css">
<script src="${ctx}/m/js/jquery-1.11.1.min.js" type="text/javascript"></script>

<style type="text/css">
.rank1{
	background: url(/cpm/m/images/assets_8.png) no-repeat;
    background-size: 14px;
    padding-right: 30px;
}
.rank2{
	background: url(/cpm/m/images/assets_9.png) no-repeat;
    background-size: 14px;
    padding-right: 30px;
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
</style>

<META name="GENERATOR" content="MSHTML 11.00.10240.16391">
</HEAD>

<body style="margin: 0px;">
    <c:set value="0" var="index" scope="session"></c:set>
	<div id="assetlist" class="j-page" style="background-color:#f8f8f8;">
		<div style="width: 100%;text-align: center;">
			<img src="${ctx}/m/images/banner.jpg" width="100%"/>
			<div style="text-align: left; width: 100%;height: 30px; line-height: 30px; border-bottom: solid 1px #eaeaea;">
				<!-- <span class="rank1" style="margin-left: 5%;background-position: 70px 3px;">融资规模</span>
				<span class="rank1" style="background-position: 40px 3px;">期限</span>
				<span class="rank1" style="background-position: 55px 3px;">收益率</span>  -->
				<span  onclick="showCondition()" style="float: right; background: url(/cpm/m/images/assets_7.png) no-repeat 0 5px; background-size: 16px;padding-left:20px;">筛选</span>		
			</div>	
		</div>
		<div>
			<c:forEach var="item" items="${paginate.data}" varStatus="status">
				<ul id="ds" style="border-top: 1px solid #d1d1d1;padding: 0;" >
					<li class="liF"  onclick="window.location.href='${ctx}/m/assets/projectdetails.do?id=${item.id}&offerCount=${item.offerCount}&concernCount=${item.concernCount}'">
						<input type="hidden" id="assetId" name="assetId" value="${item.id}"> 
						<input type="hidden" id="offerCount" name="offerCount" value="${item.offerCount}"> 
						<input type="hidden" id="concernCount" name="concernCount" value="${item.concernCount}"> 
						<span style="padding-left:20px; background: url(${ctx}/m/images/assets_5.png) no-repeat;background-size: 12px;font-size:18px;">${item.assetsName }</span>
						<span style="width: 80px; font-size: 14px; float: right; height: 30px; line-height: 30px; border: solid 1px gray;color:#7DB6E3; text-align: center; border-radius: 12px; margin: 7px 10px 0;">
							<c:if test="${item.financingCategory==1}">
								房地产
					        </c:if>
					        <c:if test="${item.financingCategory==2}">
								政府平台
					        </c:if>
					         <c:if test="${item.financingCategory==3}">
								工商企业
					        </c:if>
					         <c:if test="${item.financingCategory==99}">
								${item.financingCategoryOther}
					        </c:if>
				        </span>
					</li>
					<li style="border-bottom: solid 1px #eaeaea;"  onclick="window.location.href='${ctx}/m/assets/projectdetails.do?id=${item.id}&offerCount=${item.offerCount}&concernCount=${item.concernCount}'">
						<span style="display: inline-block;width: 30%;padding-left:5%;">
							<p>融资规模</p>
							<p style="color:#FAA621;font-size: 20px;margin-top: -4px;">
								<c:if test="${item.assetUnit=='K' }"><span>${item.assetScales }万元</span></c:if>
								<c:if test="${item.assetUnit=='M' }"><span>${item.assetScales }亿元</span></c:if></p>
						</span>
						<span style="display: inline-block;width: 30%;">
							<p>投资期限</p>
							<p style="font-size: 16px;"> 
							<c:if test="${item.termMax != null && item.termMax != ''}">
								${item.termMin}<font style="font-size: 12px;">+${item.termMax}个月</font>
							</c:if>
							<c:if test="${item.termMax == null || item.termMax == ''}">
								${item.termMin}个月
							</c:if>
							</p>
						</span>
						<span style="display: inline-block;width: 30%;">
							<p>年华利率</p>
							<p>${item.yieldMin}%-${item.yieldMax}%</p>
						</span>
					</li>
					<li class="liF">
						<c:if test="${item.assetStatus=='AS' }">
							<span style="color:gray; margin-left:5%;">
								已认购</span>
							<span  style="color:#85B9DD;">${item.offerAmount}万</span>
						</c:if>
						<span id="offer_${item.id}"  class="${item.offerCount>0?'proj_btn2_click':'proj_btn2'}" style="float: right">意向认购</span>		
						<span id="concern_${item.id}" class="${item.concernCount>0?'proj_btn3_click':'proj_btn3'}" style="float: right;padding-right: 15px;">关注</span>				
					</li>
				</ul>
				</c:forEach>
		</div>
		<jsp:include page="./Tail.jsp"></jsp:include>
	</div>
	<div class="condition" style="display:none;position: fixed; top: 0; bottom: 0; right: 0;left:0; z-index: 10;background: black;opacity: 0.5">
	</div>	
	<div class="search_box" style="display:none;position: fixed; top: 0; bottom: 0; right: 0;z-index: 99;background: white;">
    <form:form commandName="assetsVo" action="${ctx}/m/assets/search.do" modelAttribute="assetsVo" method="POST" cssClass="validate">
    <div class="search_wrap">
        <div class="search_cond"  >
             <dl class="clearfix">
                  <dt>融资规模</dt>
                  <dd>1亿以下<form:checkbox path="assetScales" value="1" class="check_input"/></dd>
                  <dd>1亿-10亿<form:checkbox path="assetScales" value="2"  class="check_input"/></dd>
                  <dd class="third">10亿-30亿<form:checkbox path="assetScales" value="3"  class="check_input"/></dd>
                  <dd>30亿以上<form:checkbox path="assetScales" value="4"  class="check_input"/></dd>
                  <dd  class="last">不限<form:checkbox path="assetScales" value="999.0"  class="check_input"/></dd>
             </dl>
             <dl class="clearfix">
                  <dt>投资期限</dt>
                  <!-- <input type="checkbox" name="term" value="1" class="check_input"> -->
                  <dd>12月以内<form:checkbox path="termMin" value="444" class="check_input"/></dd>
                  <dd>12-24个月<form:checkbox path="termMin" value="555" class="check_input"/></dd>
                  <dd class="third">24个月以上<form:checkbox path="termMin" value="666" class="check_input"/></dd>
                  <dd  class="last">不限<form:checkbox path="termMin" value="999" class="check_input" /></dd>
             </dl>
             <dl class="clearfix">
                  <dt>年化收益率</dt>
                  <dd>5%以下<form:checkbox path="yieldMin" value="1" class="check_input"/></dd>
                  <dd>5%-8%<form:checkbox path="yieldMin" value="2"  class="check_input"/></dd>
                  <dd class="third">8%-12%<form:checkbox path="yieldMin" value="3" class="check_input"/></dd>
                  <dd>12%以上<form:checkbox path="yieldMin" value="4"  class="check_input"/></dd>
                  <dd  class="last">不限<form:checkbox path="yieldMin" value="999"  class="check_input" /></dd>
             </dl>
             <dl class="clearfix">
                  <dt>融资主体</dt>
                  <dd>房地产<form:checkbox path="financingCategory" value="1"  class="check_input"/></dd>
                  <dd>政府平台<form:checkbox path="financingCategory" value="2" class="check_input"/></dd>
                  <dd class="third">工商企业<form:checkbox path="financingCategory" value="3" class="check_input"/></dd>
                  <dd>其他<form:checkbox path="financingCategory" value="4" class="check_input"/></dd>
                  <dd  class="last">不限<form:checkbox path="financingCategory" value="999"  class="check_input"/></dd>
             </dl>
             <dl class="clearfix last_dl">
                  <dt>项目类型</dt>
                  <dd>单一信托计划<form:checkbox path="assetType" value="1" class="check_input"/><span></span></dd>
                  <dd>集合信托计划<form:checkbox path="assetType" value="2" class="check_input"/><span></span></dd>
                  <dd>定向资管计划<form:checkbox path="assetType" value="3" class="check_input"/></dd>
                  <dd>专项资管计划 <form:checkbox path="assetType" value="4"  class="check_input"/><span></span></dd>
                  <dd>集合资管计划<form:checkbox path="assetType" value="5" class="check_input"/><span></span></dd>
                  <dd>私募基金<form:checkbox path="assetType" value="6" class="check_input"/></dd>
                  <dd>公募基金 <form:checkbox path="assetType" value="7" class="check_input"/><span></span></dd>
                  <dd>其他<form:checkbox path="assetType" value="8" class="check_input"/><span></span></dd>
                  <dd  class="last">不限<form:checkbox path="assetType" value="999"  class="check_input" /></dd>
             </dl>
            
             <input id="btn__" type="submit" class="sum_btn btn_orange" style="background-color: #FFBA26;" value="查询">
        </div>
     </div> 
    </form:form>
	</div>
<script type="text/javascript">

function showCondition(){
	$(".condition").show();
	$(".search_box").show();
}

$(function(){
	
	$("body").delegate(".proj_btn2","click",function(){
		 var btn_id=$(this).attr("id").substring(6);
		 if(!$(this).hasClass('proj_btn2_click')){
		  if(confirm("确认意向认购")){
		       $.ajax({
					url : "${ctx}/m/assets/changeOfferFlag.do?id="+btn_id,
					type : "POST",
					dataType:"JSON",
					success : function(data) {
						if (data.result == "Y") {
							alert("意向认购成功"); 
						    $("#offer_"+btn_id).removeClass("proj_btn2");
						    $("#offer_"+btn_id).addClass("proj_btn2_click");
						}else{
							alert("意向认购失败");
						}
					},
		         	});
		  }
		};
	});
	 $("body").delegate(".proj_btn3","click",function(){
		var btn_id=$(this).attr("id").substring(8);
		 if(!$(this).hasClass('proj_btn3_click')){
			if(confirm("确认关注")){
			       $.ajax({
						url : "${ctx}/m/assets/changeConcernFlag.do?id="+btn_id,
						type : "POST",
						dataType:"JSON",
						success : function(data) {
							if (data.result == "Y") {
								alert("关注成功");
							    $("#concern_"+btn_id).removeClass("proj_btn3");
		 					    $("#concern_"+btn_id).addClass("proj_btn3_click");
							}else{
								alert("关注失败");
							}
						},
				    }); 
			}
		};
	}); 

	
	
	$(".condition").click(function(){
		$(".condition").hide();
		$(".search_box").hide();
	})
	$(".check_input").click(function(){
		$(this).prev().toggleClass("check_icon_no");
	});
	$(".select_btn1,.select_btn2").click(function(){
		$(".select_btn2,.select_btn1,.check_box,.recommend").toggle();
	});
	$(".select_btn2").click(function(){
		$().mySuccesW("批量操作成功",1);
	});
	
	//筛选按钮切换
	$(".search_box .search_cond dl dd").click(function(){
		$(this).toggleClass("curr");
		if(!$(this).hasClass('last')){
		  	 $(this).siblings("dd:last").children(".check_input").attr("checked",false);
			 $(this).siblings("dd:last").removeClass("curr");
		}else{
			$(this).siblings().children(".check_input").attr("checked",false);
			$(this).siblings().removeClass("curr");
			}
		
	});
	//选中checkbox对dd按钮添加样式
	$(".search_cond input[checked]").each(function(){
		$(this).parent().addClass("curr");
	});

})
</script>	
		
		
</body>
</html>