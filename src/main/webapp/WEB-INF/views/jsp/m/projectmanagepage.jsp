<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<HTML>
<HEAD class="header">
<META content="IE=11.0000" http-equiv="X-UA-Compatible">
<TITLE>资产基本信息</TITLE>
<META charset="utf-8">
<META name="keywords" content="">
<META name="description" content="">
<META name="viewport"
	content="user-scalable=no,initial-scale=1.0,maximum-scale=1.0,width=device-width,min-width=800px">
<META name="apple-mobile-web-app-title" content="">
<META name="apple-mobile-web-app-capable" content="yes">
<META name="apple-mobile-web-app-status-bar-style"
	content="black-translucent">
<META name="format-detection" content="telephone=no">
<META name="format-detection" content="email=no">
<META name="renderer" content="webkit|ie-comp|ie-stand">
<script type="text/javascript" src="${ctx}/m/js/jquery-1.11.1.min.js"></script>
<script src="${ctx}/m/js/assets.js?v=1.1" charset="UTF-8"></script> 

<script type="text/javascript">
function click_val(){
	checkForm();
	$('#form').submit();
}
</script>

<style type="text/css">
li{
	list-style-type:none;
	display: inline-block;
	margin: 5px;
}
.labels{
	width:100px;
}
.contents, .txt1, .txt2, .txt3, .txt4, .txt5{
	border: none;
	width: 100%;
	color:#7c7c7c;
	font-size:14px;
	height: 45px;
}
select{
	border: none;
	width: 100%;
	color:#7c7c7c;
	font-size:14px;
	height: 45px;
}
option{
	border: none;
	width: 100%;
	color:#7c7c7c;
	font-size:14px;
	height: 45px;
}
tr{
	width:100%;
	height: 45px;
}
.contentTd{
	border-bottom: solid 1px #eaeaea;
}
td{
	border-bottom: solid 1px #eaeaea;
}
.txt3,.txt5{
	width: 45%;
}
.txt2,.txt4{
	width: 50%;
}
.txt8{
	border: none;
	width: 100%;
	color:#7c7c7c;
	font-size:14px;
}
.btntype{
	width: 45%;
    height: 45px;
    line-height: 45px;
    background-color: #309DE6;
    border-radius: 8px;
    color: #ffffff;
}
</style>


</HEAD>

