<%@taglib uri='http://java.sun.com/jstl/core_rt' prefix='c'%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<input type="hidden" id="_CONTEXT_PATH" value="${ctx}">

<div class="fl_nav">
<div class="fl_nav_top"></div>

<ul>
<li id="assets"><a href="${ctx}/assets/search.do" ><i class="n1" ></i>资产发布</a></li>

<li id="assetsconcern"><a href="${ctx}/assetsconcern/search.do"><i class="n2"></i>我的关注</a></li>

<li class="sub_nav"><a href="#"><i class="n3"></i>交易管理<i class="arrow up"></i></a>

<ul class="sub_list" id="deal">
<li id="assetsdeal"><a href="${ctx}/assetsdeal/search.do">出让资产</a></li>

<li id="assetstrading"><a href="${ctx}/assetstrading/search.do" >认购资产</a></li>
</ul>

</li>
<li class="sub_nav" ><a href="#"><i class="n4"></i>账户管理<i class="arrow up"></i></a>
<ul class="sub_list" id="account">
<li id="password"><a href="${ctx}/changepassword/merge.do">密码管理</a></li>
<li id="businessuser"><a href="${ctx}/businessuser/merge.do">个人信息</a></li>
</ul></li>
<!-- <li><a href="#"><i class="n5"></i>资产预约</a></li>
<li><a href="#"><i class="n6"></i>我的欧巴</a></li>
 -->
</ul>

</div>

<script type="text/javascript">
$(function(){
	var pathname = window.location.pathname;
	if (pathname.indexOf('assets/search.do')>0)
	{
		$("#assets").addClass('active');
	}
	if (pathname.indexOf('assetsconcern/search.do')>0)
	{
		$("#assetsconcern").addClass('active');
	}
	if (pathname.indexOf('assetsdeal/search.do')>0)
	{
		$("#assetsdeal").addClass('active');
		$("#deal").slideDown('fast');  
	}
	if (pathname.indexOf('assetstrading/search.do')>0)
	{
		$("#assetstrading").addClass('active');
		$("#deal").slideDown('fast');  
	}
	if (pathname.indexOf('businessuser/merge.do')>0)
	{
		$("#businessuser").addClass('active');
		$("#account").slideDown('fast');  
	}
 	if (pathname.indexOf('changepassword/merge.do')>0)
	{
		$("#password").addClass('active');
		$("#account").slideDown('fast');  
	}
 	
	
});	
</script>