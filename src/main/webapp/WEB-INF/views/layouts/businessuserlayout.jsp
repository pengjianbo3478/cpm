<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri='http://java.sun.com/jstl/core_rt' prefix='c'%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"  
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<c:set var="static_ftiao_cn" scope="request" value="${pageContext.request.scheme}${'://'}${pageContext.request.serverName}${':'}${pageContext.request.serverPort}${pageContext.request.contextPath}" />
<c:set var="ctx" scope="request" value="${pageContext.request.scheme}${'://'}${pageContext.request.serverName}${':'}${pageContext.request.serverPort}${pageContext.request.contextPath}" />
<c:if test="${fn:contains(ctx, 'localhost') }">
	<c:set var="static_ftiao_cn" scope="request" value="${ctx}" />
</c:if>
<script type="text/javascript" src="${static_ftiao_cn}/js/common/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${static_ftiao_cn}/js/common/jquery.metadata.js"></script>
<script type="text/javascript" src="${static_ftiao_cn}/js/common/jquery.validate.js"></script>
<script type="text/javascript" src="${static_ftiao_cn}/js/common/messages_zh.js"></script>
<script type="text/javascript" src="${static_ftiao_cn}/js/common/menu.js?v=1.2"></script>
<script type="text/javascript" src="${static_ftiao_cn}/js/common/sys.js?v=1.1"></script>
<script type="text/javascript" src="${static_ftiao_cn}/js/common/utils.js"></script>
<!--[if lt IE 8 ]><srcipt src="json.js?v=1"></script><![endif]-->
<script type="text/javascript" src="${static_ftiao_cn}/js/common/jquery.alerts.js"></script>
</head>
<body>
 					<tiles:insertAttribute name="body" />    
 </body>
</html>