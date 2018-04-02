<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib uri='http://java.sun.com/jstl/core_rt' prefix='c'%>
<%@taglib prefix='security' uri='http://www.springframework.org/security/tags'%>
<security:authentication property="principal" var="authentication" />

<!--顶部页头start-->
<div class="header_w">
     <div class="head_mid">
         <div class="logo1"></div>
         <div class="fast_menu">             
<!--              <a href="#" class="first"><i class="icons1"></i>找资产</a> 
 -->             <a href="${ctx}/assets/add.do"><i class="icons2"></i>找资金</a> 
             <a href="${ctx}/index.do" class="last"><i class="icons3"></i>资产展示</a> 
             <div class="line_l"></div><div class="line_R"></div>
         </div>
         <ul class="user_menu">
             <li><a href="#">联系我们</a></li>
<!--              <li><a href="#" class="fl">站内信<span>（5）</span></a><i class="fl"></i></li>
 -->             <li><a href="${ctx}/assets/search.do">我的欧巴金融</a></li>
             <li class="last" style=" color: #333;">欢迎你！${authentication.username} &nbsp;<a href="${ctx}/logout">[退出]</a></li>
         </ul>
     </div>
</div>
<div class="banner1"></div>
