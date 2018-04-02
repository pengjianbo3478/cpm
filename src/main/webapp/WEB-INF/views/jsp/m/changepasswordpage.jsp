
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + ":/"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<HTML>
<HEAD>
<META content="IE=11.0000" http-equiv="X-UA-Compatible">
<TITLE>修改密码</TITLE>
<META charset="utf-8">
<META name="keywords" content="">
<META name="description" content="">
<META name="viewport"  content="user-scalable=no,initial-scale=1.0,maximum-scale=1.0,width=device-width,min-width=800px">
<META name="apple-mobile-web-app-title" content="">
<META name="apple-mobile-web-app-capable" content="yes">
<META name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<META name="format-detection" content="telephone=no">
<META name="format-detection" content="email=no">
<META name="renderer" content="webkit|ie-comp|ie-stand">
<link rel="shortcut icon" href="${ctx}/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${ctx}/favicon.ico" type="image/x-icon" />

<META name="GENERATOR" content="MSHTML 11.00.10240.16391">
<style type="text/css">
.left{
	width:120px;
	height:45px;
	line-height: 45px;
	border-bottom: solid 1px #eaeaea;
}
.right input{
    height: 45px;
    line-height: 45px;
	width:100%;
	border: none;
}
.right{
    height: 45px;
    line-height: 45px;
	border-bottom: solid 1px #eaeaea;
}
</style>
</HEAD>
<body style="margin:0px;">
        <div  class="g-body">
         <form action="${ctx}/changepassword/merge.do" method="POST" id="changepassword">
	        <div style="margin-top:50px;">
	        	<table style="width: 96%;margin-left:2%; border-collapse: collapse;border-top:solid 1px #eaeaea;">
	        		<tr style="width: 100%">
	        			<td class="left">
							<span style="background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/password.png) no-repeat;background-size: 18px;font-size:18px;background-position:2px 0px ;color:#333333;" >旧密码</span>        			
	        			</td>
	        			<td class="right">
	        				 <input type="password" name="oldPassword" id="oldPwd" placeholder="请输入旧密码">
	        			</td>
	        		</tr>
	        		<tr>
	        			<td class="left">
							<span style="background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/password.png) no-repeat;background-size: 18px;font-size:18px;background-position:2px 0px ;color:#333333;" >新密码</span>        			
	        			</td>
	        			<td class="right">
	        				 <input type="password" name="acctPassword" id="newPwd" placeholder="请输入新密码">
	        			</td>
	        		</tr>
	        		<tr>
	        			<td class="left">
							<span style="background-position:0 0px;padding-left:25px; background: url(${ctx}/m/images/password.png) no-repeat;background-size: 18px;font-size:18px;background-position:2px 0px ;color:#333333;" >确认密码</span>        			
	        			</td>
	        			<td class="right">
	        				<input type="password" name="confirmNewPassword" id="confirmNewPwd" placeholder="请输入确认密码">
	        			</td>
	        		</tr>
	        		</tr>
	        		<tr>
	        			<td class="right">
	        				<div style="color: red">${msg}</div>
	        			</td>
	        		</tr>
	        	</table>
	        	<div style="width: 100%;text-align: center;">
	        		<input type="submit" style="background-color: #319DE6; color: #ffffff;width: 96%; height: 45px;border-radius:8px;" value="提 交"/>
	        	</div>
			</div>
		</form>	
        </div>
        
<script type="text/javascript">
var  errorTips = '${errorTips}';
if(errorTips!=null && ''!=errorTips && 'undefined'!=errorTips){
	 alert(errorTips);
}
</script>
<script type="text/javascript">

 function checkForm(){
	 if(!checkDouble()){
		 return;
	 }
		var passwd =document.getElementById("passwd").value;//输入的旧密码
		var npasswd1=document.getElementById("npasswd1").value;//新密码
		var loginId=document.getElementById("loginId").value;//确认密码
		//正则匹配式子
		var regex=/^(?=.*[a-zA-Z]+)(?=.*[0-9]+)[a-zA-Z0-9]{6,16}$/;
		if(""==passwd){
			alert("请填写旧密码！");
			return false;
		}else if(passwd.length > 16 || passwd.length < 6){
			document.getElementById("passwd").value='';
			document.getElementById("npasswd1").value='';
			document.getElementById("loginId").value='';
			alert("输入的旧密码为6-16位！");
			return false;
		}else if(""==npasswd1){
			alert("请填写新密码！");
			return false;
		}else if(!regex.test(npasswd1)){
			alert("新密码为6-16位(数字与字母组成)！");
			document.getElementById("npasswd1").value='';
			return false;
		}else if (npasswd1 == passwd){
			alert("输入的新密码与旧密不能相同!请重新输入！");
			document.getElementById("npasswd1").value='';
			return false;
		}else if(""==loginId){
			alert("请填写确认密码！");
			return false;
		}else if (npasswd1!=loginId){
			alert("输入的新密码和确认密码不一致!请重新输入");
			document.getElementById("npasswd1").value='';
			document.getElementById("loginId").value='';
			return false;
		} 
		 document.getElementById("pressBoolean").disabled = true;//点击按钮后将按钮置为不可点 
		//base64 加密
		 var b = new Base64();  
		//输入的旧密码加密
		passwd = b.encode(passwd);
		//输入的新密码加密
		npasswd1 = b.encode(npasswd1);
	 	var data = "passwd="+passwd+"&npasswd1="+npasswd1;
	 	 $.ajax({
			type : "post",
			url : "${ctx}/accountManage/h5/reLoginPasswordApp.do",
			async : false,
			data : data,
			success : function( data ) {
				var dataObj = eval("(" + data + ")");
				 if(data==null){
					alert("连接后台错误！请联系客户人员");
				}else{
					if("noLogin"==dataObj.errorTips){
			    		 window.location.href="${ctx}/home/h5/login.do?errorTips=errorTip0";
			    	}else if("000000"==dataObj.respcode){
						alert("修改登录密码成功！");
						window.location.href="${ctx}/accountManage/h5/passwordManage.do";
					}else{	
					   	alert(dataObj.errorTips);
					}
				}
				// 避免重复提交
					setLastTime(new Date().getTime() + "");
					document.getElementById("pressBoolean").disabled="";
			}
		 });
 }
</script>        
        
        
</body>
</html>