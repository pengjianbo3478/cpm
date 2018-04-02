<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<c:set var="static_ftiao_cn" scope="request" value="${pageContext.request.contextPath}" />
<link href="${static_ftiao_cn}/css/comm.css?v=1" rel="stylesheet" type="text/css">
<link href="${static_ftiao_cn}/css/funds.css?v=1" rel="stylesheet" type="text/css">
<link href="${static_ftiao_cn}/css/assets.css?v=1" rel="stylesheet" type="text/css">
<script src="${static_ftiao_cn}/js/common/jquery-1.11.1.min.js" type="text/javascript"></script> 
<script src="${static_ftiao_cn}/js/pop_up_w.js?v=1" charset="UTF-8"></script>
<script src="${static_ftiao_cn}/js/my_comm.js?v=1" charset="UTF-8"></script> 
<script src="${static_ftiao_cn}/js/success_alter.js?v=1" charset="UTF-8"></script> 
 <div id="_DELETE_DIALOG"></div>
 <div id="window_dialog" style="display: none;"></div>
 
     <!--标题start-->
     <div class="title_h1">
          <h1>我的关注</h1> 
  </div>
 <!---认购资产---->
 <div class="my_follow">
 <form id="assetsConcern" action="${ctx}/assetsconcern/query.do" >
		<input type="hidden" id="_FTIAO_PAGINATE" name="currentPageNum" value="1" form-id="assetsConcern" btn-id="queryBtn" />
	</form>
 
 <!---项目列表---->
 <table width="100%" border="0" >
  <tr class="header">
    <td width="17%">项目名称</td>
    <td width="9%"><div class="sort">期限</div></td>
    <td width="11%"><div class="sort">预计收益率</div></td>
    <td width="10%"><div class="sort">融资规模</div></td>
    <td width="11%"><div class="sort">已认购金额</div></td>
    <td width="10%"><div class="sort">融资主体类型</div></td>
    <td width="9%"><div class="sort">进度</div></td>
    <td width="23%" >&nbsp;</td>
    </tr>
    <tbody>
    <c:forEach var="item" items="${paginate.data}" varStatus="s">
    <tr>
    <td class="f14">${item.assets.assetsName}</td>
    <td>${item.assets.termMin}
		<c:if test="${item.assets.termMax!= NULL}">+${item.assets.termMax}</c:if>个月
	</td>
    <td>
		${item.assets.yieldMin}%<c:if test="${item.assets.yieldMax!= NULL}">-${item.assets.yieldMax}%</c:if>
	</td>
    <td> ${item.assets.assetScales}
		<c:forEach items="${assetUnitSelectList}" var="assetUnit" >
                     <c:if test="${assetUnit.key eq item.assets.assetUnit}">${assetUnit.value}</c:if>
          </c:forEach>
    
    </td>
    <c:if test="${item.offerAmount>0}">
    <td class="green"><i></i> ${item.offerAmount}<c:forEach items="${assetUnitSelectList}" var="assetUnit" >
                     <c:if test="${assetUnit.key eq item.assets.assetUnit}">${assetUnit.value}</c:if>
                     </c:forEach></td>
    </c:if>
    <c:if test="${item.offerAmount==null}"><td align="center">--</td></c:if>
    <td class="bule"><c:forEach items="${financingCategoryList}" var="financingCategory" >
          <c:if test="${financingCategory.key eq item.assets.financingCategory}">${financingCategory.value}</c:if>
         </c:forEach></td>
    <td class="bule"><c:forEach items="${Assets_progress}" var="assetStatus" >
          <c:if test="${assetStatus.key eq item.assets.assetStatus}">${assetStatus.value}</c:if>
         </c:forEach></td>
    <td><div class="btns_wrap">
      <a class="proj_btn proj_btn2 ${item.offerCount>0?'proj_btn2_click':''}" id="offer_${item.assetsId}"><i class="icons2"></i> 意向认购</a>
       <a class="proj_btn proj_btn3 ${item.assets.concernCount>0?'proj_btn3_click':''}" id="${item.id}"><i class="icons3"></i>取消关注</a>
       </div></td>
    </tr>
    </c:forEach>
    </tbody>
  </table>
      
      </div>     



	   