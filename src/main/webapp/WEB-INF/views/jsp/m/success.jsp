<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + ":/"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link href="${ctx}/css/comm.css?v=1" rel="stylesheet" type="text/css">
<link href="${ctx}/css/login.css?v=1" rel="stylesheet" type="text/css">
<script src="${ctx}/js/common/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="${ctx}/js/my_comm.js?v=1" charset="UTF-8"></script> 
<script type="text/javascript" charset="UTF-8">
$(function(){ 
function jump(count) { 
			window.setTimeout(function(){ 
				count--; 
				if(count > 0) { 
					$('.showbox').html(count);; 
					jump(count); 
				} else { 
					location.href=$("#jump_href").attr("href");; 
				} 
			}, 1000); 
		} 
		jump(3); 
	
	
})
</script>



</head>
<body onload="jump(3)">
<div class="lg_banner_wrap">
    <div class="lg_banner" id="gLogin">
       <!--start-->
      <div class="fine_login box_shadow reset_right regist_succ">
          <p>${addMsg}</p>
          <p class="jump_p">页面将在<span class="showbox">3</span>秒后跳转至<a href="${ctx}/m/authority/login.do" id="jump_href">登录</a>界面...</p>
      </div>
</div>
</div>