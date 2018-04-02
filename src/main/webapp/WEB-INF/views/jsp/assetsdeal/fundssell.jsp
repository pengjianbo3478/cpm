<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

	<!--右侧主内容start-->
	<div id="fr_main" class="fr_main " >
	     <!--标题start-->
	     <div class="title_h1">
	          <h1>出让资产</h1> 
	           
	  </div>
	 <!---出让资产---->
	 <div class="funds_sell">
	 <!---项目列表---->
	 <table width="100%" border="0" >
	  <tr class="header">
	    <td width="20%">项目名称</td>
	    <td width="11%"><div class="sort">浏览次数<i></i></div></td>
	    <td width="9%"><div class="sort">尽调<i></i></div></td>
	    <td width="12%"><div class="sort">开始评审<i></i></div></td>
	    <td width="12%"><div class="sort">通过评审<i></i></div></td>
	    <td width="12%"><div class="sort">完成认购<i></i></div></td>
	    <td width="10%"><div class="sort">意向认购<i></i></div></td>
	    <td width="14%"> </td>
	  </tr>
	  <c:forEach var="item" items="${paginate.data}" varStatus="s"> 
	 	<tr>
		   <td>${item.assetsName}</td>
		   <td>${item.countBrowseAssets}</td>
		   <td>${item.countJinTiaoAssets}</td>
		   <td>${item.countStartCheckAssets}</td>
		   <td>${item.countPassCheckAssets}</td>
		   <td class="yellow">${item.countFinishAssets}</td>
		   <td class="yellow">${item.countIntentionAssets}</td>
		   <td><a onclick="detail(${item.id})" class="proj_btn">管理进度</a></td>
		  </tr>
	  </c:forEach>
	  </table>
	 </div>     
	</div>
<input type="hidden" id="_DETAIL" value="${ctx}/assetsdeal/detailCellAssets.do">
<input type="hidden" id="_DETAIL" value="${ctx}/assetsdeal/merge.do">
<script type="text/javascript">
	function detail(id){
		window.location.href = $("#_DETAIL").val() + "?id=" + id;
	}
</script>



