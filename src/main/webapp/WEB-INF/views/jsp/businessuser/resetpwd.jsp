<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link href="${static_ftiao_cn}/css/comm.css?v=1" rel="stylesheet" type="text/css">
<link href="${static_ftiao_cn}/css/login.css?v=1" rel="stylesheet" type="text/css">
<script src="${static_ftiao_cn}/js/common/jquery-1.11.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${ctx}/js/jquery.validate.js"></script>
<script src="${static_ftiao_cn}/js/businessuser/resetpwd.js?v=1"></script>
<script src="${static_ftiao_cn}/js/my_comm.js?v=1" charset="UTF-8"></script>
<style type="text/css">
.error_1 {
	color: #FF0000;
}
</style>
<script type="text/javascript">
	function changeCode() {
		$('#kaptchaImage').hide().attr('src', '${ctx}/captcha.html?' + Math.floor(Math.random() * 100)).fadeIn();
	}
	
	var wait = 30;
	function phoneCode(o) {
		var _phone = $("#_phone").val();
		var code_ = $("#code_").val();
		if (_phone == '') {
			$("#btn2").attr("disabled", "disabled");
			return false;
		}else {
			$("#btn2").attr("disabled", false);
		}
			if (code_  == '') {
			$("#btn2").attr("disabled", "disabled");
			$("#msgcode").text("图形验证码不能为空");
			return false;
		}
		else{
			$("#btn2").attr("disabled", false);
		}
			if (_phone != '') {
			$("#msgcode").text("");
		}
		var url = "${ctx}/businessuser/phonecode.do";
		$.post(url, {
			mobile : $('#_phone').val(),
			code : $("#code_").val(),
			type : 3
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
	/* function checkCode(){
		var url = "${ctx}/businessuser/checkcode.do";
		$.post(url,{
			code:$("#code_").val()
		},function(data){
			if(data.result=="N"){
				$("#btn2").attr("disabled", "disabled");
				$("#msgcode_").text("图形验证码不正确");
			}else{
				$("#msgcode_").text("");
				$("#btn2").attr("disabled", false);
			}
		},"json");
		
	} */
</script>
</head>
<body style="background: #ecf1f5">
	<!--顶部页头start-->
	<div class="lg_head2">
		<a href="${ctx}/login.html" class="logo"></a>
	</div>
	<!--顶部页头end-->
	<!--内容主体start-->
	<div class="lg_banner_wrap">
		<div class="lg_banner find_pass_banner">
			<!--找回密码start-->
			<div class="fine_login box_shadow" id="find_pass">
				<div class="header">
					<h2>找回密码</h2>
				</div>
				<form action="${ctx}/forgot_password.html" method="post" id="businessuser">
					<div class="main">
						<p class="clearfix">
							<input name="phone" placeholder="注册手机号码" type="text" data-old="" id="_phone">
						</p>
						<div style="color: #FF0000" id="msgcode">${pwdMsg}</div>
						<p class="ckcode clearfix">
							<input name="code" placeholder="图形验证码" type="text" id="code_" >
							<a>
								<img alt="" src="${ctx}/captcha.html" id="kaptchaImage" onclick="changeCode()">
							</a>
						</p>
						<div id="msgcode_" style="color: #FF0000">${codeMsg}</div>
						<p class="mscode2 clearfix">
							<span>
								<input name=" msgCode" placeholder="短信验证码" type="text" maxlength="6">
							</span>
							<input type="button" id="btn2" value="获取" class="btn_input"  onclick="phoneCode(this)">
						<div style="color: #FF0000"  id="msgCode">${msgCode}</div>
						<!--<input type="button"" id="" class="btn_input z-dis" value="已发送（60s）">-->
						</p>
						<div id="codeMsg_" style="color: #FF0000"></div>
						<p class="clearfix">
							<input name="acctPassword" placeholder="新密码" type="password" id="acctPassword_">
						</p>
						<p class="clearfix">
							<input name="confirmNewPassword" placeholder="确认新密码" type="password">
						</p>
						<p class="button_p clearfix">
							<button type="submit" id="btn_to_next">确认</button>
						</p>
					</div>
				</form>
			</div>
			
			
		</div>
	</div>
	<!--内容主体end-->
	<div class="lg_footer3">Copyright &copy; 2015-2016 9hjf.com 深圳前海九慧金服科技有限公司 粤ICP备15044065号</div>
</body>
