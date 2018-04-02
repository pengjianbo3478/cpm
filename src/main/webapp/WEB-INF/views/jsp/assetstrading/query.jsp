<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="static_ftiao_cn" scope="request" value="${pageContext.request.contextPath}" />
<link href="${static_ftiao_cn}/css/comm.css?v=1" rel="stylesheet" type="text/css">
<link href="${static_ftiao_cn}/css/assets.css?v=1" rel="stylesheet" type="text/css">
<script src="${static_ftiao_cn}/js/common/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="${static_ftiao_cn}/js/my_comm.js?v=1" charset="UTF-8"></script>
<script src="${static_ftiao_cn}/js/success_alter.js?v=1" charset="UTF-8"></script>
<script type="text/javascript">
	function changeSorting(obj){
		var url = "${ctx}/assetstrading/query.do";
			$.post(url, {
				sorting : obj
			}, function(data) {
				$("#_FTIAO_PAGINATE_CONTENT").removeClass("paginate_loading");
				$("#_FTIAO_PAGINATE_CONTENT").html(data);
			});
	}

</script>
<!--标题start-->
	<form:form commandName="assets" action="${ctx}/assetstrading/query.do" modelAttribute="assets" method="POST"  id="_assets">
<div class="title_h1">
		<div class="warp_as">
			<span>融资主体类型</span>
			<form:select path="financingCategory" onchange="ftiaoPageUtils.toPage('1');">
				<form:option value="">显示全部</form:option>
				<form:option value="1">房地产</form:option>
				<form:option value="2">政府平台</form:option>
				<form:option value="3">工商企业</form:option>
				<form:option value="99">其他</form:option>
			</form:select>
			<span>项目类型</span>
			<form:select path="assetType" onchange="ftiaoPageUtils.toPage('1');">
				<form:option value="">显示全部</form:option>
				<form:option value="1">单一信托计划</form:option>
				<form:option value="2">集合信托计划</form:option>
				<form:option value="3">定向资管计划</form:option>
				<form:option value="4">专项资管计划</form:option>
				<form:option value="5">集合资管计划</form:option>
				<form:option value="6">私募基金</form:option>
				<form:option value="7">公募基金</form:option>
				<form:option value="99">其他</form:option>
			</form:select>
			<input type="hidden" id="_FTIAO_PAGINATE" name="currentPageNum" value="1" form-id="_assets" btn-id="btn__" />
		</div>
</div>
	</form:form>
<!---认购资产---->
<div class="assets_buy">
	<!---项目列表---->
	<table width="100%" border="0">
		<tr class="header">
			<td width="19%">项目名称</td>
			<td width="12%">
				<div class="sort">融资主体类型</div>
			</td>
			<td width="9%">
				<div class="sort">资产地区</div>
			</td>
			<td width="12%">
				<div class="sort">期限</div>
			</td>
			<td width="12%">
				<div class="sort" onclick="changeSorting(ASSET_SCALES)">
					融资规模
					<i></i>
				</div>
			</td>
			<td width="12%">
				<div class="sort" onclick="changeSorting(YIELD_MAX)">
					预计收益率
					<i></i>
				</div>
			</td>
			<td width="10%">
				<div class="sort">进度</div>
			</td>
			<td width="10%">
				<div class="sort">操作</div>
			</td>
		</tr>
		<c:forEach var="item" items="${paginate.data}" varStatus="s">
			<tr>
				<td>${item.assetsName}</td>
				<td class="f12">
					<c:if test="${item.financingCategory==1}">房地产</c:if>
					<c:if test="${item.financingCategory==2}">政府平台</c:if>
					<c:if test="${item.financingCategory==3}">工商企业</c:if>
					<c:if test="${item.financingCategory==99}">其他</c:if>
				</td>
				<td class="f12">${item.assetArea}</td>
				<td>
					${item.termMin}-${item.termMax}
					<span class="f12">个月</span>
				</td>
				<td class="bule">
					<span class="f12">${item.assetScales}<c:if test="${item.assetUnit =='K'}">万元</c:if>
					<c:if test="${item.assetUnit =='M'}">亿元</c:if></span>
				</td>
				<td class="bule">${item.yieldMin}-${item.yieldMax}</td>
				<td class="org">
					<c:if test="${item.assetStatus=='AS'}">接受认购</c:if>
					<c:if test="${item.assetStatus=='SP'}">立项</c:if>
					<c:if test="${item.assetStatus=='SR'}">开始审核</c:if>
					<c:if test="${item.assetStatus=='TR'}">通过评审</c:if>
					<c:if test="${item.assetStatus=='IS'}">发行</c:if>
				</td>
				<td>
					<a href="${ctx}/assetstrading/detail.do?id=${item.id}">管理进度</a>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
<!--内容主体end-->

