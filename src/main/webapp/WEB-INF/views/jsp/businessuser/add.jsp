<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link href="${static_ftiao_cn}/css/comm.css?v=1" rel="stylesheet" type="text/css">
<link href="${static_ftiao_cn}/css/login.css?v=1" rel="stylesheet" type="text/css">
<script src="${static_ftiao_cn}/js/common/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="${static_ftiao_cn}/js/jquery.validate.js" type="text/javascript"></script>
<script src="${static_ftiao_cn}/js/my_comm.js?v=1" charset="UTF-8"></script>
<script src="${static_ftiao_cn}/js/businessuser/add.js?v=1"></script>
<style type="text/css">
.error_1 {
	color: #FF0000;
}
</style>
<script type="text/javascript" charset="UTF-8">
	function changeCode() {
		$('#kaptchaImage').hide().attr('src', '${ctx}/captcha.html?' + Math.floor(Math.random() * 100)).fadeIn();
	}
	var wait = 30;
	function phoneCode(o) {
		var _phone = $("#_phone").val();
		var code_ = $("#code_").val();
		if (_phone == '') {
			$("#msgcode").text("手机号不能为空");
			return false;
		}else if (code_  == '') {
			$("#msgcode").text("图形验证码不能为空");
			return false;
		}
		else if (_phone != '') {
			$("#msgcode").text("");
		}
		var url = "${ctx}/businessuser/phonecode.do";
		$.post(url, {
			mobile : $('#_phone').val(),
			code : $("#code_").val(),
			type : 1
		}, function(data) {
			if (data.result == "N") {
				$("#codeMsg_").text("发送短信验证码失败，请先确认图形验证码");
			}
			else{
				count();
			}
		}, "json");
		
	}
	function count(){
		$("#codeMsg_").text("");
		var o = document.getElementById("btn2");
		if (wait == 0) {
			o.removeAttribute("disabled");
			o.value = "重新获取";
			wait = 30;
		} else {
			o.setAttribute("disabled", true);
			o.value = "已发送(" + wait + ")";
			wait--;
			setTimeout(function() {
				count(wait);
			}, 1000);
		}
	}
	/* document.getElementById("btn2").onclick = function() {
		phoneCode(this);
	} */
	function checkPhone() {
		var url = "${ctx}/businessuser/checkphone.do";
		$.post(url, {
			phone : $('#_phone').val()
		}, function(data) {
			if (data == false) {
				$("#btn2").attr("disabled", "disabled");
			} else {
				$("#btn2").attr("disabled", false);
			}
		}, "json");
	}
	/*****
	function checkCode() {
		var url = "${ctx}/businessuser/checkcode.do"
		$.post(url, {
			code : $("#code_").val()
		}, function(data) {
			if (data.result == "N") {
				$("#btn2").attr("disabled", "disabled");
				$("#codeMsg_").text("图形验证码不正确");
			} else {
				$("#codeMsg_").text("");
				$("#btn2").attr("disabled", false);
			}
		}, "json")
	}*/
	
	function checkFile() {
		var cc = aaa();
		for(var i = 0; i < cc.length; i++){
			if(!cc[i]){
				return false;
			}
		}
	}
	function aaa(){
		var _file = $(".file1");
		$(".tips").text("");
		var flag = [];
		for(var i = 0; i < _file.length; i++){
			var myfile = _file[i].value;
			var point = myfile.lastIndexOf("."); 
		    var type = myfile.substr(point);
		    var fileid = $(_file[i]).attr("id");
				 if(type==".jpg"||type==".gif"||type==".JPG"||type==".GIF"||type==".PNG"||type==".png"){
		    	 img = document.createElement("img");       
		         img.src=location;
		         if(img.fileSize>204800){
						$(_file[i]).parent().find(".tips").html("图片尺寸请不要大于100KB");
		        	  alert("图片尺寸请不要大于100KB"); 
		        	  flag[i] = false;
		         }else{
		        	 flag[i] = true;
		        }
		    }else if(fileid != "imagefile3" || (fileid == "imagefile3" && $.trim(type) != "")){
		    	$(_file[i]).parent().find(".tips").html("只能上传图片类型的文件");
		    	 flag[i] = false;
		    }
		}
		return flag;
	}
	function ccc(myfile, id){
		var point = myfile.lastIndexOf(".");     
	    var type = myfile.substr(point);
	    if(type==".jpg"||type==".gif"||type==".JPG"||type==".GIF"||type==".PNG"||type==".png"||type==".PDF"||type==".pdf"){
	    	 img = document.createElement("img"); 
	         img.src=location;
	         if(img.fileSize>204800){     
	        	  alert("图片尺寸请不要大于100KB");     
				  return false;
	         }
	         return true;
	    }else{
	    	$(id).text("只能上传图片类型的文件");
	        return false;     
	    }
	}
</script>
<!--顶部页头start-->
<div class="lg_head">
	<a href="${ctx}/" class="logo"></a>
	<a href="${ctx}/login.html" class="lg_btn">
		<span>登录</span>
	</a>
	<a href="#" class="lg_btn  lg_btn_curr">注册</a>
	<a href="${ctx}/" class="lg_btn">首页</a>
