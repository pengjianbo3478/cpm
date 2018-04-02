<%@page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>

<link href="${static_ftiao_cn}/css/comm.css?v=1" rel="stylesheet" type="text/css">
<link href="${static_ftiao_cn}/css/funds.css?v=1" rel="stylesheet" type="text/css">
<link href="${static_ftiao_cn}/css/index.css?v=1" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${static_ftiao_cn}/js/common/jquery-1.11.1.min.js"></script>
<script src="${static_ftiao_cn}/js/my_comm.js?v=1" charset="UTF-8"></script>
<script src="${ctstatic_ftiao_cnx}/js/success_alter.js?v=1" charset="UTF-8"></script>
<script src="${static_ftiao_cn}/js/funds.js?v=1" charset="UTF-8"></script>
<script src="${static_ftiao_cn}/js/pop_up_w.js?v=1" charset="UTF-8"></script>
<script type="text/javascript" src="${static_ftiao_cn}/js/common/pageUtils4Ajax.js"></script>
<script type="text/javascript" src="${static_ftiao_cn}/js/common/jquery.alerts.js"></script>


<!--右侧主内容start-->
<div id="fr_main" class="fr_main ">
	<!--标题start-->
	<div class="title_h1">
		<h1>出让资产</h1>

	</div>
	<!---出让资产详情---->
	<div class="funds_sell_detail">
		<!---项目列表---->
		<table width="100%" border="0">
			<tr class="header">
				<td width="20%">项目名称</td>
				<td width="11%"><div class="sort down">
						浏览次数<i></i>
					</div></td>
				<td width="9%"><div class="sort up">
						尽调<i></i>
					</div></td>
				<td width="12%"><div class="sort down">
						开始评审<i></i>
					</div></td>
				<td width="12%"><div class="sort down">
						通过评审<i></i>
					</div></td>
				<td width="12%"><div class="sort down">
						完成认购<i></i>
					</div></td>
				<td width="10%"><div class="sort down">
						意向认购<i></i>
					</div></td>
				<td width="14%"></td>

			</tr>


			<%-- <c:forEach var="item" items="${paginate.data}" varStatus="s"> --%>
				<tr>
					<td>${assetsDeal.assetsName}</td>
					<td></td>
					<td>${assetsDeal.countJinTiaoAssets}</td>
					<td>${assetsDeal.countStartCheckAssets}</td>
					<td>${assetsDeal.countPassCheckAssets}</td>
					<td class="yellow">${assetsDeal.countFinishAssets}</td>
					<td class="yellow">${assetsDeal.countIntentionAssets}</td>
					<td><a onclick="detail(${assetsDeal.assetsId})"
						class="proj_btn">管理进度</a></td>
				</tr>
			<%-- </c:forEach> --%>
		</table>
	</div>
</div>
<input type="hidden" id="_DETAIL"
	value="${ctx}/assets/searchCellAssets.do">
<script type="text/javascript">
	function detail(id){
		window.location.href = $("#_DETAIL").val() + "?id=" + id;
	}
</script>



