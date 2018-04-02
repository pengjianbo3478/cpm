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
<TITLE>项目详情</TITLE>
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
<LINK href="${ctx}/css/main.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${ctx}/css/header.css" />
<link rel="shortcut icon" href="${ctx}/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${ctx}/favicon.ico" type="image/x-icon" />
<script type="text/javascript" src="${ctx}/js/jquery-1.11.1.min.js"></script>
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

<META name="GENERATOR" content="MSHTML 11.00.10240.16391">
</HEAD>

<body style="background-color:#f8f8f8">
	<div id="projectDetails" class=" j-page" style="background-color:#f8f8f8;padding-bottom:20px;">
	     <div style="height:60px;background-color:#0099FF;text-align:center;line-height:60px;">
	     	<font style="color:white;font-size:22px;">资产信息</font>
	     </div>
		<div style="background-color:white;line-height:46px;width:100%;height:46px;">
				<span style="font-size: 12px;">房地产融资项目</span>
				<button style="background-color: white;border:1px solid #d1d1d1;font-size:12px;height:25px;border-radius: 5px;margin-left: 5px;width:65px;">关注项目</button>&nbsp;
				<button style="background-color: white;border:1px solid #d1d1d1;height:25px;font-size:12px;border-radius: 5px;width:65px;">意向认购</button>&nbsp; 
				<button style="background-color: white;border:1px solid #d1d1d1;height:25px;font-size:12px;border-radius: 5px;width:65px;">分享项目</button>
		</div>
		
		
		
		
		<div style="height:80px;background-color: #f9f2e3;width:100%;">
		<ul style="width:100%;padding-top:15px;position: absolute;">
		<li style="width:33%;text-align:center;float:left;"><span style="color:#ffba26;font-size:16px;">60亿</span></li>
		<li style="width:33%;text-align:center;float:left;"><span style="color:#ffba26;font-size:16px;">24+12个月</span></li>
		<li style="width:33%;text-align:center;float:right;"><span style="color:#ffba26;font-size:16px;">4%-8%</span></li>
		</ul>
		<ul style="width:100%;position: absolute;padding-top:45px;">
		<li style="width:33%;text-align:center;float:left;"><span style="color:#808080;font-size:12px;">融资规模</span></li>
		<li style="width:33%;text-align:center;float:left;"><span style="color:#808080;font-size:12px;">期限</span></li>
		<li style="width:33%;text-align:center;float:right;"><span style="color:#808080;font-size:12px;">预计收益率</span></li>
		</ul>
	    </div>
			<div style="height:10px;background-color:#f8f8f8;"></div>
			<div style="background-color:white;height:170px;width:100%;border-top:1px solid #d1d1d1;border-bottom:1px solid #d1d1d1;">
			<ul>
			<li style="margin-left:5%;width:90%;height:50px;border-bottom:1px solid #d1d1d1;line-height:50px;"><div style="font-size:14px;color:#ffba26;width:100px;float:left;">融资主体类型</div><div style="padding-left:20px;font-size:14px;color:#333;">房地产</div></li>
			<li style="margin-left:5%;width:90%;height:50px;border-bottom:1px solid #d1d1d1;line-height:50px;"><div style="font-size:14px;color:#ffba26;width:100px;float:left;">资产类型</div><div style="padding-left:20px;font-size:14px;color:#333;">集合信托计划</div></li>
			<li style="margin-left:5%;width:90%;height:50px;border-bottom:1px solid #d1d1d1;line-height:50px;"><div style="font-size:14px;color:#ffba26;width:100px;float:left;">项目区域</div><div style="padding-left:20px;font-size:14px;color:#333;">北京</div></li>
			</ul>
			</div>
			<div style="height:10px;background-color:#f8f8f8;"></div>
			 <div style="line-height:45px;border-top:1px solid #d1d1d1;border-bottom: 1px solid #d1d1d1;font-size:16px;background-color: white;">
	           		<span style="font-size:14px;margin-left: 4%;color:#309de6;">融资主体信用描述</span>
	            	<span style="float:right;margin-right: 4%;" onclick="f(3);"><img id="ig3" src="${ctx}/logo/drop-down-blue.png" style="height:25px;margin-top: 10px;"></span>
	            	<div class="div-2" style="display:none;font-size:14px;border-top:1px solid #d1d1d1;background-color:white;" id="ck3" >
	            		<ul style="line-height: 25px;font-size:12px;margin-left:4%;color:#808080;padding-top:5px;padding-bottom:5px;">
	            			<li>
	            				开放式现金管理类定向委托投资项目，每天24小时开放投资、提取，T+1日收益起始计算/提取到账
	            			</li>
	            		</ul>
	            	</div>
	    </div>
	    <div style="line-height:45px;border-bottom: 1px solid #d1d1d1;font-size:16px;background-color: white;">
          	<span style="font-size:14px;margin-left: 4%;color:#309de6;">担保主体和措施</span>
           	<span style="float:right;margin-right: 4%;" onclick="f(4);"><img id="ig4" src="${ctx}/logo/drop-down-blue.png" style="height:25px;margin-top: 10px;"></span>
           	<div class="div-2" style="display:none;font-size:14px;border-top:1px solid #d1d1d1;background-color:white;" id="ck4" >
           		<ul style="line-height: 25px;font-size:12px;margin-left:4%;color:#808080;padding-top:5px;padding-bottom:5px;">
           			<li>"委托人在T日（含T-1日15点之后至T日15点前）提交有效定向委托投资申请，资管投资人在T+1日确认并起计算收益。其中</li>
                    <li>（1）T日为委托人投资有效申请日，该等日期为工作日，如投资人申请日为非工作日，则应当自动顺延至下一个工作日（工作日为上海证券交易所、深圳证券交易所等的正常交易日,下同）为有效申请日；</li>
                    <li>（2）T+1日为T日起第一个工作日。</li>
           		</ul>	
           	</div>
	    </div>
	   
	   	<div style="line-height:45px;border-bottom: 1px solid #d1d1d1;font-size:16px;background-color: white;">
          	<span style="font-size:14px;margin-left: 4%;color:#309de6;">其他</span>
           	<span style="float:right;margin-right: 4%;" onclick="f(5);"><img id="ig5" src="${ctx}/logo/drop-down-blue.png" style="height:25px;margin-top: 10px;"></span>
           	<div class="div-2" style="display:none;font-size:14px;border-top:1px solid #d1d1d1;background-color:white;" id="ck5" >
           		<ul style="line-height: 25px;font-size:12px;margin-left:4%;color:#808080;padding-top:5px;padding-bottom:5px;">
         			<li>委托人T日（含T-1日14点之后至T日14点前）提交有效提取投资申请，将于T+1日到账。其中</li>
                    <li>（1）T日为委托人有效提取投资申请日，该等日期为工作日，如投资人提取申请日为非工作日，则应当自动顺延至下一个工作日为有效提取投资申请日；</li>
                    <li>（2）T+1日为T日起第一个工作日。在特定情况下受托人有权延迟支付、设置提取上限或拒绝提取，具体参见《定向委托投资管理协议》。</li>
        		</ul>
           	</div>
	    </div>
	    <div style="line-height:45px;border-bottom: 1px solid #d1d1d1;font-size:16px;background-color: white;">
          	<span style="font-size:14px;margin-left: 4%;color:#309de6;">免责声明</span>
           	<span style="float:right;margin-right: 4%;" onclick="f(6);"><img id="ig6" src="${ctx}/logo/drop-down-blue.png" style="height:25px;margin-top: 10px;"></span>
           	<div class="div-2" style="display:none;font-size:14px;border-top:1px solid #d1d1d1;background-color:white;" id="ck6" >
           		<ul style="line-height: 25px;font-size:12px;margin-left:4%;color:#808080;padding-top:5px;padding-bottom:5px;">
         			<li>欧巴金融作为交易服务平台进行信息发布，不对任何投资人及/或任何交易提供任何担保，无论是明示、默示或法定的。陆金所平台提供的各种信息及资料仅供参考，投资人应依其独立判断做出决策。投资人据此进行投资交易的，产生的投资风险由投资人自行承担，欧巴金融不承担任何责任。</li>
        		</ul>
           	</div>
	    </div>
	     
	</div>
</body>
<script type="text/javascript">
function f(a){
	/* $(".div-2").hide(); */
	var c = document.getElementById("ck"+a).style.display;
	if("none"==c){
	  document.getElementById("ck"+a).style.display="block";
	  document.getElementById("ig"+a).src ="${ctx}/logo/drop-up-blue.png";
	}else{
	  document.getElementById("ck"+a).style.display="none";
	  document.getElementById("ig"+a).src ="${ctx}/logo/drop-down-blue.png";
	}
	
	
	
};
</script>
</html>