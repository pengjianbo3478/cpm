<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="project_list">
	<ul>
		<c:forEach var="item" items="${paginate.data}" varStatus="s">
			<li class="box_shadow">
				<!-- <div class="recommend"></div>推荐 --> <!--复选框 -->
				<div class="check_box">
					<div class="check_icon"></div>
					<input type="checkbox" class="check_input" id="chkID"
						value="${item.id}"
						${assetsVo.userID==item.userId?'disabled':'checked'}>
				</div> <!--左侧文字按钮-->
				<div class="detail_left">
					<h2>
						<a
							onclick="detail(${item.id})"
							target="_blank"><i></i>${item.assetsName}</a>
					</h2>
					<input class="id_" type="hidden" value="${item.id}">
					<c:if test="${item.offerAmount!=null}">
						<div class="buy_num">已认购${item.offerAmount}<c:forEach
								items="${assetUnitSelectList}" var="assetUnit">
								<c:if test="${assetUnit.key eq item.assetUnit}">${assetUnit.value}</c:if>
							</c:forEach></div>
					</c:if>
					<div class="txt1">
						<span>投资期限：${item.termMin}个月</span>年化收益率：${item.yieldMin}%
					</div>
					<div class="btns_wrap">
						<a class="proj_btn"
							onclick="detail(${item.id})"><i></i>查看详情</a></a>
						<a
							class="proj_btn ${assetsVo.userID==item.userId?'':'proj_btn2'} ${item.offerCount>0?'proj_btn2_click':''}"
							id="offer_${item.id}"><i class="icons2"></i>意向认购</a> <a
							class="proj_btn ${assetsVo.userID==item.userId?'proj_btn4':'proj_btn3'} ${item.concernCount>0?'proj_btn3_click':''}"
							id="concern_${item.id}"><i class="icons3"></i>关注项目</a>
					</div>
				</div> <!--右侧两圆-->
				<div class="detail_right">
					<div class="subject1">
						<c:forEach items="${financingCategoryList}"
							var="financingCategory">
							<c:if test="${financingCategory.key eq item.financingCategory}">${financingCategory.value}</c:if>
						</c:forEach>
					</div>
					<div class="subject2">${item.assetScales}<span><c:forEach
								items="${assetUnitSelectList}" var="assetUnit">
								<c:if test="${assetUnit.key eq item.assetUnit}">${assetUnit.value}</c:if>
							</c:forEach></span>
					</div>
				</div>
			</li>
		</c:forEach>
	</ul>
</div>
