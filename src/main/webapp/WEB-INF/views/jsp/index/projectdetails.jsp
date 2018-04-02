<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- <link href="${static_ftiao_cn}/css/comm.css?v=1" rel="stylesheet" type="text/css"> --%>
<link href="${static_ftiao_cn}/css/projec.css?v=1" rel="stylesheet" type="text/css">
<%-- <script src="${static_ftiao_cn}/js/common/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="${static_ftiao_cn}/js/my_comm.js?v=1" charset="UTF-8"></script> 
<script src="${static_ftiao_cn}/js/success_alter.js?v=1" charset="UTF-8"></script> 
<script src="${static_ftiao_cn}/js/funds.js?v=1" charset="UTF-8"></script> --%>
<script src="${static_ftiao_cn}/js/pop_up_w.js?v=1" charset="UTF-8"></script>
<script type="text/javascript" src="${static_ftiao_cn}/js/common/pageUtils4Ajax.js"></script>
<script type="text/javascript" src="${static_ftiao_cn}/js/common/jquery.alerts.js"></script>
<script type="text/javascript" charset="UTF-8">
$(function(){ 
	$(".proj_btn2").click(function(){
		 var btn_id=$(this).attr("id").substring(6);
		 if(!$(this).hasClass('proj_btn2_click')){
		   $().myPouUp("确认意向认购",1,2);
          $("#sure_btn").click(function(){
		       $.ajax({
				url : $("#_CONTEXT_PATH").val()+"/changeOfferFlag.do?id="+btn_id,
				type : "POST",
				dataType:"JSON",
				success : function(data) {
					if (data.result == "Y") {
						$().mySuccesW("意向认购成功",1);
					    $("#offer_"+btn_id).addClass("proj_btn2_click");
  					    $("#offerCount").html(parseInt($("#offerCount").html())+1);
					}else{
						$().mySuccesW("意向认购失败",1);
					}
				},
		     	}); 
          	});
		};
	});
	 $(".proj_btn3").click(function(){
		 var btn_id=$(this).attr("id").substring(8);
		 if(!$(this).hasClass('proj_btn3_click')){
	       $.ajax({
				url : $("#_CONTEXT_PATH").val()+"/changeConcernFlag.do?id="+btn_id,
				type : "POST",
				dataType:"JSON",
				success : function(data) {
					if (data.result == "Y") {
						$().mySuccesW("关注项目成功",1);
  					    $("#concern_"+btn_id).addClass("proj_btn3_click");
  					    $("#concernCount").html(parseInt($("#concernCount").html())+1);
					}else{
						$().mySuccesW("关注项目失败",1);
					}
				},
		       }); 
		}
	    else
    	{
		       $.ajax({
					url : $("#_CONTEXT_PATH").val()+"/cancelConcernFlag.do?id="+btn_id,
					type : "POST",
					dataType:"JSON",
					success : function(data) {
						if (data.result == "Y") {
							$().mySuccesW("取消关注项目成功",1);
							$("#concern_"+btn_id).toggleClass("proj_btn3_click");
						    $("#concernCount").html(parseInt($("#concernCount").html())-1);
						}else{
							$().mySuccesW("取消关注项目失败",1);
						}
					},
			       }); 
    	};
		}); 
	// $(".proj_btn3").click(function(){
	//	 var btn_id=$(this).attr("id");
//	 if(!$(this).hasClass('proj_btn3_click')){
	//	   $().myPouUp("确认关注",1,2);
     /*  //   $("#sure_btn").click(function(){ */
		/*        $("#"+btn_id).addClass("proj_btn3_click");
		       $.ajax({
		    	url : "${ctx}/changeConcernFlag.do?id="+btn_id,
				type : "POST",
				dataType:"JSON",
				success : function(data) {
					if (data.result == "Y") {
						alert("关注成功");
						window.location.reload();
					}else{
						alert("关注失败");
					}
				},
		     	}); 
         	});
		};
	}); */ 
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
		  $ ("#toggle_box").slideToggle (300);
		
	});
	$(".search_wrap").css({"height":$(".search_box").height()-50+'px'});
	
})
</script> 

<!--内容主体start-->
<div class="content clearfix">
<!--面包屑start-->
<div class="crumbs">您的位置：<a href="#">首页</a> > <a href="${ctx}/index.do">欧巴金融</a> > <a href="#">项目详情</a></div>
<!--主内容start-->
<div class="projec_main">
<div class="projec_title"><span>${assets.assetsName}</span>
<div class="btns_wrap">
                          <span class="proj_btn"><i></i>浏览次数（${assets.viewCountTotal}）</span>
                          <a class="proj_btn ${currentUserId==assets.userId?'':'proj_btn2'} ${assets.offerCount>0?'proj_btn2_click':''}" id="offer_${assets.id}"><i class="icons2"></i>意向认购（<label id="offerCount">${assets.offerCountTotal}</label>）</a>
                          <a class="proj_btn ${currentUserId==assets.userId?'proj_btn4':'proj_btn3'}  ${assets.concernCount>0?'proj_btn3_click':''}" id="concern_${assets.id}"><i class="icons3"></i>关注项目（<label id="concernCount">${assets.concernCountTotal}</label>）</a>
                     </div></div>
