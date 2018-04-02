$(function() {
	function m_black() {
		$('.m_login_blac').each(function() {
			$(this).css("height", $(this).prev().height());
		});
	}
	;
	m_black();
	$(".mobile").click(function() {
		$(".mscode2").show();
		m_black();
	});
	$("#businessuser").validate({
		errorClass : "error_1",
		rules : {
			institutionName : {
				required : true,
				maxlength : 40,
				minlength : 6
			},
			name : {
				required : true,
				maxlength : 5
			},
			email : {
				remote : {
					type : "POST",
					url : "checkemail.do",
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
					url : "checkphone.do",
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
				required : "请填写机构名称",
				maxlength : "最大长度为40位",
				minlength : "最小长度为6位"
			},
			name : {
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
})
