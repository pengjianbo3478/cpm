<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link href="${static_ftiao_cn}/css/comm.css?v=1" rel="stylesheet" type="text/css">
<link href="${static_ftiao_cn}/css/funds.css?v=1" rel="stylesheet" type="text/css">
<link href="${static_ftiao_cn}/css/assets.css?v=1" rel="stylesheet" type="text/css">
<script src="${static_ftiao_cn}/js/common/jquery-1.11.1.min.js" type="text/javascript"></script>
<script src="${static_ftiao_cn}/js/pop_up_w.js?v=1" charset="UTF-8"></script>
<script src="${static_ftiao_cn}/js/my_comm.js?v=1" charset="UTF-8"></script>
<script src="${static_ftiao_cn}/js/success_alter.js?v=1" charset="UTF-8"></script>
<script src="${static_ftiao_cn}/js/funds.js?v=1" charset="UTF-8"></script>
<script src="${static_ftiao_cn}/js/businessuser/merge.js?v=1"></script>
<script src="${static_ftiao_cn}/js/jquery.validate.js" type="text/javascript"></script>
<style type="text/css">
.error_1 {
	color: #FF0000;
}
</style>
<script type="text/javascript">
function checkCode() {
	var url = "${ctx}/businessuser/checkcode.do"
	$.post(url, {
		code : $("#code_").val()
	}, function(data) {
		if (data.result == "N") {
			$("#phoneCode").removeAttr("onclick");
			$("#save").removeAttr("onclick");
			$("#codeMsg_").text("图形验证码不正确");
		} else {
			$("#codeMsg_").text("");
			$("#phoneCode").attr("onclick","phoneCode(this)");
			$("#save").attr("onclick","click_val()");
		}
	}, "json")
}
function changeCode() {
	$('#kaptchaImage').hide().attr('src', '${ctx}/captcha.html?' + Math.floor(Math.random() * 100)).fadeIn();
}
	function click_val() {
		$('#form').submit();
	}
	var wait = 30;
	function phoneCode() {
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
			type : 2
		}, function(data) {
			if (data.result == "N") {
				$("#msgcode").text("发送短信验证码失败，请先确认图形验证码");
			}
			else{
				count();
			}
		}, "json");
		
	}
	function count(){
		$("#msgcode").text("");
		var o = document.getElementById("phoneCode"); 
		if (wait == 0) {
			$("#phoneCode").attr("onclick","phoneCode(this)");
			o.text = "重新获取";
			wait = 30;
		} else {
			$("#phoneCode").attr("onclick","");
			o.text = "已发送(" + wait + ")";
			wait--;
			setTimeout(function() {
				count(wait);
			}, 1000);
		}
	}
	//下面用于图片上传预览功能
	function setImagePreview(avalue) {
		var docObj = document.getElementById("doc");

		var imgObjPreview = document.getElementById("preview");
		if (docObj.files && docObj.files[0]) {
			//火狐下，直接设img属性
			imgObjPreview.style.display = 'block';
			//imgObjPreview.src = docObj.files[0].getAsDataURL();
			//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
			imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
			$("#save-btn").removeClass("disabled");
			$("#save-btn").attr("disabled", "false");
		} else {
			//IE下，使用滤镜
			docObj.select();
			var imgSrc = document.selection.createRange().text;
			var localImagId = document.getElementById("localImag");
			//必须设置初始大小 
			localImagId.style.height = "78px";
			//图片异常的捕捉，防止用户修改后缀来伪造图片
			try {
				localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
				localImagId.filters
						.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
			} catch (e) {
				alert("您上传的图片格式不正确，请重新选择!");
				return false;
			}
			imgObjPreview.style.display = 'none';
			document.selection.empty();
		}
		return true;
	}
</script>
<!--标题start-->
<div class="title_h1">
	<h1>个人信息</h1>
</div>
<!---个人信息---->
<div class="information information_edit">
	<form:form commandName="businessUser" id="form" modelAttribute="businessUser" action="${ctx}/businessuser/merge.do" enctype="multipart/form-data" method="POST">
		<div class="main">
			<dl class="dl1">
				<dt>姓名：</dt>
				<dd>
					<div class="file-box1">
						<form:input type="text" path="name" cssClass="txt1" />
					</div>
				</dd>
			</dl>
			<dl class="dl1">
				<dt>所属机构：</dt>
				<dd>
					<div class="file-box1">
						<form:input type="text" path="institutionName" cssClass="txt1" />
					</div>
				</dd>
				<div class="text01">修改机构名称需重新上传名片</div>
			</dl>
			<dl class="dl1">
				<dt>部门：</dt>
				<dd>
					<div class="file-box1">
						<form:input type="text" path="department" cssClass="txt1" />
					</div>
				</dd>
			</dl>
			<dl class="dl1">
				<dt>职位：</dt>
				<dd>
					<div class="file-box1">
						<form:input type="text" path="jobTitle" cssClass="txt1" />
					</div>
				</dd>
			</dl>
			<dl class="dl1">
				<dt>固话：</dt>
				<dd>
					<div class="file-box1">
						<form:input type="text" path="telNum" cssClass="txt1" />
					</div>
				</dd>
			</dl>
			<dl class="dl1">
				<dt>联系电话：</dt>
				<dd>
					<div class="file-box1">
						<form:input type="text" path="phone" cssClass="txt1" />
						<input type="hidden" id="_phone" value="${businessUser.phone }" />
					</div>
				</dd>
				<div class="text02"></div>
			</dl>
			<dl class="dl1 clearfix">
				<dt>邮箱：</dt>
				<dd>
					<div class="file-box1">
						<form:input type="text" path="email" cssClass="txt1" />
					</div>
				</dd>
			</dl>
			<dl class="dl1 clearfix">
				<dt>名片：</dt>
				<dd>
					<div class="file-box1">
						<div id="localImag" class="local_img">
							<img id="preview" src="../uploadfiles/Image.jsp?ref=/uploadfiles/userfiles/${businessUser.id}/${businessUser.id}.JPG&tag=JPG">
						</div>
						<input type="file" name="myfile" class="file1" id="doc" size="28" onchange="javascript:setImagePreview();">
						<input type="button" class="btn1" value="重新上传">
					</div>
				</dd>
			</dl>
			<dl class="dl1">
				<dt>图形验证码：</dt>
				<dd>
					<div class="file-box1">
						<input name="code" placeholder="图形验证码" type="text" id="code_" >
						<a>
							<img  alt="" src="${ctx}/captcha.html" id="kaptchaImage" onclick="changeCode()" style="display: inline;width: 80px;"
							>
						</a>
						
					</div>
				</dd>
				<div id="msg" id="codeMsg_"  class="text02">${codeMsg}</div>
			</dl>
			<dl class="dl1">
				<dt>短信验证码：</dt>
				<dd>
					<div class="file-box1">
						<input type="text" id="code_" name="textfield" id="textfield1" class="txt2" placeholder="">
						<a class="btn_button" id="phoneCode" onclick="phoneCode(this)" href="javascript:void(0);" >获取验证码</a>
					</div>
					<div id="msgcode">${msg1}</div>
				</dd>
				<div id="msg" class="text02"></div>
			</dl>
			<p style="padding: 40px 0 0 0;">
				<button type="button" id="save" onclick="click_val()" class="gray">保存修改</button>
			</p>
		</div>
	</form:form>
</div>