<div class="projec_01">
<ul class="pro_01 clearfix">
<li><div class="name">机构录入类型</div><div class="con"><c:forEach var="obj" items="${targetTypeList}" varStatus="s">
					<c:if test="${businessUser.institutionType eq obj.key}">${obj.value}</c:if>
				</c:forEach></div></li>
<li><div class="name">融资主体类型</div><div class="con"><c:forEach var="obj" items="${financingCategoryList}" varStatus="s">
					<c:if test="${assets.financingCategory eq obj.key}">${obj.value}</c:if>
				</c:forEach></div></li>
<li><div class="name">项目地区</div><div class="con">${assets.assetArea}</div></li>
<li><div class="name">已认购金额</div><div class="con02"><span>${assets.offerAmountTotal} </span><c:forEach var="obj" items="${assetUnitSelectList}" varStatus="s">
					<c:if test="${assets.assetUnit eq obj.key}">${obj.value}</c:if>
				</c:forEach></div></li>
</ul>

<dl class="pro_02">
<dt><i class="ss01"></i>资产介绍：</dt>
<dd>${assets.introduction}</dd>
</dl>
<dl class="pro_02">
<dt><i class="ss02"></i>资金用途：</dt>
<dd>${assets.useOfFunds}</dd>
</dl>

<div class="progress">
<c:if test="${assets.assetStatus=='AS'}">
<span class="pro4"></span>
<ul>
<li><i class="p01"></i><div class="name ">立项</div> </li>
<li><i class="p01"></i><div class="name">开始评审</div></li>
<li><i class="p01"></i><div class="name">通过评审</div></li>
<li><i class="p01"></i><div class="name">发行</div></li>
</ul>
</c:if>


<c:if test="${assets.assetStatus=='IS'}">
<span class="pro4"></span>
<ul>
<li><i class="p01"></i><div class="name">立项</div> </li>
<li><i class="p01"></i><div class="name">开始评审</div></li>
<li><i class="p01"></i><div class="name">通过评审</div></li>
<li><i class="p02"></i><div class="name jx">发行</div></li>  
</ul>
</c:if>


<c:if test="${assets.assetStatus=='TR'}">
<span class="pro3"></span>
<ul>
<li><i class="p01"></i><div class="name">立项</div> </li>
<li><i class="p01"></i><div class="name">开始评审</div></li>
<li><i class="p02"></i><div class="name jx">通过评审</div></li>
<li><i class="p00"></i><div class="name">发行</div></li>
</ul>
</c:if>

<c:if test="${assets.assetStatus=='SR'}">
<span class="pro2"></span>
<ul>
<li><i class="p01"></i><div class="name">立项</div> </li>
<li><i class="p02"></i><div class="name jx">开始评审</div></li>
<li><i class="p00"></i><div class="name">通过评审</div></li>
<li><i class="p00"></i><div class="name">发行</div></li>
</ul>
</c:if>

<c:if test="${assets.assetStatus=='SP'}">
<span class="pro1"></span>
<ul>
<li><i class="p02"></i><div class="name jx">立项</div> </li>
<li><i class="p00"></i><div class="name">开始评审</div></li>
<li><i class="p00"></i><div class="name">通过评审</div></li>
<li><i class="p00"></i><div class="name">发行</div></li>
</ul>
</c:if>






</div>
</div>
<div class="projec_02 clearfix">
<ul>
<li><div class="name"><span>${assets.assetScales}</span> <c:forEach var="obj" items="${assetUnitSelectList}" varStatus="s">
					<c:if test="${assets.assetUnit eq obj.key}">${obj.value}</c:if>
				</c:forEach></div><div class="con">融资规模</div></li>
<li><div class="name"><span>${assets.yieldMin}</span>%<span>~</span><span>${assets.yieldMax}</span>% </div><div class="con">预计收益率</div></li>
<li><div class="name"><span>${assets.termMin}+${assets.termMax}</span> 个月</div><div class="con">期限</div></li>
</ul>
</div>
<div class="projec_03 clearfix">
<div class="pro_title"></div>
<div class="pro_main">
<div class="clearfix">
<div class="pro_m fl">
<div class="title_m">融资主体信用描述</div>
<div class="pic01"></div>
<p>${assets.financingCredit}</p>
</div>
<div class="pro_m fr">
<div class="title_m">担保主体和措施</div>
<div class="pic02"></div>
<p>${assets.financingAssure}</p>
</div>
</div>

<dl class="clearfix">
<dt>其它：</dt>
<dd>${assets.other}</dd>
</dl>
<div class="mzsm clearfix">
<div class="name fl">免责<br>说明</div>
<div class="con fl">欧巴金融作为交易服务平台进行信息发布，不对任何投资人及/或任何交易提供任何担保，无论是明示、默示或法定的。陆金所平台提供的各种信息及资料仅供参考，投资人应依其独立判断做出决策。投资人据此进行投资交易的，产生的投资风险由投资人自行承担，欧巴金融不承担任何责任。</div>
</div>
</div>
</div>
</div>
</div>
<!--内容主体end-->