<body style="background-color: #f8f8f8;margin:0px;">
    <form:form commandName="assets" id="form" modelAttribute="assets" action="${ctx}/m/assets/merge.do" method="POST" enctype="multipart/form-data">	
		<div id="assetlist" class="j-page" style="background-color: #f8f8f8; border-top: solid 1px #ADB5CA; margin-top: 20px;">
		<table style="width:100%; border-collapse:collapse;">
			<tr style="width:100%;">
				<td class="labels">
					<label style="float: left;color:#000000;">资产名称</label>
				</td>
				<td class="contentTd">
				 	<form:hidden path="id" value="${id }"/>
					 <form:input path="assetsName" class="contents"  value="${assets.assetsName}" type="text" maxlength="50" />
				</td>
			</tr>
			<tr style="width:100%;">
				<td class="labels">
					项目类型
				</td>
				<td class="contentTd">
					 <form:select path="assetType" class="txt3"  onChange="showInput1(this.value);">                                       
                    			<form:options items="${assetTypelist}" itemLabel="value" itemValue="key" />
                     </form:select>	
                     <form:input path="assetTypeOther" id="other_input_1" cssClass="txt2" />
				</td>
			</tr>
			<tr style="width:100%;">
				<td class="labels">
					融资主体
				</td>
				<td class="contentTd">
					<form:input path="financing"  class="contents"  value="${assets.financing}" type="text" />
				</td>
			</tr>
			<tr style="width:100%;">
				<td class="labels">
					融资主体类型
				</td>
				<td class="contentTd">
					 <form:select path="financingCategory" class="txt3"  onChange="showInput1(this.value);">
                    			<form:options items="${financingCategoryList}" itemLabel="value" itemValue="key" />
                    		</form:select>
                      <form:input path="financingCategoryOther" cssClass="txt2" />	
				<td class="contentTd">
				</td>
			</tr>
			<tr style="width:100%;">
				<td class="labels">
					融资主体信用描述
				</td>
				<td class="contentTd">
					<form:textarea path="financingCredit" class="contents"  value="${assets.assetsName}" type="text"/>
				</td>
			</tr>
			<tr style="width:100%;">
				<td class="labels">
					资产地区
				</td>
				<td class="contentTd">
					 <form:input path="assetArea" cssClass="txt1" />
				</td>
			</tr>
			<tr style="width:100%;">
				<td class="labels">
					融资规模
				</td>
				<td class="contentTd">
					 <form:input path="assetScales" cssClass="txt4" />
                         <form:select path="assetUnit" class="txt3"  onChange="showInput1(this.value);">
                    			<form:options items="${assetUnitSelectList}" itemLabel="value" itemValue="key" />
                    		</form:select>
				</td>
			</tr>
			<tr style="width:100%;">
				<td class="labels">
					预计收益率
				</td>
				<td class="contentTd">
					<form:input path="yieldMin" style="width: 50px;" cssClass="txt5" />
                    <span class="txt6">--</span>
                    <form:input path="yieldMax" style="width: 50px;" cssClass="txt5" />
				</td>
			</tr>
			<tr style="width:100%;">
				<td class="labels">
					期限
				</td>
				<td class="contentTd">
					<input class="contents" style="width: 50px;"  value="${assets.termMin}" type="text" id="termMin"
						name="termMin" onkeyup="value=value.replace(/[^\d]/g,'')" />+
					<input class="contents" style="width: 50px;"   value="${assets.termMax}" type="text" id="termMax"
						name="termMax" onkeyup="value=value.replace(/[^\d]/g,'')" />个月
				</td>
			</tr>
			<tr style="width:100%;">
				<td class="labels">
					资产地区
				</td>
				<td class="contentTd">
					 <form:input path="assetArea" cssClass="txt1" />
				</td>
			</tr>
			<tr style="width:100%;">
				<td class="labels">
					资金用途
				</td>
				<td class="contentTd">
					<form:input path="useOfFunds" cssClass="txt1" />
				</td>
			</tr>
			<tr style="width:100%;">
				<td class="labels">
					项目进度
				</td>
				<td class="contentTd">
					 <form:select path="assetStatus" class="txt3" >
                    			<form:options items="${Assets_progress}" itemLabel="value" itemValue="key" onChange="showInput1(this.value);"/>
                    		</form:select>
				</td>
			</tr>
			<tr style="width:100%;">
				<td class="labels">
					开放对象
				</td>
				<td class="contentTd">
						<li><label>银行<form:checkbox path="targetlist" value="1" class="check_input" /></label></li>  
						<li><label>保险<form:checkbox path="targetlist" value="2" class="check_input"/></label></li>  
						<li><label>公募<form:checkbox path="targetlist" value="3" class="check_input"/></label></li>  
						<li><label>私募<form:checkbox path="targetlist" value="4" class="check_input"/></label></li>    
						<li><label>券商<form:checkbox path="targetlist" value="5" class="check_input"/></label></li>    
						<li><label>信托<form:checkbox path="targetlist" value="6" class="check_input"/></label></li>    
						<li><label>金融租赁<form:checkbox path="targetlist" value="7" class="check_input"/></label></li>    
						<li><label>金控集团<form:checkbox path="targetlist" value="8" class="check_input"/></label></li>    
						<li><label>互金工司<form:checkbox path="targetlist" value="9" class="check_input"/></label></li>    
						<li><label>商业保理<form:checkbox path="targetlist" value="10" class="check_input"/></label></li>    
						<li><label>商业租赁<form:checkbox path="targetlist" value="11" class="check_input"/></label></li>    
						<li><label>其他<form:checkbox path="targetlist" value="12" class="check_input"/></label></li> 
						<li class="last"><label>不限<form:checkbox path="targetlist" value="99" class="check_input"/></label></li>     
				</td>
			</tr>
			<tr style="width:100%;">
				<td class="labels" colspan="2">
					资产介绍
				</td>
			</tr>
			<tr style="width:100%;">
				<td colspan="2">
					<form:input path="introduction" cssClass="txt1" />
				</td>
			</tr>
			<tr style="width:100%;">
				<td class="labels" colspan="2">
					担保主体和措施
				</td>
			</tr>
			<tr style="width:100%;">
				<td colspan="2">
					<form:textarea path="financingAssure" cssClass="txt8" cols="45" rows="5"/>
				</td>
			</tr>
			<tr style="width:100%;">
				<td class="labels" colspan="2">
					其他
				</td>
			</tr>
			<tr style="width:100%;">
				<td colspan="2">
					  <form:textarea path="other" cssClass="txt8" cols="45" rows="5" />
				</td>
			</tr>
			<tr style="width:100%;">
				<td class="labels">
					上传
				</td>
				<td class="contentTd">
					  <div class="file-box1">
                         <input type="text" name="textfield" id="textfield3" class="txt4" placeholder="项目说明书原件">  
                         <input type="file" style="width: 68px;" name="myfile" class="file1" id="imagefile3" size="28" onchange="document.getElementById('textfield3').value=this.value;document.getElementById('textfield3').style.textIndent='5px'">
                      </div>
				</td>
			</tr>
		</table>
		<div style="font-size: 14px;">
			<div style="margin-top: 15px; margin-bottom: 90px;text-align: center;">
				   <c:if test="${status=='DF'}">
				    	<input onlick="window.location.href=''" type="button" value="提交" class="btntype"/>
				     </c:if>
				     <c:if test="${status=='OL'}">
				    	<input onlick="window.location.href=''" type="button" value="终止" class="btntype"/>
				     </c:if>
					 <c:if test="${status!='PA'}">
				     	<input onclick="click_val()"  type="button" value="修改" class="btntype"/>
				     </c:if>
			</div>
		</div>	
		<jsp:include page="./Tail.jsp"></jsp:include>
	</div>
