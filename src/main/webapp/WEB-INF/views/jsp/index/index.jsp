<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!--顶部页头end-->
<!--内容主体start-->
<form:form commandName="assetsVo" action="${ctx}/search.do" modelAttribute="assetsVo" method="POST" cssClass="validate">
<!--侧栏筛选-->
<div class="search_nomal">
     <div class="screen_t"><div class="screen_t_img"></div></div>
     <div class="screen_t_icon1"></div><div class="screen_t_icon2"></div><div class="screen_t_icon3"></div>
</div>

<div class="search_box">
    <div class="search_title">
         <div class="search_title_icon1"></div>
         <div class="search_title_icon2"></div>
         <div class="search_title_icon3"></div>
         <div class="search_title_icon4"></div>
    </div>
    <div class="search_wrap">
        <div class="search_cond popup-page"  >
           <div class="text">
        
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
            
             <input id="btn__" type="button" class="sum_btn btn_orange" value="查询">
        </div>
     </div>  
     </div>
</div>
		<input type="hidden" id="_FTIAO_PAGINATE" name="currentPageNum" value="1" form-id="assetsVo" btn-id="btn__" />
</form:form>

<div class="content">
     <!--标题start   -->
     <div class="title_h1" >
          <h1>资金需求<img src="${ctx}/images/FinancingProject.png" width="122" height="13"  alt=""/></h1>
          <a class="select_btn btn_blue select_btn1">批量操作</a>
          <a class="select_btn btn_blue select_btn2">取消</a>
          <input class="select_btn btn_orange select_btn2" type="button" value="批量认购" id='btn_offer'>
          <input class="select_btn btn_orange select_btn2" type="button" value="批量关注" id='btn_concern'>
     </div>
     <!--融资项目start-->
<div id="_FTIAO_PAGINATE_CONTENT">
</div>
      <!--标题start-->
     <div class="title_h1">
          <h1 style="width:230px">合作伙伴<img src="${ctx}/images/partner.png" /></h1>          
     </div>
     <div class="coop_logo clearfix">
         <a href="javascript:void(0)"><img src="${static_ftiao_cn}/images/qhjk.png" alt="前海金控"></a>
         <a href="https://www.wecash.net/" target="_blank"><img src="https://www.wecash.net/images/index/logo.png" alt="闪银奇异" style="height:20px; padding-top:7px"></a>
         
     </div>

</div>
<!--内容主体end-->
<input type="hidden" id="_DETAIL" value="${ctx}/projectdetails.do">
 	


