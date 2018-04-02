<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:if test="${paginate.pageTotal gt 0}">
	<div class="page">
		<ul>
<%-- 		<span style="text-align: left;"><span style="color: red;font-weight: bold; margin-right: -5px;">${paginate.currentPageNum}</span>/ &nbsp;${paginate.pageTotal}</span>
 --%>		<c:choose>
			<c:when test="${paginate.currentPageNum eq 1}">
              <li class="lastPage">
				<a href='javascript:void(0)' class="pages_first">首页</a>
              </li>
              <li class="lastPage">
				<a href='javascript:void(0)' class="pages_first"> &lt;&lt; </a>
              </li>
			</c:when>
			<c:otherwise>
              <li class="lastPage">
				<a href='javascript:void(0)' class="pages_first"  onclick='ftiaoPageUtils.toPage("1")'>首页</a>
              </li>
              <li class="lastPage">
				<a href='javascript:void(0)' class="pages_first" onclick='ftiaoPageUtils.toPage("${paginate.currentPageNum - 1}")'>&lt;&lt; </a>
              </li>
			</c:otherwise>
		</c:choose>
		
				<c:if test="${paginate.currentPageNum  gt (paginate.showTags-2)}">
						<li><a href='javascript:void(0)' onclick='ftiaoPageUtils.toPage("1")'>1</a></li>
						<c:if test="${paginate.currentPageNum ne (paginate.showTags-1)}">
							<li><span class="pb_more">...</span></li>
						</c:if>
				</c:if>
				<c:choose>
					<c:when test="${paginate.pageTotal eq 1}">
						<li><a href="javascript:void(0)" class="curr" onclick="jumpPage(this);" pagval="1">1</a></li>
					</c:when>
					
					<c:when test="${paginate.pageTotal le paginate.showTags}">
						<c:if test="${paginate.currentPageNum eq (paginate.showTags-1)}">
							<c:forEach var="countNum" begin="2" end="${paginate.pageTotal}" step="1">
								<c:choose>
									<c:when test="${paginate.currentPageNum eq countNum}">
										<li><a href="javascript:void(0)" class="curr" onclick="jumpPage(this);" pagval="1">${countNum}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href='javascript:void(0)' onclick='ftiaoPageUtils.toPage("${countNum}");'>${countNum}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:if>
						<c:if test="${paginate.currentPageNum ne (paginate.showTags-1)}">
							<c:forEach var="countNum" begin="1" end="${paginate.pageTotal}" step="1">
								<c:choose>
									<c:when test="${paginate.currentPageNum eq countNum}">
										<li><a href="javascript:void(0)" class="curr" onclick="jumpPage(this);" pagval="1">${countNum}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href='javascript:void(0)' onclick='ftiaoPageUtils.toPage("${countNum}");'>${countNum}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:if>
					</c:when>
					<c:when test="${paginate.pageTotal gt paginate.showTags}">
						<c:choose>
							<c:when test="${ (paginate.currentPageNum lt paginate.showTags) and (paginate.currentPageNum ge 1)}">
								<c:choose>
									<c:when test="${ (paginate.currentPageNum +2) gt paginate.showTags}">
										<c:forEach var="countNum" begin="${1+paginate.showTags-paginate.currentPageNum}" end="${paginate.showTags+paginate.showTags-paginate.currentPageNum}" step="1">
											<c:choose>
												<c:when test="${paginate.currentPageNum eq countNum}">
													<li><a href="javascript:void(0)" class="curr" onclick="jumpPage(this);" pagval="1">${countNum}</a></li>
												</c:when>
												<c:otherwise>
													<li><a href='javascript:void(0)' onclick='ftiaoPageUtils.toPage("${countNum}");'>${countNum}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:when>
									<c:when test="${ (paginate.currentPageNum+2) le paginate.showTags}">
										<c:forEach var="countNum" begin="1" end="${paginate.showTags}" step="1">
												<c:choose>
													<c:when test="${paginate.currentPageNum eq countNum}">
														<li><a href="javascript:void(0)" class="curr" onclick="jumpPage(this);" pagval="1">${countNum}</a></li>
													</c:when>
													<c:otherwise>
														<li><a href='javascript:void(0)' onclick='ftiaoPageUtils.toPage("${countNum}");'>${countNum}</a></li>
													</c:otherwise>
												</c:choose>
										</c:forEach>
									</c:when>
								</c:choose>
							</c:when>
							<c:when test="${ (paginate.currentPageNum ge paginate.showTags) and (paginate.currentPageNum le paginate.pageTotal)}">
								<c:choose>
									<c:when test="${paginate.currentPageNum le paginate.pageTotal}">
										<c:choose>
											<c:when test="${(paginate.currentPageNum +2) gt paginate.pageTotal}">
													<c:forEach var="countNum"  begin="${paginate.pageTotal-paginate.showTags+1}" end="${paginate.pageTotal}" step="1">
														<c:choose>
															<c:when test="${paginate.currentPageNum eq countNum}">
																<li><a href="javascript:void(0)" class="curr" onclick="jumpPage(this);" pagval="1">${countNum}</a></li>
															</c:when>
															<c:otherwise>
																<li><a href='javascript:void(0)' onclick='ftiaoPageUtils.toPage("${countNum}");'>${countNum}</a></li>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</c:when>
											<c:when test="${ (paginate.currentPageNum le (paginate.pageTotal-2)) }">
													<c:forEach var="countNum"
														begin="${paginate.currentPageNum-paginate.showTags+3}"
														end="${paginate.currentPageNum+2}" step="1">
														<c:choose>
															<c:when test="${paginate.currentPageNum eq countNum}">
																<li><a href="javascript:void(0)" class="curr" onclick="jumpPage(this);" pagval="1">${countNum}</a></li>
															</c:when>
															<c:otherwise>
																<li><a href='javascript:void(0)' onclick='ftiaoPageUtils.toPage("${countNum}");'>${countNum}</a></li>
															</c:otherwise>
														</c:choose>
													</c:forEach>
												</c:when>
										</c:choose>
									</c:when>
									<c:otherwise>
											<c:forEach var="countNum"
												begin="${paginate.pageTotal-paginate.showTags}" end="${paginate.pageTotal}"
												step="1">
												<c:choose>
													<c:when test="${paginate.currentPageNum eq countNum}">
														<li><a href="javascript:void(0)" class="curr" onclick="jumpPage(this);" pagval="1">${countNum}</a></li>
													</c:when>
													<c:otherwise>
														<li><a href='javascript:void(0)' onclick='ftiaoPageUtils.toPage("${countNum}");'>${countNum}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</c:otherwise>
								</c:choose>
							</c:when>
						</c:choose>
					</c:when>
				</c:choose>
				<c:if test="${(paginate.pageTotal gt paginate.showTags) and ((paginate.currentPageNum + paginate.showTags-2) le paginate.pageTotal)}">
						<c:if test="${(paginate.currentPageNum + paginate.showTags-2) ne paginate.pageTotal}">
							<li><span class="pb_more">...</span></li>
						</c:if>
						<li class="nextPage"><a href='javascript:void(0)' onclick='ftiaoPageUtils.toPage("${paginate.pageTotal}");' >${paginate.pageTotal}</a></li>
				</c:if>
		<c:choose>
			<c:when test="${paginate.currentPageNum eq paginate.pageTotal}">
				<li class="nextPage"><a href='javascript:void(0)' class="pages_last" > &gt;&gt; </a></li>
				<li class="nextPage"><a href='javascript:void(0)' class="pages_last">尾页</a></li>
			</c:when>
			<c:otherwise>
				<li class="nextPage"><a href='javascript:void(0)' class="pages_last" onclick='ftiaoPageUtils.toPage("${paginate.currentPageNum + 1}")'>&gt;&gt;</a></li>
				<li class="nextPage"><a href='javascript:void(0)' onclick='ftiaoPageUtils.toPage("${paginate.pageTotal}");' class="pages_last">尾页</a></li>
			</c:otherwise>
		</c:choose>
<%-- 		 <input type='text' style="width:30px;line-height:26px; height: 13px;height: 26px;!important" name='toPageNum' id='toPageNum'  onkeypress='ftiaoPageUtils.enterToPage("${paginate.pageTotal}",event);'></input> <a href="javascript:void(0)" id='toPageNumSure'
			onclick='ftiaoPageUtils.goPage("${paginate.pageTotal}");' style="color: #333333;font-weight: bold;padding: 0 14px;">确定</a>
 --%>	</ul>
	</div>
</c:if>