</div>
<!--顶部页头end-->
<!--内容主体start-->
<div class="lg_warp2">
	<div class="title_head2">
		<img src="${ctx}/images/register.png" width="535" height="80" alt="" />
		<h1>信息填写</h1>
		<p>
			开通平台主要服务于机构会员及其业务人员。请正确填写以下信息，
			<br>
			我们会尽快与您联系，进行机构认证。
		</p>
	</div>
	<form:form commandName="businessUser" modelAttribute="businessUser" action="${ctx}/sign_up.html" method="post" id="businessuser" onsubmit="return checkFile() ;"   enctype="multipart/form-data">
		<!--注册start-->
		<div class="m-reg m-reg1">
			<div class="m_login_wrap">
				<div class="header"></div>
				<div class="main">
					<div class="input_wrap">
						<input name="institutionName" id="institutionName_" placeholder="机构名称" type="text" maxlength="40" value="${businessUser.institutionName}">
					</div>
					<div class="input_wrap">
						<input name="name" placeholder="姓名" type="text" value="${businessUser.name}">
					</div>
					<div class="input_wrap">
						<input name="email" placeholder="邮箱" type="text" id="_email" value="${businessUser.email}">
					</div>
					<div class="input_wrap  mscode1">
						<input name="code" placeholder="图形验证码" type="text" id=code_ >
						<a>
							<img alt="" src="${ctx}/captcha.html" id="kaptchaImage" onclick="changeCode()">
						</a>
						<div id="codeMsg_" class="tips">${codeMsg}</div>
					</div>
					<div class="input_wrap  mobile">
						<input name="phone" placeholder="手机号码" type="text" maxlength="11" id="_phone" value="${businessUser.phone}" onchange=" checkPhone()">
						<div class="tips" id="msgcode">${msg1}</div>
						<span>将开通或绑定平台</span>
					</div>
					<div class="input_wrap  mscode2">
						<span>
							<input name="msgCode" id="" placeholder="短信验证码" type="text" maxlength="6">
						</span>
						<input type="button" id="btn2" value="获取" class="btn_input" onclick="phoneCode(this)">
						<!--<button type="button" id="" class="z-dis">已发送（60s）</button>-->
					</div>
				</div>
			</div>
			<div class="m_login_blac"></div>
		</div>
		<div class="reg_line"></div>
		<!--上传文件start-->
		<div class="m-reg m-reg2">
			<div class="m_login_wrap">
				<div class="header">
					<i></i>
					<h2>上传附件${codeMsg}</h2>
				</div>
				<div class="main">
					<dl class="dl1">
						<dt>身份证/工作证</dt>
						<dd>
							<div class="file-box1">
								<input type="text" id="textfield1" class="txt1" placeholder="上传证件正面照片" />
								<input type="button" class="btn1" value="浏览..." />
								<input type="file" name="myfiles1" class="file1"   id="imagefile1" size="28" onchange="document.getElementById('textfield1').value=this.value;document.getElementById('textfield1').style.textIndent='5px'" />
								<div id="file1" class="tips">${myfiles1}</div>
							</div>
						</dd>
					</dl>
					<dl class="dl1">
						<dt>名片</dt>
						<dd>
							<div class="file-box1">
								<input type="text" id="textfield2" class="txt1" placeholder="上传证件正面照片">
								<input type="button" class="btn1" value="浏览...">
								<input type="file" name="myfiles2" class="file1" id="imagefile2" size="28" onchange="document.getElementById('textfield2').value=this.value;document.getElementById('textfield2').style.textIndent='5px'">
								<div id="file2" class="tips">${myfiles2}</div>
							</div>
						</dd>
					</dl>
					<dl class="dl1">
						<dt>其他证明文件</dt>
						<dd>
							<div class="file-box1">
								<input type="text" id="textfield3" class="txt1" placeholder="上传证件正面照片">
								<input type="button" class="btn1" value="浏览...">
								<input type="file" name="myfiles3" class="file1" id="imagefile3" size="28" onchange="document.getElementById('textfield3').value=this.value;document.getElementById('textfield3').style.textIndent='5px'">
								<div id="file3" class="tips">${myfiles2}</div>
							</div>
						</dd>
					</dl>
					<!-- <div class="input_wrap  err" id="pERR2">账号或密码错误</div> -->
					<div>
						<button type="submit" id="" >提交</button>
					</div>
					<div class="input_wrap link clearfix">
						<label>
							<a class="u-protocol" href="${static_ftiao_cn}/service_agreement.pdf" target="_blank">《平台服务条款》</a>
							<a class="u-protocol" href="${static_ftiao_cn}/service_agreement.pdf" target="_blank">《会员管理协议》</a>
						</label>
						<a class="login_link" href="${ctx}/login.html" target="_blank">登录&gt;</a>
					</div>
				</div>
			</div>
			<div class="m_login_blac"></div>
		</div>
	</form:form>
	<div class="lg_footer2">
		<p>Copyright &copy; 2015-2016 9hjf.com 深圳前海九慧金服科技有限公司 粤ICP备15044065号
	</div>
</div>
</div>
