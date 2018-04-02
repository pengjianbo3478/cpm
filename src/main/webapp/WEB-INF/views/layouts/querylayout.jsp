<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri='http://java.sun.com/jstl/core_rt' prefix='c'%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<c:set var="ctx" scope="request"
	value="${pageContext.request.scheme}${'://'}${pageContext.request.serverName}${':'}${pageContext.request.serverPort}${pageContext.request.contextPath}" />

<script type="text/javascript" src="${ctx}/js/common/pageUtils4Ajax.js"></script>
<script type="text/javascript" src="${ctx}/js/common/jquery.alerts.js"></script>


<tiles:insertAttribute name="content" />
<tiles:insertAttribute name="paginate" />
