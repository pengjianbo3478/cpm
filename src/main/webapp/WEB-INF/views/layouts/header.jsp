<%@page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib uri='http://java.sun.com/jstl/core_rt' prefix='c'%>
<%@taglib prefix='security' uri='http://www.springframework.org/security/tags'%>
<security:authentication property="principal" var="authentication" />

     <div class="head_mid">
         <div class="fast_menu">             
<!--              <a href="#" class="first"><i class="icons1"></i>找资产</a> 
 -->             <a href="${ctx}/assets/add.do"><i class="icons2"></i>找资金</a> 
             <a href="${ctx}/index.do" class="last"><i class="icons3"></i>资产展示</a> 
             <div class="line_l"></div><div class="line_R"></div>
         </div>
         <ul class="user_menu">
             <li><a href="#">联系我们</a></li>
             <li><a href="${ctx}/assets/search.do">我的欧巴金融</a></li>
             <li class="last">欢迎你！${authentication.username} &nbsp;<a href="${ctx}/logout">[退出]</a></li>
         </ul>
     </div>
