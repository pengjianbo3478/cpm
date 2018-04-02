<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<HTML>
<HEAD>
<META content="IE=11.0000" http-equiv="X-UA-Compatible">
<TITLE>资产详情</TITLE>
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
<link rel="shortcut icon" href="${ctx}/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${ctx}/favicon.ico" type="image/x-icon" />
<link href="${ctx}/m/css/projectdetail.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${ctx}/m/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript">
		function ign(string) {
			var temp = "";
			string = '' + string;
			splitstring = string.split(" ");
			for(var i = 0; i < splitstring.length; i++)
				temp += splitstring[i];
			return temp;
		}
</script>
<style type="text/css">
.menuA{
	width: 33%;
    display: inline-block;
    margin-left: -8px;
    
}
.menuW{
	height: 30px;
	margin-top: 5px;
	margin-bottom:-6px;
}
a{
	text-decoration:none;
	color:black;
}
.proj_btn2_click{
	display:block;
	padding-left:25px;
	background: url(${ctx}/m/images/menu_3_2.png) no-repeat;
	background-size: 30px;
	background-position: 40%;
    height: 30px;
    margin-top: 10px;
    margin-bottom:-6px;
}
.proj_btn2{
	display:block;
	padding-left:25px;
	background: url(${ctx}/m/images/menu_3_1.png) no-repeat;
	background-size:30px;
	background-position: 40%;
    height: 30px;
    margin-top: 10px;
    margin-bottom:-6px;
}
.proj_btn3_click{
	display:block;
	padding-left:25px;
	background: url(${ctx}/m/images/assets_6_1.png) no-repeat;
	background-size: 30px;
	background-position: 40%;
    height: 30px;
    margin-top: 10px;
    margin-bottom:-6px;
}
.proj_btn3{
	display:block;
	padding-left:25px;
	background: url(${ctx}/m/images/assets_6.png) no-repeat;
	background-size: 30px;
	background-position: 40%;
    height: 30px;
    margin-top: 10px;
    margin-bottom:-6px;
}
</style>

<META name="GENERATOR" content="MSHTML 11.00.10240.16391">
</HEAD>

