$(document).ready(function() {
	$("#businessuser").validate({
		errorClass : "error_1",
		rules : {
			phone : {
				required : true,
				mobile : true
			},
			msgCode : {
				required : true
			},
			acctPassword : {
				required : true,
				maxlength:16,
				minlength:6,
				newPassword : true
			},
			confirmNewPassword : {
				equalTo : "#acctPassword_"
			}
		},
		messages : {
			phone : {
				required : "请输入手机号码",
				mobile : "手机号码不正确"
			},
			msgCode : {
				required : "请输入短信验证码"
			},
			acctPassword : {
				required : "请输入新密码",
				minlength:"新密码需6-16位字母与数字组合",
				maxlength:"新密码需6-16位字母与数字组合",
				newPassword : "新密码需6-16位字母与数字组合"
			},
			confirmNewPassword : {
				equalTo : "两次密码输入不一致"
			}
		}
	});
	  $.validator.addMethod("newPassword", function(value, element) { var
	  newPassword=/^([\d]+[a-zA-Z]+|[a-zA-Z]+[\d]+){1,}$/;
	  return this.optional(element) || (newPassword.test(value)); });
});
