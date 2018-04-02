$(function() {
	$("#form").validate({
		errorClass : "error_1",
		rules : {
			name : {
				name1 : true,
				required : true,
				maxlength : 5
			},
			institutionName : {
				check1 : true,
				required : true,
				maxlength : 40,
				minlength : 6
			},
			department : {
				check1 : true,
				required : true,
				maxlength : 40
			},
			jobTitle : {
				check1 : true,
				required : true,
				maxlength : 10,
				minlength : 2
			},
			telNum : {
				number : true,
				required : true
			},
			phone : {
				maxlength : 11,
				minlength : 11,
				required : true,
				mobile : true
			},
			email : {
				required : true,
				email : true,
				maxlength : 30
			},
			myfile : {
				required : true
			},
			code : {
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
			department : {
				check1 : "部门不能包含特殊字符",
				required : "请填写部门",
				maxlength : "最大长度为40位"
			},
			jobTitle:{
				check1 : "机构名称不能包含特殊字符",
				required : "请填写职位",
				maxlength : "最大长度为10位",
				minlength : "最小长度为2位"
			},
			telNum : {
				number : "固话只能是数字",
				required : "请填写固话"
			},
			name : {
				name1 : "姓名只能是中文或字母",
				required : "请填写姓名",
				maxlength : "最大长度为5位"
			},
			email : {
				required : "请填写邮箱",
				email : "请填写一个合法的邮箱",
				maxlength : "邮箱最大长度为30位"
			},
			phone : {
				maxlength : "请填写一个正确的手机号码",
				minlength : "请填写一个正确的手机号码",
				mobile : "请填写一个合法的手机",
				required : "请填写联系电话"
			},
			myfile : {
				required : "请上传名片"
			},
			code : {
				required : "请填写验证码"
			}
		}
	});

	$.validator.addMethod("check1", function(value, element) {
		var check1 = /^([\u4E00-\u9FA5]|\w)*$/;
		return this.optional(element) || (check1.test(value));
	});
	$.validator.addMethod("name1", function(value, element) {
		var name1 =/^([\u4E00-\u9FA5]+|[a-zA-Z]+)$/;
		/*var name1 =/[u4e00-u9fa5A-Za-z]{2,5}$/;*/
		/*var name1 =/^[\u4e00-\u9fa5]{2,4}$|^[a-zA-Z]{1,10}$/gi;*/
		/*var name1 =/[u4e00-u9fa5A-Za-z]{2,5}/;*/
		return this.optional(element) || (name1.test(value));
	});
})