<body style="background-color:#f8f8f8;margin:0px;">
	<div id="projectDetails" class=" j-page" style="background-color:#f8f8f8;padding-bottom:80px;">
	<div id="header">
	<div id="assetsname"><span>${assets.assetsName}</span></div>
	<div id="browse"><span style="background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/Browsenumber.png) no-repeat;background-size: 16px;font-size:16px;background-position:2px 4px ;" >浏览次数：（${assets.viewCountTotal}）</span></div>
	<div id="details">
	   <span style="display: inline-block;width:33%;text-align:center;border-right:1px solid #7dc9f3;height:80px;float:left;">
							<p style="color: #fff;font-size:20px;">
							<c:forEach items="${financingCategoryList}" var="financingCategory">
						    <c:if test="${financingCategory.key eq assets.financingCategory}">${financingCategory.value}</c:if>
						   </c:forEach></p>
							<p style="font-size: 16px;color:#d1e7f9;">
								融资类型
							 </p>
						</span>
	   <span style="display: inline-block;width: 33%;text-align:center;border-right:1px solid #7dc9f3;height:80px;float:left;">
							<p style="color: #fff;font-size:20px;">
							<c:if test="${assets.offerAmount==null}">0.00</c:if>
							<c:if test="${assets.assetStatus=='AS' }">
									${assets.offerAmount}<c:forEach items="${assetUnitSelectList}" var="assetUnit" >
                                    <c:if test="${assetUnit.key eq assets.assetUnit}">${assetUnit.value}</c:if>
                                    </c:forEach>
									</c:if></p>
							<p style="font-size: 16px;color:#d1e7f9;">
								已认购金额
							 </p>
						</span>
						<span style="display: inline-block;text-align:center;height:80px;width: 33%;">
							<p style="color: #fff;font-size:20px;">
							    ${assets.assetScales}
								<c:forEach items="${assetUnitSelectList}" var="assetUnit">
									<c:if test="${assetUnit.key eq assets.assetUnit}">${assetUnit.value}</c:if>
									</c:forEach></p>
							<p style="font-size: 16px;color:#d1e7f9;">
								融资规模
							 </p>
						</span>
	</div>
	</div>
	<div style="height:20px;background-color:#f8f8f8;"></div>
	<ul style="height:400px;list-style: none;border-bottom:1px solid #d1d1d1;border-top:1px solid #d1d1d1;background-color:#fff;margin:0;">
	<li style="height:80px;border-bottom:1px solid #d1d1d1;line-height:80px;">
	<span style="background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/qixian.png) no-repeat;background-size: 16px;font-size:18px;background-position:2px 1px ;" >投资期限</span>
	<span style=" font-size: 18px; color:#35A3E9;float: right; height: 30px; line-height: 80px; text-align: center;padding-right:5%; ">
		${assets.termMin}<c:if test="${assets.termMax!= NULL}">+${assets.termMax}</c:if>个月
	</span>
	</li>
	<li style="height:80px;border-bottom:1px solid #d1d1d1;line-height:80px;">
	<span style="background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/shouyi.png) no-repeat;background-size: 16px;font-size:18px;background-position:2px 1px ;" >年化收益</span>
	<span style=" font-size: 18px; color:#35A3E9;float: right; height: 30px; line-height: 80px; text-align: center;padding-right:5%; ">
		${assets.yieldMin}%<c:if test="${item.assets.yieldMax!= NULL}">-${assets.yieldMax}%</c:if>
	</span>
	</li>
	<li style="height:80px;border-bottom:1px solid #d1d1d1;line-height:80px;">
	<span style="background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/quyu.png) no-repeat;background-size: 16px;font-size:18px;background-position:2px 1px ;" >项目区域</span>
	<span style=" font-size: 18px; color:#35A3E9;float: right; height: 30px; line-height: 80px; text-align: center;padding-right:5%; ">
		${assets.assetArea}
	</span>
	</li>
	<li style="height:160px;line-height:160px;">
	 <span style="background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/assets_10.png) no-repeat;background-size: 30px;18px;background-position:0 0 ;" ></span>   
	</li>
	</ul>
	<div style="line-height:60px;border-bottom: 1px solid #d1d1d1;font-size:16px;background-color: f7fbfe;">
          	<span style="margin-left:4%;background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/xiangmuxiangqing.png) no-repeat;background-size: 16px;font-size:18px;background-position:2px 1px ;color:#319de6;" >项目介绍</span>
           	<span style="float:right;margin-right: 4%;" onclick="f(6);"><img id="ig6" src="${ctx}/m/images/drop-down-blue.png" style="height:25px;margin-top: 16px;"></span>
           	<div class="div-2" style="display:none;font-size:14px;border-top:1px solid #d1d1d1;background-color:white;" id="ck6" >
           		<ul style="margin:0px;line-height: 25px;font-size:12px;padding-top:5px;padding-bottom:5px;list-style: none;padding-left:4%;">
         			<li>${assets.introduction}</li>
        		</ul>
           	</div>
	    </div>
	    <div style="line-height:60px;border-bottom: 1px solid #d1d1d1;font-size:16px;background-color: f7fbfe;">
          	<span style="margin-left:4%;background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/rongzi.png) no-repeat;background-size: 16px;font-size:18px;background-position:2px 1px ;color:#319de6;" >融资主体信用描述</span>
           	<span style="float:right;margin-right: 4%;" onclick="f(7);"><img id="ig7" src="${ctx}/m/images/drop-down-blue.png" style="height:25px;margin-top: 16px;"></span>
           	<div class="div-2" style="display:none;font-size:14px;border-top:1px solid #d1d1d1;background-color:white;" id="ck7" >
           		<ul style="margin:0px;line-height: 25px;font-size:12px;padding-top:5px;padding-bottom:5px;list-style: none;padding-left:4%;">
         			<li>${assets.financingCredit}</li>
        		</ul>
           	</div>
	    </div>
	    <div style="line-height:60px;border-bottom: 1px solid #d1d1d1;font-size:16px;background-color: f7fbfe;">
          	<span style="margin-left:4%;background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/danbao.png) no-repeat;background-size: 16px;font-size:18px;background-position:2px 1px ;color:#319de6;" >担保主体措施</span>
           	<span style="float:right;margin-right: 4%;" onclick="f(8);"><img id="ig8" src="${ctx}/m/images/drop-down-blue.png" style="height:25px;margin-top: 16px;"></span>
           	<div class="div-2" style="display:none;font-size:14px;border-top:1px solid #d1d1d1;background-color:white;" id="ck8" >
           		<ul style="margin:0px;line-height: 25px;font-size:12px;padding-top:5px;padding-bottom:5px;list-style: none;padding-left:4%;">
         			<li>${assets.financingAssure}</li>
        		</ul>
           	</div>
	    </div>
	    <div style="line-height:60px;border-bottom: 1px solid #d1d1d1;font-size:16px;background-color: f7fbfe;">
          	<span style="margin-left:4%;background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/qita.png) no-repeat;background-size: 16px;font-size:18px;background-position:2px 1px ;color:#319de6;" >其他</span>
           	<span style="float:right;margin-right: 4%;" onclick="f(9);"><img id="ig9" src="${ctx}/m/images/drop-down-blue.png" style="height:25px;margin-top: 16px;"></span>
           	<div class="div-2" style="display:none;font-size:14px;border-top:1px solid #d1d1d1;background-color:white;" id="ck9" >
           		<ul style="margin:0px;line-height: 25px;font-size:12px;padding-top:5px;padding-bottom:5px;list-style: none;padding-left:4%;">
         			<li>${assets.other}</li>
        		</ul>
           	</div>
	    </div>
	    <div style="line-height:60px;border-bottom: 1px solid #d1d1d1;font-size:16px;background-color: f7fbfe;">
          	<span style="margin-left:4%;background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/mainze.png) no-repeat;background-size: 16px;font-size:18px;background-position:2px 1px ;color:#319de6;" >免责声明</span>
           	<span style="float:right;margin-right: 4%;" onclick="f(1);"><img id="ig1" src="${ctx}/m/images/drop-down-blue.png" style="height:25px;margin-top: 16px;"></span>
           	<div class="div-2" style="display:none;font-size:14px;border-top:1px solid #d1d1d1;background-color:white;" id="ck1" >
           		<ul style="margin:0px;line-height: 25px;font-size:12px;padding-top:5px;padding-bottom:5px;list-style: none;padding-left:4%;">
         			<li>欧巴金融作为交易服务平台进行信息发布，不对任何投资人及/或任何交易提供任何担保，无论是明示、默示或法定的。陆金所平台提供的各种信息及资料仅供参考，投资人应依其独立判断做出决策。投资人据此进行投资交易的，产生的投资风险由投资人自行承担，欧巴金融不承担任何责任。</li>
        		</ul>
           	</div>
	    </div>
	    <div style="height:20px;background-color:#f8f8f8;"></div>
	    <div style="background-color:white;position:fixed;bottom:0px;width:100%;z-index: 9;text-align: center;border-top:1px solid #d1d1d1;">
	    <a class="menuA" class="pTailTitle"   >
	    	<span class="${assets.concernCount>0?'proj_btn3_click':'proj_btn3'}" id="concern_${assets.id}"></span>
	    	<p>关注项目（${assets.concernCountTotal}）</p></a>
	    <a class="menuA"   class="pTailTitle" >
	    	<span class="${assets.offerCount>0?'proj_btn2_click':'proj_btn2'}" id="offer_${assets.id}"></span>
	    	<p>意向认购（${assets.offerCountTotal}）</p></a>
	    <a class="menuA" class="pTailTitle" >
	    	<img class="menuW" class="menuW" src="${ctx}/m/images/menu_1_2.png" id="pt0">
	    	<p>分享项目</p></a>
	    </div>
			
	    </div>
	
</body>
<script type="text/javascript">
function f(a){
	/* $(".div-2").hide(); */
	var c = document.getElementById("ck"+a).style.display;
	if("none"==c){
	  document.getElementById("ck"+a).style.display="block";
	  document.getElementById("ig"+a).src ="${ctx}/m/images/drop-up-blue.png";
	}else{
	  document.getElementById("ck"+a).style.display="none";
	  document.getElementById("ig"+a).src ="${ctx}/m/images/drop-down-blue.png";
	}
};
$(function(){
	
	$("body").delegate(".proj_btn2","click",function(){
		alert($(this).attr("id"));
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
}); 
</script>
</html>