</form:form>	
	<script type="text/javascript">
		if('${status}' == 'PA'){
			$("input").attr("disabled","disabled");
			$("select").attr("disabled","disabled");
			$("textarea").attr("disabled","disabled");
		}
	
		function checkform() {
			var reg = /^[\u0391-\uFFE5A-Za-z0-9]+$/;//判断是否为非法字符
			var projectname = document.getElementById("projectname").value;//项目名称
			var Financemainbody = document.getElementById("Financemainbody").value;//融资主体
			var Financedescription = document
					.getElementById("Financedescription").value;//融资主体信用描述
			var Assetsin = document.getElementById("Assetsin").value;//资产地区
			var Financescale = document.getElementById("Financescale").value;//融资规模
			var yield = document.getElementById("yield").value;//预计收益率
			var deadline = document.getElementById("deadline").value;//期限
			var CapitalUSES = document.getElementById("CapitalUSES").value;//资金用途
			var Assetsintroduce = document.getElementById("Assetsintroduce").value;//资产介绍
			var Guaranteesubject = document.getElementById("Guaranteesubject").value;//担保主体和措施
			var rest = document.getElementById("rest").value;//其他
			if ("" == projectname) {
				alert("请输入项目名称！");
				return false;
			} else if (!reg.test(projectname)) {
				alert("项目名称不能含有特殊字符！");
				return false;
			} else if (!reg.test(CapitalUSES)) {
				alert("资金用途不能含有特殊字符！");
				return false;
			} else if ("" == Assetsin) {
				alert("请输入资产地区");
				return false;
			} else if ("" == Financescale) {
				alert("请输入融资规模");
				return false;
			} else if ("" == Financemainbody) {
				alert("请输入融资主体");
				return false;
			} else if (!reg.test(Financemainbody)) {
				alert("融资主体不能含有特殊字符");
				return false;
			} else if ("" == Financedescription) {
				alert("请输入融资主体信用描述");
				return false;
			} else if (!reg.test(Financedescription)) {
				alert("融资主体信用描述不能含有特殊字符");
				return false;
			} else if (!reg.test(Guaranteesubject)) {
				alert("担保主体和措施不能含有特殊字符");
				return false;
			} else if (!reg.test(Financedescription)) {
				alert("其他输入不能含有特殊字符");
				return false;
			} else if ("" == Assetsintroduce) {
				alert("请输入资产介绍");
				return false;
			} else if (!reg.test(Assetsintroduce)) {
				alert("资产介绍不能含有特殊字符");
				return false;
			}

		}
	</script>
</body>
</html>