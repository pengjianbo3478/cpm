<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f"%>


<!--标题start-->
<div class="title_h1">
	<h1>找资金</h1>

</div>
<!---项目详情---->
<div class="funds_detail">
	<table width="100%" border="0" cellspacing="1">
		<tr>
			<td width="15%" class="tt">项目名称</td>
			<td width="85%">${assets.assetsName}</td>
		</tr>
		<tr>
			<td class="tt">资产地区</td>
			<td>${assets.assetArea}</td>
		</tr>
		<tr>
			<td class="tt">融资规模</td>
			<td>${assets.assetScales}
			<c:forEach var="obj" items="${assetUnitSelectList}" varStatus="s">
					<c:if test="${assets.assetUnit eq obj.key}">${obj.value}</c:if>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td class="tt">期限</td>
			<td>${assets.termMin}-${assets.termMax}个月</td>
		</tr>
		<tr>
			<td class="tt">预计收益率</td>
			<td>${assets.yieldMin}%至${assets.yieldMax}%</td>
		</tr>
		<tr>
		    <!-- 开发对象是这个表里的INVESTOR_ALLOWED -->
			<td class="tt">开放对象</td>
			<td><span class="yellow">
				<%-- 	${investorAllowed.target} --%>
			<c:forEach var="item" items="${targetTypeList}" >
				<c:forEach var="inve" items="${inve}" >
					<c:if test="${item.key eq inve.target}">${item.value}</c:if>
			    </c:forEach>
			</c:forEach>
				
			</span></td>
		</tr>
		<tr>
			<td class="tt">资金用途</td>
			<td>${assets.useOfFunds}</td>
		</tr>
		<tr>
			<td class="tt">融资主体</td>
			<td><span class="yellow">${assets.financing}</span></td>
		</tr>
		<tr>
			<td class="tt">融资主体类型</td>
			<td><span class="yellow">
			<c:forEach var="obj" items="${financingCategoryList}" varStatus="s">
					<c:if test="${assets.financingCategory eq obj.key}">${obj.value}</c:if>
				</c:forEach>
			</span></td>
		</tr>
		<tr>
			<td class="tt">融资主体<br> 信用描述</td>
			<td>${assets.financingCredit}</td>
		</tr>
		<tr>
			<td class="tt">担保主体<br> 和措施</td>
			<td>${assets.financingAssure}</td>
		</tr>
		<tr>
			<td class="tt">其他</td>
			<td>${assets.other}</td>
		</tr>
		<tr>
			<td class="tt">项目介绍</td>
			<td>${assets.introduction}</td>
		</tr>
		<tr>
		    <!-- 这个表里的ASSETS_DEAL -->
			<td class="tt">项目进度</td>
			<td><span class="yellow">
			<c:forEach var="assetStatus" items="${Assets_progress}" varStatus="s">
					<c:if test="${assets.assetStatus eq assetStatus.key}">${assetStatus.value}</c:if>
				</c:forEach></span></td>
		</tr>
		<tr>
			<td class="tt">上传附件</td>
			<td>${assetsAttachment.filename}</td>
		</tr> 
	</table>

</div>

