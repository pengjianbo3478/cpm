$(function() {

	$(".mobile input").focus(function(){
		$(".mscode2").show();
	});
	$("#businessuser").validate({
		errorClass : "error_1",
		rules : {
			institutionName : {
				check1 : true,
				required : true,
				maxlength : 40,
				minlength : 6
			},
			name : {
				name1:true,
				required : true,
				maxlength : 10
			},
			email : {
				remote : {
					type : "POST",
					url : "checkemail.html",
					dataType : "json",
					data : {
						email : function() {
							return $("#_email").val();
						}
					},
				},
				required : true,
				email : true,
				maxlength : 30
			},
			phone : {
				remote : {
					type : "POST",
					url : "checkphone.html",
					dataType : "json",
					data : {
						phone : function() {
							return $("#_phone").val();
						}
					},
				},
				required : true,
				mobile : true
			},
			msgCode : {
				required : true
			}
		},
		messages : {
			institutionName : {
				check1 : "机构名称不能包含特殊字符",
				required : "请填写机构名称",
				maxlength : "最大长度为40位",
				minlength : "最小长度为6位"
			},
			name : {
				name1:"姓名只能是中文或字母",
				required : "请填写姓名",
				maxlength : "最大长度为5位"
			},
			email : {
				remote : "邮箱已经存在,请重新输入",
				required : "请填写邮箱",
				email : "请填写一个合法的邮箱",
				maxlength : "邮箱最大长度为30位"
			},
			phone : {
				remote : "手机号码已经存在,请重新输入",
				required : "请填写手机号码",
				mobile : "请填写一个合法的手机"
			},
			msgCode : {
				required : "请填写短信验证码"
			}
		}
	});

	$.validator.addMethod("check1", function(value, element) {
		var check1 = /^[a-zA-Z0-9\u4e00-\u9fa5]+$/;
		return this.optional(element) || (check1.test(value));
	});
	$.validator.addMethod("name1", function(value, element) {
		var name1 = /^[\u4e00-\u9fa5a-zA-Z]{1,10}$/;
		return this.optional(element) || (name1.test(value));
	});
})
