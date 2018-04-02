$(document).ready(function() {
	$("#changepassword").validate({
		errorClass : "error_1",
		rules : {
			acctPassword : {
				required : true,
				acctPassword: true
			},
			oldPassword : {
				required : true,

			},
			confirmNewPassword : {
				equalTo : "#newPwd"
			}

		},
		messages : {
			oldPassword : {
				required : "请输入当前登录密码"
			},
			acctPassword : {
				required : "请输入新密码",
				acctPassword : "请输入长度为6位，包含大小写字母和数字的密码"
			},
			confirmNewPassword : {
				equalTo : "两次密码输入不一致"
			}
		}
	});
	$.validator.addMethod("acctPassword", function(value, element) {
		var acctPassword=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;
		/*var newPassword=/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[a-zA-Z\d]{6}$/;*/
			return this.optional(element) || (acctPassword.test(value));
	});
});

