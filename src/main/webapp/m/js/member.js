
function filterChar(str){
	var checkFlag = '#,~,$,@,!,*,^,<,>,",%,&';
	var checks = checkFlag.split(",");
	var flag = false;
	for(var i = 0; i < checks.length; i++){
		if(str.indexOf(checks[i]) != -1){
			alert("不允许输入特殊字符 : " + checks[i]);
			flag = true;
			break;
		}
	}
	return flag;
}


////近期投资近期借款
function rlist() {
	$("#reone").attr('class','normal current-no');
	$("#retwo").attr('class','normal');
	$("#rlist").css({ display: "block"});
	$("#llist").css({ display: "none"});
	
}
function llist() {
	$("#reone").attr('class','normal');
	$("#retwo").attr('class','normal current-no');
	$("#rlist").css({ display: "none"});
	$("#llist").css({ display: "block"});
}

//验证昵称唯一
function testPetnm(PetNM) {
	var span2 = $("#span2");
	span2.text("");
	$.ajax({
		type : "post",
		dataType : "json",
		url : path +"/personal/memberCenter/seltestPetnm.do",
		data:{ 'PetNM': PetNM},
		success : function(msg) {
			if (msg.count > 0){
				span2.text("昵称已经存在了，请重新填写昵称");
			}else {
				modifyPerInfo();
			}
		}
	});
}

// 修改个人资料
function modifyPerInfo() {
	var perTyp = $("#perTyp").val();
	var CiRelNm = $("#CiRelNm").val();// 真实姓名
	var sex =$("#sex:checked").val();// 性别
	var PetNM = $("#PetNM").val();// 昵称
	var Birthday= $("#Birthday").val();
	var email = $("#email").val();// 邮箱地址
	var EduFlg = $("#EduFlg").val();// 教育程度
	var occ=$("#occ").val();//从事职业
	var addr = $("#addr").val();// 详细地址
	var isOk = true;
	var span1 = $("#span1");
	var span2 = $("#span2");
	var span3 = $("#span3");
	var span4 = $("#span4");
	var span5 = $("#span5");
	var span6 = $("#span6");
	span1.text("");
	span2.text("");
	span3.text("");
	span4.text("");
	span5.text("");
	span6.text("");
	if(addr!=null && addr!="" && addr==document.getElementById('addr').defaultValue){
		$("#Addr").val("");
	}
	/*真实姓名*/
	if ($.trim($("#CiRelNm").val()).length <= 0 || $("#CiRelNm").val() == '') {
		$('#span1').show().text("请输入真实名称");
		isOk = false;
	}else{
		/*$('#span1').hide();*/
		if($("#CiRelNm").val().length<2){
	 		$("#span1").show().text("真实名称最少两位长度！");
	 		isOk = false;
	 	}else{
	 		if(!res.test( $("#CiRelNm").val())){
	 			$("#span1").show().text("真实名称不能含数字及非法字符！");
	 			isOk = false;
		 	}else{
			 	$("#span1").hide();
		 	}
	 	}
	}
	
	/*性别*/
	if(perTyp == 1){
		if ($("#sex").checked == false) {
			$('#span3').show().text('请选择性别');
			isOk = false;
		}else{
			$('#span3').hide();
		}
	}
	/*出生日期*/
	if(perTyp == 1){
		if ($.trim($("#Birthday").val()).length <= 0) {
			$('#span4').show().text('请输入出生日期');
			isOk = false;
		}else{
			$('#span4').hide();
		}
	}
	/*邮箱*/
	var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((.[a-zA-Z0-9_-]{2,3}){1,2})$/; // 验证邮箱地址
	if ($.trim($("#email").val()).length <= 0) {
		$('#span5').show().text('请输入邮箱地址');
		isOk = false;
	}else{
		if (reg.test(email) == false) {
			$('#span5').show().text('输入的邮箱格式错误!');
			isOk = false;
		}else{
			$('#span5').hide();
		}
	}
	
	
	/*return;*/
	if (isOk == true) {
		$.ajax({
					type : "post",
					dataType : "json",
					url : path +"/personal/memberCenter/updPersonal.do",
					data:{ 'PetNM':PetNM,'sex':sex,'Birthday':Birthday,'email':email,'EduFlg':EduFlg,'occ':occ,'PrvCd':PrvCd,'CtyCd':CtyCd,'addr':addr},
					success : function(msg) {
						if (msg==true) {
							location.href=path +"/personal/memberCenter/selpersonal.do";
						}else{
							span6.attr('class','check-tips');
							$('#span6').show().text("个人资料修改失败，请确认您的信息！");
						}
					},
					error:function(msg){
						layer.alert('个人资料修改失败，请确认您的信息！');
					}
				});
	}
}

// 身份认证
function authentication() {
	var IDType = $("#IDType").val();// 证件类型
	var CiRelNm = $("#CiRelNm").val();// 真实姓名
	var IDNo = $("#IDNo").val();// 证件号码
	/*var PrvCd=$("#PrvCd").val();//省份
	var CtyCd=$("#CtyCd").val();//市
	var ZoneCd=$("#ZoneCd").val();//区
	var Addr=$("#Addr").val();//详细地址
*/	$("#span1").text("");
	$("#span2").text("");

	var reg=/^[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*$/;
	if(CiRelNm==document.getElementById('CiRelNm').defaultValue){
		$("#CiRelNm").val("");
	}
	if(IDNo==document.getElementById('IDNo').defaultValue){
		$("#IDNo").val("");
	}
	/*if(Addr==document.getElementById('Addr').defaultValue){
		$("#Addr").val("");
	}*/

	var isOk=true;
	/*真实姓名*/
	if($("#CiRelNm").val()==''){
		isOk = false;
		$("#span1").show().text('请输入您的真实姓名');
	}else{
		if(!reg.test(CiRelNm)){
			isOk = false;
			$("#span1").show().text('请输入合法的真实姓名');
		}else{
			$("#span1").hide();
		}
	}
	/*身份证号码*/
	var res = /^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/;
	if($('#IDNo').val()==''){
		isOk = false;
		$("#span2").show().text('请输入身份证号码');
	}else{
		if(!res.test(IDNo)|| !IdCardValidate(IDNo)){
			isOk = false;
			$("#span2").show().text('请输入真实有效的身份证号码');
		}else{
			$("#span2").hide();
		}
	}
//	var var_data = "CiRelNm=" + CiRelNm + "&IDType=" + IDType + "&IDNo=" + IDNo;
	$("#errorId").text("");
	if(isOk==true){
		$.ajax({
			type : "post",
			dataType : "json",
			url :"/personal/memberCenter/updauthen.do",
			data:{ 'CiRelNm': CiRelNm,'IDType': IDType,'IDNo': IDNo,'PrvCd': '','CtyCd': '','ZoneCd': '','addrs': ''},
			success : function(msg) {
				if (msg.isOk==true) {
					location.href=path +"/autherized/memberCenter/selReferSuccess.do?strType=1";
				}else{
					if(msg.ms=="对不起此身份证已经被使用"){
						$('#span2').show().text(msg.ms);
					}else{
						$('#span2').show().text(msg.ms);
					}			
				}
			}
		});
	}else{
		return;
	}
	
}

// 公司认证
function certification() {
	var CiTruNm = $("#CiTruNm").val()==""?$("#CiTruNm").text():$("#CiTruNm").val();
	var EdBusNo = $("#EdBusNo").val()==""?$("#EdBusNo").text():$("#EdBusNo").val();
	var EdOrgCd = $("#EdOrgCd").val()==""?$("#EdOrgCd").text():$("#EdOrgCd").val();
	var EdLegNm = $("#EdLegNm").val()==""?$("#EdLegNm").text():$("#EdLegNm").val();
//	var reg_edorgcd=/^\d{9}$/;
//	var reg_edbusno=/^\d{15}$/;
	var PrvCd= $('#Pro').attr('date-info');//省份
	var CtyCd= $('#Shi').attr('date-info');//市
	var ZoneCd=$('#Xian').attr('date-info');//区
	if(PrvCd==undefined){
		PrvCd = "";
	}
	if(CtyCd==undefined){
		CtyCd = "";
	}
	if(ZoneCd==undefined){
		ZoneCd = "";
	}
	var Addr = $("#Addr").val();
	var EdOprNm=$("#EdOprNm").val();
	var IdNo=$("#IdNo").val();
	$("#span1").text("");
	$("#span2").text("");
	$("#span3").text("");
	$("#span4").text("");
	var isOk=true;

	/*公司全称*/
	var re =/^([A-Za-z]|[\u4E00-\u9FA5]|[（）]|[0-9]){6,40}$/;
	if(CiTruNm == ''){
		isOk = false;
		$("#span1").show().text("请输入正确的公司名称");
	}else{
		if(!re.test(CiTruNm)){
			isOk = false;
			$("#span1").show().text("请检查公司全称格式");
		}else{
			$("#span1").hide();
		}
	}
	
	/*营业执照注册号*/
	if(EdBusNo == ''){
		isOk = false;
		$("#span2").show().text("请输入营业执照注册号!");
	}else{
		if(!isValidBusCode(EdBusNo)){
			isOk = false;
			$("#span2").show().text("请检查您的营业执照注册号!");		
		}	
		else{
			$("#span2").hide();
		}
	}
	
	/*组织机构代码*/
	if(EdOrgCd == ''){
		isOk = false;
		$("#span3").show().text("请输入组织机构代码");
	}else{
		if(!IdOrgValidate(EdOrgCd)){
			isOk = false;
			$("#span3").show().text("请检查您的组织机构代码!");
		}else{
			$("#span3").hide();
		}
	}
	/*法人姓名*/
	var regs =/^[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*$/;
	if(EdLegNm == ''){
		isOk = false;
		$("#span4").show().text("请输入法人姓名！");
	}else{
		if(!reg.test(EdLegNm)){
			isOk = false;
			$("#span4").show().text("请检查法人姓名！");
		}else{
			$("#span4").hide();
		}
	}
	/*经营场所*/
	if(PrvCd =='' || CtyCd =='' ){
		isOk = false;
		$("#span5").show().text("请选择办公地址！");
	}else{
		$("#span5").hide();
	}
	
	/*详细地址*/
	if($("#Addr").val() == ''){
		isOk = false;
		$("#span6").show().text("请输入详细地址！");
	}
	
	
	
	/*经办人*/
	var res =/^[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*$/;
	if($("#EdOprNm").val() == ''){
		isOk = false;
		$("#span7").show().text("请输入经办人姓名！");
	}else{
		if(!res.test($("#EdOprNm").val())){
			isOk = false;
			$("#span7").show().text("请检查经办人姓名！");
		}else{
			$("#span7").hide();
		}
	}	

	/*身份证号码*/
	if($("#IdNo").val() == ''){
		isOk = false;
		$("#span8").show().text("请输入经办人身份证号码！");
	}else{
		if(IdCardValidate($("#IdNo").val())==false){
			isOk = false;
			$("#span8").show().text("请输入经办人真实有效的身份证号码");
		}else{
			$("#span8").hide();
		}
	}
	
	//邮箱地址不能为空
	if($("#email").val()==''){
		 $("#span9").show().text("请输入邮箱地址！");
		 return;
	}else{
		 var regs = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		 if(!regs.test($("#email").val())){
			 $("#span9").show().text("输入的邮箱格式错误！");
			 return;
		 }else{
			 $("#span9").hide();
		 }
	} 
	
	$("#errorId").text("");
	var var_data = "CiTruNm=" + CiTruNm + "&EdBusNo=" + EdBusNo + "&EdOrgCd="
			+ EdOrgCd + "&EdLegNm=" + EdLegNm + "&PrvCd=" + PrvCd + "&CtyCd="
			+ CtyCd +"&ZoneCd="+ZoneCd+ "&Addr=" + Addr+"&EdOprNm="+EdOprNm+"&IdNo="+IdNo+"&email="+$("#email").val();
	if(isOk==true){
		//layer.load('正在认证...', 1);
		layer.load(1, 2, true);
		$.ajax({
			type : "post",
			dataType : "json",
			url : path +"/selAccount/identiifyCom.do",
			data: var_data,
			success : function(data) {
				if (data==null) {
					layer.alert("连接后台错误！请联系客户人员");
				}else{
					if(data.errorCode==null){
						location.href=path +"/selAccount/homePage/selAccount.do";
					}else{
						$("#span3").show().text(data.replyText);
						//layer.alert(data.replyText);
					}
				}
			}
		});
	}else{
		return;
	}
}

//公司认证修改
function save() {
	var CiTruNm = $("#CiTruNm").val()==""?$("#CiTruNm").text():$("#CiTruNm").val();
	var EdBusNo = $("#EdBusNo").val()==""?$("#EdBusNo").text():$("#EdBusNo").val();
	var EdOrgCd = $("#EdOrgCd").val()==""?$("#EdOrgCd").text():$("#EdOrgCd").val();
	var EdLegNm = $("#EdLegNm").val()==""?$("#EdLegNm").text():$("#EdLegNm").val();
//	var reg_edorgcd=/^\d{9}$/;
//	var reg_edbusno=/^\d{15}$/;
	var PrvCd= $('#Pro').attr('date-info');//省份
	var CtyCd= $('#Shi').attr('date-info');//市
	var ZoneCd=$('#Xian').attr('date-info');//区
	if(PrvCd==undefined){
		PrvCd = "";
	}
	if(CtyCd==undefined){
		CtyCd = "";
	}
	if(ZoneCd==undefined){
		ZoneCd = "";
	}
	var Addr = $("#Addr").val();
	var EdOprNm=$("#EdOprNm").val();
	var IdNo=$("#IdNo").val();
	$("#span1").text("");
	$("#span2").text("");
	$("#span3").text("");
	$("#span4").text("");
	var isOk=true;

	/*公司全称*/
	var re =/^([A-Za-z]|[\u4E00-\u9FA5]|[（）]|[0-9]){6,40}$/;
	if(CiTruNm == ''){
		isOk = false;
		$("#span1").show().text("请输入正确的公司名称");
	}else{
		if(!re.test(CiTruNm)){
			isOk = false;
			$("#span1").show().text("请检查公司全称格式");
		}else{
			$("#span1").hide();
		}
	}
	
	/*营业执照注册号*/
	if(EdBusNo == ''){
		isOk = false;
		$("#span2").show().text("请输入营业执照注册号!");
	}else{
		if(!isValidBusCode(EdBusNo)){
			isOk = false;
			$("#span2").show().text("请检查您的营业执照注册号!");		
		}	
		else{
			$("#span2").hide();
		}
	}
	
	/*组织机构代码*/
	if(EdOrgCd == ''){
		isOk = false;
		$("#span3").show().text("请输入组织机构代码");
	}else{
		if(!IdOrgValidate(EdOrgCd)){
			isOk = false;
			$("#span3").show().text("请检查您的组织机构代码!");
		}else{
			$("#span3").hide();
		}
	}
	/*法人姓名*/
	var reg =/^[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*$/;
	if(EdLegNm == ''){
		isOk = false;
		$("#span4").show().text("请输入法人姓名！");
	}else{
		if(!reg.test(EdLegNm)){
			isOk = false;
			$("#span4").show().text("请检查法人姓名！");
		}else{
			$("#span4").hide();
		}
	}
	
	
	/*经营场所*/
	if(PrvCd =='' || CtyCd ==''){
		isOk = false;
		$("#span5").show().text("请选择办公地址！");
	}else{
		$("#span5").hide();
	}
	
	/*详细地址*/
	if($("#Addr").val() == ''){
		isOk = false;
		$("#span6").show().text("请输入详细地址！");
	}
	
	/*经办人*/
	var res =/^[\u4E00-\u9FA5]{2,5}(?:·[\u4E00-\u9FA5]{2,5})*$/;
	if($("#EdOprNm").val() == ''){
		isOk = false;
		$("#span7").show().text("请输入经办人姓名！");
	}else{
		if(!res.test($("#EdOprNm").val())){
			isOk = false;
			$("#span7").show().text("请检查经办人姓名！");
		}else{
			$("#span7").hide();
		}
	}	

	/*身份证号码*/
	if($("#IdNo").val() == ''){
		isOk = false;
		$("#span8").show().text("请输入经办人身份证号码！");
	}else{
		if(IdCardValidate($("#IdNo").val())==false){
			isOk = false;
			$("#span8").show().text("请输入经办人真实有效的身份证号码");
		}else{
			$("#span8").hide();
		}
	}
	
	//邮箱地址不能为空
	if($("#email").val()==''){
		 $("#span9").show().text("请输入邮箱地址！");
		 return;
	}else{
		 var regs = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		 if(!regs.test($("#email").val())){
			 $("#span9").show().text("输入的邮箱格式错误！");
			 return;
		 }else{
			 $("#span9").hide();
		 }
	} 
	
	
	$("#errorId").text("");
	var var_data = "EdLegNm=" + EdLegNm + "&PrvCd=" + PrvCd + "&CtyCd="
			+ CtyCd +"&ZoneCd="+ZoneCd+ "&Addr=" + Addr+"&EdOprNm="+EdOprNm+"&IdNo="+IdNo+"&email="+$("#email").val();
	if(isOk==true){
		$.ajax({
			type : "post",
			dataType : "json",
			url : path +"/selAccount/updateCom.do",
			data: var_data,
			success : function(data) {
				if (data==null) {
					layer.alert("连接后台错误！请联系客户人员");
				}else{
					if(data.errorCode==null){
						location.href=path +"/selAccount/homePage/selAccount.do";
					}else{
						layer.alert(data.replyText);
					}
				}
			}
		});
	}else{
		return;
	}
}


//查询银行卡
function selectBank(VerSts,AcNo){
	var var_data="VerSts="+VerSts+"&AcNo="+AcNo;
	var AcNm=$("#AcNm").val();
	var vhtml="<ul><li class=\"font_shui size_14 weight_100 \">";
	vhtml+="<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">";
	vhtml+="<tr height=\"40\" valign=\"middle\">";
	$.ajax({
		type : "post",
		dataType : "json",
		url : path +"/bank/memberCenter/selectBank.do",
		data:{ 'VerSts': VerSts,'AcNo': AcNo},
		success : function(msg) {
			vhtml+="<ul><li>选择银行：<img src='"+msg.imgServerUrl+msg.bCH_IMG+"' " +
					"width=\"118\" height=\"36\" border=\"0\" class=\"img_border\" />"+AcNo+"</li>";
			vhtml+="<li>开户姓名："+AcNm+"</li>";
			vhtml+="<li>汇入金额：<input id=\"RmAmt\" class=\"input font_qhui size_14 text_left5\"  value=\"\" ><span class=\"zq1\" style=\"padding: 8px;\">元<br></span></li>";
			vhtml+="<li><input type=\"hidden\" id=\"AcNo\" value=\""+AcNo+"\"></li>";
			vhtml+="<li></li></ul>";
			
//			vhtml+="<td width=\"85\" align=\"right\">选择银行：</td>";
//			vhtml="<td width=\"125\"  align=\"left\"><img src='"+msg.imgServerUrl+msg.bCH_IMG+"' " +
//					"width=\"118\" height=\"36\" border=\"0\" class=\"img_border\" /></td>";
//			vhtml+="<td width=\"420\"  align=\"left\" valign=\"bottom\">"+msg.acNo+"</td></tr>";
//			vhtml="<tr height=\"40\" valign=\"middle\"><td  align=\"right\">开户姓名：</td>";
//			vhtml+="<td colspan=\"2\"  align=\"left\" class=\"font_red\">"+AcNm+"</td></tr>";
//			vhtml+="<tr height=\"40\" valign=\"middle\"><td  align=\"right\">汇入金额：</td>";
//			vhtml+="<td colspan=\"2\"  align=\"left\"><div class=\"tbthcont\">";
//			vhtml+="<input id=\"RmAmt\" class=\"input font_qhui size_14 text_left5\"  value=\"请输入您收到的验证金额\" ><span class=\"zq1\" style=\"padding: 8px;\">元<br></span></div>";
//			vhtml+="<input type=\"hidden\" id=\"AcNo\" value=\""+msg.acNo+"\"></td>";
//			vhtml+="</tr><tr height=\"15\" ><td colspan=\"3\">&nbsp;</td></tr></table></li></ul>";
			vhtml+="<b><span class=\"botton31 font_writer size_16 weight_bold\"><a  href=\"javascript:void(0)\" onclick=\"testBank()\">提交</a></span></b>";
			$("#bankTest").html(vhtml);
//			$("#imgId").hmtl("<img src=\"images/member/sj_pic8.jpg\" border=\"0\" />");
		}
	});	
}
//输入金额验证银行卡
function testBank(){
	var RMAMT=$('#RmAmt').val();
	var AcNo=$('#AcNo').val();
	var reg=/^(-)?(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$/;
	var var_data="AcNo="+AcNo+"&RMAMT="+RMAMT;
	if(reg.test(RMAMT)==true){
	$.ajax({
		type : "post",
		dataType : "json",
		url : path +"/bank/memberCenter/insverifybank.do",
		data:{ 'AcNo': AcNo,'RMAMT': RMAMT},
		success : function(msg) {
			if(msg.isOk==true){
				location.href=path +"/autherized/memberCenter/selReferSuccess.do?strType=3";
			}else{
				$("#span1").text(msg.msg);
			}
		}
	});	
	}else{
		$("#span1").text("请输入正确的金额");
	}
}

// 删除银行卡
function deleteBank(AcNo) {
	var deleAcNo ="";

	deleAcNo ="*******"+AcNo.substring(12,16);
	$.layer({
	    shade: [0],
	    area: ['auto','auto'],
	    dialog: {
	        msg: "确定删除卡号为" + deleAcNo + "的银行卡",
	        btns: 2,                    
	        type: 4,
	        btn: ['确定','取消'],
	        no:function(){
	        	parent.layer.closeAll();
	        },
	        yes: function(){
	        	var variihtml = "";
	    		$.ajax({
	    					type : "post",
	    					dataType : "json",
	    					url : path +"/bank/memberCenter/deletebank.do?AcNo="
	    							+ AcNo,
	    					success : function(msg) {
	    						if (msg.isOk) {
	    							if(msg.list==null){
	    								location.href=path +"/personal/memberCenter/selpersonal.do";
	    							}else{
	    								$.each(msg.list,function(i, n) {
	    									variihtml += "<div class=\"Bankcard\"><ul>\<li><b>"+ n.bcnNm +"</b>";
	    									if (n.verSts == '0') {
	    										variihtml += "";
	    									} else if (n.verSts == '1') {
	    										variihtml += "";
//	    										variihtml += "<a href=\"javascript:void(0)\" onclick=\"selectBank("+n.verSts+","+n.acNo+")\"><a>";
	    									} else if (n.verSts == '2') {
	    										variihtml += "<a href="+path +"\"bank/memberCenter/deleteAndInsBank.do?VerSts="+n.verSts+"&AcNo="+n.acNo+"\">删除</a>";
	    									} else if (n.verSts == '3') {
	    										variihtml += "<a href=\"javascript:void(0)\" onclick=\"deleteBank('"
	    												+ n.acNo
	    												+ "')\">删除</a>";
	    									} else if (n.verSts == '4') {
	    										variihtml += "<a href=\"javascript:void(0)\" onclick=\"deleteBank('"+ n.acNo+ "')\">删除</a>";
	    									}
	    									
	    									var leng=(n.acNo).length;
	    									var vb=n.acNo.substring(leng-4);
	    									variihtml+="<li>**** **** "+vb+"<br/>"+ n.acNm+"</li></ul></div>";
	    									//variihtml+="<li class=\"cot\">客服电话：4008888888</li></ul></div>";
	    									
	    								});
	    									$("#deletebank").html(variihtml);
	    							}
	    							
	    						}
	    					}
	    				});
	    		parent.layer.closeAll();
	        }
	    }
	});
}
//新密码鼠标移动
function blurNewPwd(){
	var rgpwd = $("#rgpwd").val();
	var newPwd = $("#newPwd").val();
	var span2 = $("#span2");
	span2.attr('class','check-tips error_tip');
	span2.text("");
	var reg = /^([a-zA-Z0-9]*((\d+[a-zA-Z]+)|([a-zA-Z]+\d+))[a-zA-Z0-9]*)$/;
	if ($.trim($("#newPwd").val()).length <= 0) {
		span2.attr('class','check-tips');
		span2.text("请输入您的新密码");
		return;
	}else{
		if(rgpwd==newPwd){
			span2.attr('class','check-tips');
			span2.text("新密码不能和旧密码一样");
			return;
		}
	}
	if (reg.test(newPwd) == false) {
		span2.attr('class','check-tips');
		span2.text("密码为6-16位字母加数字");
		return;
	}else{
		if(newPwd>16){
			span2.attr('class','check-tips');
			span2.text("密码为6-16位字母加数字");
			return;
		}
	}
}
//新密码鼠标移动
function blurNewPwdI(){
	var newPwd = $("#newPwd").val();
	var newPwdI = $("#newPwdI").val();
	var span3 = $("#span3");
	span3.attr('class','check-tips  error_tip');
	span3.text("");
	if (newPwd != newPwdI) {
		span3.attr('class','check-tips');
		span3.text("确认密码与新密码要一致");
		return;
	}
}

// 修改登录密码
function modifyPwd() {
	var rgpwd = $("#rgpwd").val();
	var newPwd = $("#newPwd").val();
	var newPwdI = $("#newPwdI").val();
	var span1 = $("#span1");
	var span2 = $("#upwdErr");
	var span3 = $("#upwdDErr");
	span1.text("");
	span2.text("");
	span3.text("");
	//var reg = /^([a-zA-Z0-9]*((\d+[a-zA-Z]+)|([a-zA-Z]+\d+))[a-zA-Z0-9]*)$/;
	// var reg=/^([0-9a-zA-z](([0-9][a-zA-Z])|[a-zA-Z][0-9])){6,}$/;
	if(rgpwd==document.getElementById("rgpwd").defaultValue){
		$("#rgpwd").val("");
	}
	if(newPwd==document.getElementById("newPwd").defaultValue){
		$("#rgpwd").val("");
	}
	if(newPwdI==document.getElementById("newPwdI").defaultValue){
		$("#rgpwd").val("");
	}
	var isOk = true;
	
	if($("#rgpwd").val() ==''){
		$('#span1').show().text("请输入您的原密码");
	}else{
		$('#span1').hide();
	}
	
	if($("#newPwd").val() ==''){
		isOk = false;
		$('#upwdErr').show().text("请输入您的新密码");
	}else{
		if(rgpwd==newPwd){
			isOk = false;
			$('#upwdErr').show().text("新密码不能和旧密码一样");
		}else{
			var pwd = $('#newPwd').val();
			if(!checkLog.ckPwd2(pwd)){
				isOk = false;
			}
		}
	}
	
	if($("#newPwdI").val() ==''){
		isOk = false;
		$('#upwdDErr').show().text("请输入您的确认密码");
	}else{
		var pwd = $('#newPwd').val();
		var pwd_d = $('#newPwdI').val();
		if(!checkLog.ckPwdD2(pwd_d,pwd)){
			isOk = false;
		}
	}
	
	var var_data = "rgpwd=" + rgpwd + "&newPwd=" + newPwd;
	if (isOk == true) {
		if( /^(\d{6,}|[A-Z]{6,}|[a-z]{6,})$/.test(pwd) || /^([A-Z]+\d+|\d+[A-Z]+)*$/.test(pwd) || /^([a-z]+\d+|\d+[a-z]+)*$/.test(pwd) )
        {
               $.layer({
                  shade: [0],
                  area: ['auto','auto'],
                  dialog: {
                  msg: '您设置的密码强度较低,是否继续？',
                  btns: 2,                    
                  type: 4,
                  btn: ['确定','取消'],
                  yes: function(){
                	  $.ajax({
          				type : "post",
          				dataType : "json",
          				url : path +"/member/memberCenter/updPwd.do?" + var_data,
          				success : function(msg) {
          					if (msg) {
          					location.href=path +"/autherized/memberCenter/pwdSelReferSuccess.do";
//          						location.href=path +"/login/login/login.do";
          				}else{
          						$("#span1").text("您的原密码输入有误！");
          						$("#span1").show();
          						layer.closeAll();
          					}
          				}
                	  });
                  }, no: function(){
                     layer.closeAll();
                     $('#newPwd').focus();
                  }
                 }
                });	            	            
        }else{
		$.ajax({
				type : "post",
				dataType : "json",
				url : path+"/member/memberCenter/updPwd.do?" + var_data,
				success : function(msg) {
					if (msg) {
					location.href=path +"/autherized/memberCenter/pwdSelReferSuccess.do";
//						location.href=path +"/login/login/login.do";
				}else{
						$("#span1").text("您的原密码输入有误！");
						$("#span1").show();
						layer.closeAll();
					}
				}
		});
        }
	}
}


//修改转出密码
function modifyTXPwd(){
	var rgpwd = $("#rgpwd").val();
	var newPwd = $("#newPwd").val();
	var newPwdI = $("#newPwdI").val();
	var span1 = $("#span1");
	var span2 = $("#upwdErr");
	var span3 = $("#upwdDErr");
	span1.text("");
	span2.text("");
	span3.text("");
	//var reg = /^([a-zA-Z0-9]*((\d+[a-zA-Z]+)|([a-zA-Z]+\d+))[a-zA-Z0-9]*)$/;
	// var reg=/^([0-9a-zA-z](([0-9][a-zA-Z])|[a-zA-Z][0-9])){6,}$/;
	if(rgpwd==document.getElementById("rgpwd").defaultValue){
		$("#rgpwd").val("");
	}
	if(newPwd==document.getElementById("newPwd").defaultValue){
		$("#rgpwd").val("");
	}
	if(newPwdI==document.getElementById("newPwdI").defaultValue){
		$("#rgpwd").val("");
	}
	var isOk = true;
	if($("#rgpwd").val() ==''){
		$('#span1').show().text("请输入您的原密码");
	}else{
		$('#span1').hide();
	}
	
	//var reg=/^([a-zA-Z0-9]*((\d+[a-zA-Z]+)|([a-zA-Z]+\d+))[a-zA-Z0-9]*)$/;
	if($("#newPwd").val() ==''){
		isOk = false;
		$('#upwdErr').show().text("请输入您的新密码");
	}else{
		if(rgpwd==newPwd){
			isOk = false;
			$('#upwdErr').show().text("新密码不能和旧密码一样");
		}else{
			var pwd = $('#newPwd').val();
			if(!checkLog.ckPwd2(pwd)){
				isOk = false;
			}
		}
	}
	
	if($("#newPwdI").val() ==''){
		isOk = false;
		$('#upwdDErr').show().text("请输入您的确认密码");
	}else{
		var pwd = $('#newPwd').val();
		var pwd_d = $('#newPwdI').val();
		if(!checkLog.ckPwdD2(pwd_d,pwd)){
			isOk = false;
		}
	}
	var var_data = "rgpwd=" + rgpwd + "&newPwd=" + newPwd;
	if (isOk == true) {
		if( /^(\d{6,}|[A-Z]{6,}|[a-z]{6,})$/.test(pwd) || /^([A-Z]+\d+|\d+[A-Z]+)*$/.test(pwd) || /^([a-z]+\d+|\d+[a-z]+)*$/.test(pwd) )
        {
               $.layer({
                  shade: [0],
                  area: ['auto','auto'],
                  dialog: {
                  msg: '您设置的密码强度较低,是否继续？',
                  btns: 2,                    
                  type: 4,
                  btn: ['确定','取消'],
                  yes: function(){
              		$.ajax({
    					type : "post",
    					dataType : "json",
    					url : path+"/member/memberCenter/updTXPwd.do?" + var_data,
    					success : function(msg) {
    						if (msg.isOk) {
    							location.href=path +"/autherized/memberCenter/TXpwdSelReferSuccess.do";
    						  }
    						else{
    							$("#span1").text(msg.ms);
    							$("#span1").show();
    							layer.closeAll();
    						}	
    					}
    				});
                  }, no: function(){
                     layer.closeAll();
                     $('#newPwd').focus();
                  }
                 }
                });	            	            
        }else{
		$.ajax({
					type : "post",
					dataType : "json",
					url : path+"/member/memberCenter/updTXPwd.do?" + var_data,
					success : function(msg) {
						if (msg.isOk) {
							location.href=path +"/autherized/memberCenter/TXpwdSelReferSuccess.do";
						  }
						else{
							$("#span1").text(msg.ms);
							$("#span1").show();
							layer.closeAll();
						}
					}
				});
        }
	}
}

// 终止借款项目
function updTerminationBorrow(){
	var TERMINATIONREASON=$("#TERMINATIONREASON").val();
	var LnNo=$("#codLoanID").val();
/*	alert("LnNo="+LnNo);*/
/*	var LnSts=$("#LnSts").val();*/
	$("#errorId").text("");
//	var var_data = "terReason=" + TERMINATIONREASON + "&codLoanID=" + LnNo+"&LnSts="+LnSts;
	var var_data = "terReason=" + TERMINATIONREASON + "&codLoanID=" + LnNo;
	/*alert(var_data);*/
	var QUANTUM = $("#QUANTUM").val();
	$.layer({
	    shade: [0],
	    area: ['auto','auto'],
	    dialog: {
	        msg: '是否终止借款项目？若是，则需支付提前终止借款费用为 '+formatMoney(QUANTUM,1)+'元',
	        btns: 2,                    
            type: 4,
	        btn: ['取消','确定'],
	        no: function(){
	        	$.ajax({
	        		type : "post",
	        		dataType : "json",
	        		//url : "/borrow/memberCenter/updTerminationBorrow.do?" + var_data,
	        		url : path + "/borrow/selTerminationBorrow.do?" + var_data,
	        		success : function(msg) {
	        			console.info(msg);
	        			if(msg.ERROR_CODE==null){
	        				location.href = path+"/myApplication/borrowing/selLoandPage.do";		
	        			}else{
	        				layer.alert(msg.ERROR_MSG,8);
	        			}
	        		}
	        	});
			}, yes: function(){
				parent.layer.closeAll();
	        }
	    }
	});
	
	
	
	
}

// 确认借款项目
function confirmBorrow(LnNo){
	$.ajax({
		type : "post",
		dataType : "json",
		url : path+"/borrow/memberCenter/updconfirmBorrow.do?LnNo=" + LnNo,
		success : function(msg) {
			if(msg.isOk==true){
				location.href =path+"/borrow/memberCenter/selborrow.do";		
			}else{
				layer.alert(msg.msg,8);
			}

		}
	});
}


// 根据时间和状态查询借款
function serachBorrow(){   
	var PagNo=$("#PagNo").val();
	var lnSts = $("#lnSts").val();
	var rateOfYear =  $("#ratLoanYear").val();
	var amt1=0;
	var amt2=0;
	var amt3=0;
	var amt4=0;
	var amt5=0;
	var var_data = "pageNumber="+PagNo+"&codLoanStatus=" + lnSts;
	$.ajax({
				type : "post",
				dataType : "json",
				url : path+"/myApplication/selLoandList.do?"+ lnSts,
				data:var_data,
				success : function(msg) {
					//console.info(var_data);
					
					$("#PagNo").val(PagNo);					 
					var sb = [];
					sb.push('<ul>');
					sb.push('<li class="invest-list-header fn-clear">');
					sb.push('<span class="invest-list-title w100">借款编号</span>');
					sb.push('<span class="invest-list-title w120">借款金额</span>');
					sb.push('<span class="invest-list-title w80">期限</span>');					
					sb.push('<span class="invest-list-title w130">申请日期</span>');
					sb.push('<span class="invest-list-title w90">状态</span>');
					sb.push('<span class="invest-list-title" style="width:150px;">操作</span>');
					sb.push('</li>');
					
					
					if(msg.loanListEntitys!=null && msg.loanListEntitys!=""){
						
					$.each(msg.loanListEntitys,function(i, n) {	
						if(n.codCfCode!=null && n.codCfCode!=""){
							sb.push('<li class="invest-list-piece fn-clear">');
						    sb.push('<div class="invest-list-num w100">');
						    
						    //添加委托贷款逻辑 begin						    
						    if (n.codRaiseMode=='2') {
						    	sb.push('<span><i class="icon ico-wei"></i>'+n.codCfCode +'</span>');
							} else {
								sb.push('<span>'+n.codCfCode +'</span>');
							}
						    //添加委托贷款逻辑end	
						    
						    sb.push('</div>');
					        sb.push('<span class="invest-list-field color-orange-text w120">¥'+formatMoney(n.amtBid,2)+'</span>'); 
					        
							if( n.ctrLoanTermUnit=='1')
							{
								sb.push('<span class="invest-list-field w80"><em class="color-orange-text">'+n.ctrLoanTerm+'天</em></span>');	
							}	
							
							else if (n.ctrLoanTermUnit=='2')
							{
								sb.push('<span class="invest-list-field w80"><em class="color-orange-text">'+n.ctrLoanTerm+'个月</em></span>');	
							}
							
							//处理申请日期
							if( n.datCreate==null)
							{
	
								sb.push('<span class="invest-list-field w130"><em class="color-black-text">---</em></span>');	
							}
							else  if (n.datCreate!=null) {								
								sb.push('<span class="invest-list-field w130">'+formationYear2Month2Date(n.datCreate)+'</span>');	
							}
							
							
							if( n.codLoanStatus=='1')
							{
								sb.push('<span class="invest-list-field w90" >申请中</span>');
							}	
							else if (n.codLoanStatus=='2')
							{
									sb.push('<span class="invest-list-field w90">投资中</span>');
							}
							else if (n.codLoanStatus=='3')
							{
									sb.push('<span class="invest-list-field w90">还款中</span>');
							}
							else if (n.codLoanStatus=='4')
							{
									sb.push('<span class="invest-list-field w90">已还款</span>');
							}
							else if (n.codLoanStatus=='5' )
							{
									sb.push('<span class="invest-list-field w90">已终止</span>');
							}
							else if (n.codLoanStatus=='6' )
							{
									sb.push('<span class="invest-list-field w90">已结束</span>');
							}
							else if (n.codLoanStatus==null )
							{
									sb.push('<span class="invest-list-field w90">--</span>');
							}
							
							if(n.codLoanStatus==null){
								sb.push('<span class="invest-list-field w70"  style="width:150px;">--</span>');
							}	
							
/*							if(n.codLoanStatus=='0'){
								sb.push('<span><a class="color-blue-text" href="'+path +'/borrow/memberCenter/selTerminBorrowQuery.do?codLoanID='+ n.codLoanID +"&codLoanStatus="+n.codCfCode+'">终止</a></span>');
							}	*/				
							else
							{
								if(n.codLoanStatus == '0' ){
									sb.push('<span class="invest-list-field w70"  style="width:150px;">');
									if(n.codCfStatus=='1'){
										sb.push('<a class="color-blue-text" href="'+path +'/lntpayplandetail/memberCenter/sellntpayplandetail.do?codLoanID='+ n.codLoanID +'">申请中</a></span>');
										sb.push('|');
									}						
								}else if (n.codLoanStatus == '1') {//申请中
									sb.push('<span class="invest-list-field w70"  style="width:150px;">');									
									if( n.codCfCode!='----'){
										
										
										if (n.codRaiseMode=='2') {//添加委托贷款逻辑 begin	
											if(n.codCfStatus=='2'){
												sb.push('<a class="color-blue-text" href="'+path +'/lntpayplandetail/memberCenter/selEntrustLntpayplandetail.do?codLoanID='+ n.codLoanID +"&codLoanStatus="+n.codLoanStatus+"&codCfStatus="+n.codCfStatus+"&codRaiseMode="+n.codRaiseMode+'">签署</a>');
											    sb.push('|');
											    sb.push('<a class="color-blue-text" href="'+path +'/lntpayplandetail/memberCenter/selEntrustLntpayplandetail.do?codLoanID='+ n.codLoanID +"&codLoanStatus="+n.codLoanStatus+"&codCfStatus="+n.codCfStatus+"&codRaiseMode="+n.codRaiseMode+'">查看</a>');
											}											
											if(n.codCfStatus=='1'){
												sb.push('<a class="color-blue-text" href="'+path +'/lntpayplandetail/memberCenter/selEntrustLntpayplandetail.do?codLoanID='+ n.codLoanID +"&codLoanStatus="+n.codLoanStatus+"&codCfStatus="+n.codCfStatus+"&codRaiseMode="+n.codRaiseMode+'">查看</a>');
											}											
										} 
										else {//现网逻辑
											if(n.codCfStatus=='2'){
												sb.push('<a class="color-blue-text" href="'+path +'/lntpayplandetail/memberCenter/sellntpayplandetail.do?codLoanID='+ n.codLoanID +"&codLoanStatus="+n.codLoanStatus+"&codCfStatus="+n.codCfStatus+'">签署</a>');
											    sb.push('|');
											    sb.push('<a class="color-blue-text" href="'+path +'/lntpayplandetail/memberCenter/sellntpayplandetail.do?codLoanID='+ n.codLoanID +"&codLoanStatus="+n.codLoanStatus+"&codCfStatus="+n.codCfStatus+'">查看</a>');
											}											
											if(n.codCfStatus=='1'){
												sb.push('<a class="color-blue-text" href="'+path +'/lntpayplandetail/memberCenter/sellntpayplandetail.do?codLoanID='+ n.codLoanID +"&codLoanStatus="+n.codLoanStatus+"&codCfStatus="+n.codCfStatus+'">查看</a>');
											}
										}

									}
									else{
										sb.push('--');
									}
									   /*sb.push('<a class="color-blue-text" href="'+path +'/lntpayplandetail/memberCenter/sellntpayplandetail.do?codLoanID='+ n.codLoanID +"&codLoanStatus="+n.codLoanStatus+"&codCfStatus="+n.codCfStatus+'">查看</a>');*/
									   /*sb.push('<a class="color-blue-text" href="/">--</a>');*/
/*									   sb.push('|');
									sb.push('<a class="color-blue-text" href="'+path +'/borrow/memberCenter/selTerminBorrowQuery.do?codLoanID='+ n.codLoanID +"&codLoanStatus="+n.codCfCode+'">终止</a></span>');*/
									   sb.push("</span>");
								}else if(n.codLoanStatus=='2'){//竞标中
									sb.push('<span class="invest-list-field w70"  style="width:150px;">');
									
									if (n.codRaiseMode=='2') {//添加委托贷款逻辑 begin	
										if(n.codCfStatus=='4'){
										   sb.push('<a class="color-blue-text" href="'+path +'/lntpayplandetail/memberCenter/selEntrustLntpayplandetail.do?codLoanID='+ n.codLoanID +"&codLoanStatus="+n.codLoanStatus+"&codCfStatus="+n.codCfStatus+"&codRaiseMode="+n.codRaiseMode+'">签署</a>');
										   sb.push('|');
										}
										   sb.push('<a class="color-blue-text" href="'+path +'/lntpayplandetail/memberCenter/selEntrustLntpayplandetail.do?codLoanID='+ n.codLoanID +"&codLoanStatus="+n.codLoanStatus+"&codCfStatus="+n.codCfStatus+"&codRaiseMode="+n.codRaiseMode+'">查看</a>');
										   sb.push("</span>");										
									} else {//现网逻辑
										if(n.codCfStatus=='4'){
										   sb.push('<a class="color-blue-text" href="'+path +'/lntpayplandetail/memberCenter/sellntpayplandetail.do?codLoanID='+ n.codLoanID +"&codLoanStatus="+n.codLoanStatus+"&codCfStatus="+n.codCfStatus+'">签署</a>');
										   sb.push('|');
										}
										   sb.push('<a class="color-blue-text" href="'+path +'/lntpayplandetail/memberCenter/sellntpayplandetail.do?codLoanID='+ n.codLoanID +"&codLoanStatus="+n.codLoanStatus+"&codCfStatus="+n.codCfStatus+'">查看</a>');
										   sb.push("</span>");
									}
								} else if (n.codLoanStatus=='4') {//已还款
									
									if (n.codRaiseMode=='2') {//添加委托贷款逻辑 begin	
										sb.push('<span class="invest-list-field w70"  style="width:150px;">');
										sb.push('<a class="color-blue-text" href="'+path +'/lntpayplandetail/memberCenter/selEntrustLntpayplandetail.do?codLoanID='+ n.codLoanID +"&codLoanStatus="+n.codLoanStatus+"&codCfStatus="+n.codCfStatus+"&codRaiseMode="+n.codRaiseMode+'">查看</a></span>');
									} else {//现网逻辑
										sb.push('<span class="invest-list-field w70"  style="width:150px;">');
										sb.push('<a class="color-blue-text" href="'+path +'/lntpayplandetail/memberCenter/sellntpayplandetail.do?codLoanID='+ n.codLoanID +"&codLoanStatus="+n.codLoanStatus+"&codCfStatus="+n.codCfStatus+'">查看</a></span>');
									}

									
								}  else if (n.codLoanStatus == '3') {//还款中---展期中
									
									if (n.codRaiseMode=='2') {//添加委托贷款逻辑 begin	
										sb.push('<span class="invest-list-field w70"  style="width:150px;">');
										sb.push('<a class="color-blue-text" href="'+path +'/lntpayplandetail/memberCenter/selEntrustLntpayplandetail.do?codLoanID='+ n.codLoanID +"&codLoanStatus="+n.codLoanStatus+"&codCfStatus="+n.codCfStatus+"&codRaiseMode="+n.codRaiseMode+'">查看</a></span>');										
									} else {//现网逻辑
										sb.push('<span class="invest-list-field w70"  style="width:150px;">');
										sb.push('<a class="color-blue-text" href="'+path +'/borrow/memberCenter/selIwtreimbursement.do?codLoanID='+ n.codLoanID +"&codSimType=1&codBidCode="+n.codCfCode+'">还款</a>');
										sb.push('|');
										sb.push('<a class="color-blue-text" href="'+path +'/lntpayplandetail/memberCenter/sellntpayplandetail.do?codLoanID='+ n.codLoanID +"&codLoanStatus="+n.codLoanStatus+"&codCfStatus="+n.codCfStatus+'">查看</a></span>');
									}
							}else if (n.codLoanStatus == '5' || n.codLoanStatus == '6') {//流标、已终止
								
								if (n.codRaiseMode=='2') {//添加委托贷款逻辑 begin	
									sb.push('<span class="invest-list-field w70"  style="width:150px;">');	
									sb.push('<a class="color-blue-text" href="'+path +'/lntpayplandetail/memberCenter/selEntrustLntpayplandetail.do?codLoanID='+ n.codLoanID +"&codLoanStatus="+n.codLoanStatus+"&codCfStatus="+n.codCfStatus+"&codRaiseMode="+n.codRaiseMode+'">查看</a></span>');
								} else {//现网逻辑
									sb.push('<span class="invest-list-field w70"  style="width:150px;">');	
									sb.push('<a class="color-blue-text" href="'+path +'/lntpayplandetail/memberCenter/sellntpayplandetail.do?codLoanID='+ n.codLoanID +"&codLoanStatus="+n.codLoanStatus+"&codCfStatus="+n.codCfStatus+'">查看</a></span>');
								}								
							}							
						  }
						}
												
						sb.push('</li>');
					  });
					}else{
						sb.push("<li class='ui-Investment-Content fn-c color-blue-text' style='margin-top:20px;'>该条件没有搜索到相关数据</li>");
					}					
					sb.push('<ul>');
					
					if(msg.amt1!=null){
						amt1=msg.amt1;
					}
					if(msg.amt2!=null){
						amt2=msg.amt2;
					}
					if(msg.amt3!=null){
						amt3=msg.amt3;
					}
					if(msg.amt4!=null){
						amt4=msg.amt4;
					}
					if(msg.amt5!=null){
						amt5=msg.amt5;
					}
					$('#J_divToUpdate').html(sb.join(''));
					$('#J_totalAmt').html("¥"+formatMoney(amt1 + amt2 + amt3 + amt4 + amt5,2));	 //借款总额
					$('#J_appAmt').html("¥"+formatMoney(msg.amt1,2));	 //申请中的借款
					$('#J_appingAmt').html("¥"+formatMoney(msg.amt2,2));	 //进行中的借款
					$('#J_tuningAmt').html("¥"+formatMoney(msg.amt3,2));	 //还款中的借款
					$('#J_endAmt').html("¥"+formatMoney(msg.amt4,2));	 //已结清的借款
					$('#J_overdueAmt').html("¥"+formatMoney(msg.amt5,2));	 //逾期中的借款
					
					$('#totalPages').val(msg.pageCount);
					$("#J_badoo").empty();	
					$("#J_badoo").html(showPage($("#PagNo").val(), msg.pageCount, 1));
				}
	
			});
}

/**
 * 终止申请借款项目
 * @param codLoanID
 */
function appTerminated(codLoanID){
	
	$.layer({
	    shade: [0],
	    area: ['auto','auto'],
	    dialog: {
	        msg: "是否终止借款项目？",
	        btns: 1,                    
	        type: 4,
	        btn: ['确定'],
	        no:function(){
	        	parent.layer.closeAll();
	        },
	        yes: function(){

		        	$.ajax({
		        		type : "post",
		        		dataType : "json",
		        		url : path + "/borrow/selTerminationBorrow.do?codLoanID=" + codLoanID,
		        		success : function(msg) {
		        			
		        			if(msg.ERROR_CODE==null){
		        				location.href = path+"/myApplication/borrowing/selLoandPage.do";		
		        			}else{
		        				layer.alert(msg.ERROR_MSG,8);
		        			}
	
		        		}
		        	});

	        	}
	        }
	});

}

/*
* formatMoney(s,type)
* 功能：金额按千位逗号分割
* 参数：s，需要格式化的金额数值.
* 参数：type,判断格式化后的金额是否需要小数位.
* 返回：返回格式化后的数值字符串.
*/
function formatMoney(s,type) {
	if (/[^0-9\.]/.test(s)) return "0.00";
	if (s == null || s == "") return "0.00";
	s = s.toString().replace(/^(\d*)$/, "$1.");
	s = (s + "00").replace(/(\d*\.\d\d)\d*/, "$1");
	s = s.replace(".", ",");
	var re = /(\d)(\d{3},)/;
	while (re.test(s))
	s = s.replace(re, "$1,$2");
	s = s.replace(/,(\d\d)$/, ".$1");
	if (type == 0) {// 不带小数位(默认是有小数位)
	var a = s.split(".");
	if (a[1] == "00") {
	s = a[0];
	}
	}
	return s;
	}

// 选择自定义时间(隐藏)
function selt(){
	$("#selectDate").css({
		display : "none"
	});
}
// 选择自定义时间(显示)
function selectTime(i) {
	if(i==3){
		$("#selectDate").css({
			display : "block"
		});
	}else {
		$("#selectDate").css({
			display : "none"
		});
	}
	
}
// 手机号输入验证
function vPhone(MbPhn){
	    var reg=/^13[0-9]{9}$|14[0-9]{9}|15[0-9]{9}$|18[0-9]{9}|17[0-9]{9}$/;
	    $("#errorTips").text("");
	    var defaultVal = document.getElementById('mobileno').defaultValue;//默认值请输入手机号
	    if(reg.test(defaultVal)==false){
	        if(defaultVal){
	            if(MbPhn==""||MbPhn==defaultVal){
	               /* $("#errorTips").css({display:"block"});
	                $("#errorTips").text("请输入您的手机号码");*/
	            	alert("请输入您的手机号码");
	                return false;
	            }
	        }
	    }
	    if(reg.test(MbPhn)==true){
	        $("#errorTips").css({display:"none"});
	        return true;
	    }else{
	    	alert("请输入正确的11位数手机号");
	        return false;
	    }
}


//手机绑定
function insPhone() {
    var MbPhn = $("#MbPhn").val();
    var CrdNo = $("#CrdNo").val();
    var var_data = "MbPhn=" + MbPhn + "&CrdNo=" + CrdNo;
    var defaultValue = document.getElementById('CrdNo').defaultValue;
    $("#error").text("");
    var res = /^\d{6}$/;
    isOk = true;
    if(CrdNo == defaultValue||CrdNo==''){
        $('#error').show();
        $('#error').text('请输入您的手机验证码');
        isOk = false;
    }else if(!res.test(CrdNo)){
    	$("#error").show();
    	$("#error").text("请输入正确的6位数字验证码");
		isOk = false;
    }
       
    if(vPhone(MbPhn)==true && isOk == true){
        $.ajax({
            type : "post",
            dataType : "json",
            url : path +"/phone/memberCenter/updbanding.do?t=1&" + var_data,
            success : function(msg) {
                if(msg.maps.isOk==true){
                    location.href = +path +"/phone/memberCenter/phongbindsuccess.do";//新增手机绑定成功页面;
                }else{
                    $("#error").css({display:"block"});
                    $("#error").text(msg.maps.msg);
                }
            }
        });
    }
}

//// 手机验证
//function vnpPhone() {
//    //var MbPhn = $("#MbPhn").val();
//    var CrdNo = $("#CrdNo").val();
//    //var var_data = "MbPhn=" + MbPhn + "&CrdNo=" + CrdNo;
//    var var_data = "CrdNo=" + CrdNo;
//    var res = /^\d{6}$/;
//    $("#error").text("");
//    var defaultValue = document.getElementById('CrdNo').defaultValue;
//    if(CrdNo == defaultValue||CrdNo==''){
//        $('#error').show();
//        $('#error').text('请输入您的手机验证码');
//        return;
//    }else if(!res.test(CrdNo)){
//    	$("#error").show();
//    	$("#error").text("请输入正确的6位数字验证码");
//		return;
//    }
//    
//    $.ajax({
//        type : "post",
//        dataType : "json",
//        url : "/phone/memberCenter/selverifyNewPasswordPhone.do?t=2&"
//                + var_data,
//        success : function(msg) {
//            if(msg.isOk==true){
//                var urlI= "/phone/memberCenter/updphone.do";
//                $('#form1').attr("action", urlI);
//                $('#form1').submit();
//            }else{
//                $("#error").css({display:"block"});
//                $("#error").text(msg.msg);
//            }
//        }
//    });
//}

//修改密码
function pwdPhone(str) {
    var MbPhn = $("#MbPhn").val();//手机号码
    var CrdNo = $("#CrdNo").val();//验证码
    var var_data = "MbPhn=" + MbPhn + "&CrdNo=" + CrdNo;
    var defaultValue = document.getElementById('CrdNo').defaultValue;
    $("#error").text("");
    var res = /^\d{6}$/;
    isOk = true;
    if(CrdNo == defaultValue||CrdNo==''){
        $('#error').show();
        $('#error').text('请输入您的手机验证码');
        isOk = false;
    }else if(!res.test(CrdNo)){
		$("#error").show();
		$("#error").text("请输入正确的6位数字验证码");
		isOk = false;
	}
    if(vPhone(MbPhn)==true && isOk==true){
        $.ajax({
            type : "post",
            dataType : "json",
            url :  path +"/member/memberCenter/selcheckCode.do?t="+str+"&"+ var_data,//校验验证码
            success : function(msg) {
                if(msg.maps.isOk == true) {
                    if(str==5){
                        location.href = path +"/member/memberCenter/txpwdmessauth.do";//填写新登录密码页面
                    }else{
                        location.href = path +"/member/memberCenter/loginpwdmessauth.do";//填写新交易密码页面
                    }
                }else{
                    $("#error").css({display:"block"});
                    $("#error").text(msg.maps.msg);
                    return ;
                }
            }
        });
    }
}

// 修改手机
function modifyPhone() {
    var MbPhn = $("#MbPhn").val();
    var CrdNo = $("#CrdNo").val();
    var var_data = "MbPhn=" + MbPhn + "&CrdNo=" + CrdNo;
    var defaultValue = document.getElementById('CrdNo').defaultValue;
    $("#error").text("");
    isOk = true;
    var res = /^\d{6}$/;
    if(CrdNo == defaultValue||CrdNo==''){
        $('#error').show();
        $('#error').text('请输入您的手机验证码');
        isOk = false;
    }else if(!res.test(CrdNo)){
		$("#error").show();
		$("#error").text("请输入正确的6位数字验证码");
		isOk = false;
	}
    
    if(vPhone(MbPhn)==true && isOk==true){
    $.ajax({
        type : "post",
        dataType : "json",
        url : "/phone/memberCenter/updbanding.do?t=3&" + var_data,
        success : function(msg) {
            if(msg.maps.isOk){
                location.href=path +"/phone/memberCenter/updphonesuccess.do"; 
            }else{
                $("#error").css({display:"block"});
                $("#error").text(msg.maps.msg);
            }
            
        }
    });
    }
}

// 手机投标修改
function closePtender(STATUS,POS,strc){
		$.ajax({
			type : "post",
			dataType : "json",
			url : path +"/member/memberCenter/updclosePtender.do?STATUS="+STATUS+"&POS="+POS,
			success : function(msg) {
				if(msg.isOk==true){
					if(strc==1||strc==3){
						location.href = path +"/member/memberCenter/selmessage.do";
					}else{
						location.href = path +"/phone/memberCenter/selPhonePage.do";
					}
					
				}else{
					layer.alert(msg.msg,8);
				}
			}
		});
	}
// 图形验证
function changeImg(a,b) {
	var imgSrc = $("#imgObj");
	var src = imgSrc.attr("src");
	var urls = chgUrl(src);
	imgSrc.attr("src", urls);
	// 时间戳
	// 为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
	function chgUrl(url) {
		var timestamp = (new Date()).valueOf();
		urlurl = url.substring(0, 33);
		if ((url.indexOf("?") >= 0)) {
			urlurl = url + "&t=" + timestamp;
		} else {
			urlurl = url + "?t=" + timestamp+ 
					"&ImageWidth=" + a+ "&ImageWidth=" + b;
		}
		
		 return urlurl;
	}
}

function isRightCode(i) {	
	var code = $("#veryCode").attr("value");
	code = "c=" + code;
	var vhtml="";
	var t="";
	$.ajax({
				type : "POST",
				url : path +"/verify/verify/resultVerify.do",
				data : code,
				success : function(isOk){
					if(isOk){
						vhtml+="<span class=\"grzltd3\"><input id=\"CrdNo\" name=\"CrdNo\" type=\"text\" class=\"grzl_input2\" /></span>";
						if(i==0){
							vhtml+="<span class=\"grzltd4\"> <a id=\"testId\" href=\"javascript:void(0)\" onclick=\"selverificationCode(1)\"><img src=\"img/memberimg/botton2.gif\" width=\"90\" height=\"38\" border=\"0\"/></a></span>";									
							t+="<a href=\"javascript:void(0)\" onclick=\"insPhone()\">完 成</a>";
						}else if(i==1){
							vhtml+="<span class=\"grzltd4\"> <a id=\"testId\" href=\"javascript:void(0)\" onclick=\"selverificationCode(2)\"><img src=\"img/memberimg/botton2.gif\" width=\"90\" height=\"38\" border=\"0\"/></a></span>";		
							t+="<a href=\"javascript:void(0)\" onclick=\"vnpPhone()\" >完 成</a>";
						}else if(i==2){
							vhtml+="<span class=\"grzltd4\"> <a id=\"testId\" href=\"javascript:void(0)\" onclick=\"selverificationCode(3)\"><img src=\"img/memberimg/botton2.gif\" width=\"90\" height=\"38\" border=\"0\"/></a></span>";		
							t+="<a href=\"javascript:void(0)\" onclick=\"modifyPhone()\" >完 成</a>";
						}
						$("#infos").css({
							display:"none"
						});
						$("#info").html(vhtml);
						$("#botton").html(t);
					}else{
						$("#info").html("验证码输入错误");
					}
				}
			});
}
function callback(data) {
	var vhtml="";
	var t="";
	if(data){
		vhtml+="<span class=\"grzltd3\"><input id=\"CrdNo\" name=\"CrdNo\" type=\"text\" class=\"grzl_input2\" /></span>";
		vhtml+="<span class=\"grzltd4\"> <a href=\"#\"><img src=\"img/memberimg/botton2.gif\" width=\"90\" height=\"38\" border=\"0\"/></a></span>";		
		if(i==0){
			t+="<a href=\"javascript:void(0)\" onclick=\"insPhone()\">完 成</a>";
		}else if(i==1){
			t+="<a href=\"javascript:void(0)\" onclick=\"vnpPhone()\" >完 成</a>";
		}else{
			t+="<a href=\"javascript:void(0)\" onclick=\"modifyPhone()\" >完 成</a>";
		}
		$("#info").html(vhtml);
		$("#botton").html(t);
	}else{
		$("#info").html("验证码输入错误");
	}
	
}
var ck=0;
// 获取验证码
function selverificationCode(str){
	var MB_PHONE = $("#MbPhn").val();
	var var_data = "MB_PHONE=" + MB_PHONE + "&str=" + str;
	if(ck==1){
		return;
	}
	ck=1;
	if(vPhone(MB_PHONE)==true){
		$.ajax({
			type : "post",
			dataType : "json",
			url : path +"/phoneCheckRegister.do",
			data:var_data,
			success : function(data) {
				if(data==null){
	        		  layer.closeAll();
				       layer.alert("连接后台错误！请联系客户人员");
	        	  }else{
	        		  if(data.errorCode==null){
	        			  show_time(90);
	        		  }else{
					layer.alert(data.replyText);
					ck=0;
	        		  }
	        	  }
			}
		});
	}else{
		ck=0;
	}
}
//不带手机号的获取验证码，手机号从后台获取
function selverificationCodeWithoutPhone(str){
	//var MB_PHONE = $("#MbPhn").val();
	//var var_data = "MB_PHONE=" + MB_PHONE + "&str=" + str;
	var var_data =  "str=" + str;
	if(ck==1){
		return;
	}
	ck=1;
		$.ajax({
			type : "post",
			dataType : "json",
			url : path +"/autherized/memberCenter/selverificationCode.do?" + var_data,
			success : function(data) {
				if(data.isOk){
					show_time(90);
				}else{
					layer.alert(data.ms);
					ck=0;
				}
			}
		});
}
var showT = 0;

function show_time(n){
	if(n == 90)
		showT = 0;
	n=n-1;
	var timer = document.getElementById('testId');
	var str_time = n+"秒后重发";
	timer.value = str_time;
	timer.disabled=true;
	if(n==0 || showT == 1){
		ck=0;
		timer.value="短信获取";
		timer.disabled=false;
		return;
	}
	setTimeout("show_time("+n+")", 1000);
}



//var start = 5*60;
//var step = 1;
//function count()
//{
//	var vhtlme="<img src=\"img/memberimg/botton2.gif\" width=\"90\" height=\"38\" border=\"0\"/>";
//	document.getElementById("testId").innerHTML = start;
//	if(start == 5*60 || start == 0)
//		{step *= -1;}
//	else{
//		document.getElementById("testId").innerHTML = vhtlme;
//	}
//	setTimeout("count()",1000);
//}







function less(front,back){
	var f = parseFloat(front*100);
	var b = parseFloat(back*100);
	if(f<=b)return true;
	return false;
}
function compareMoney(money,base){
	var moneyFloat = parseFloat(money*100);
	var baseFloat = parseFloat(base*100);
	if(moneyFloat<baseFloat){
		return money;
	}else{
		return base;
	}
}
function computeMoney(money,base){
	var moneyFloat = parseFloat(money*100);
	var baseFloat = parseFloat(base*100);
	if(moneyFloat<baseFloat){
		return Math.floor(baseFloat-moneyFloat)/100;
	}else{
		return 0;
	}
}
function checkM(){
//	var LnBal=$("#LnBal").val();//尚需还款总额
//	var MSTTOTALAMT=$("#MSTTOTALAMT").val();
 		if($("#checkId").val()=="0"){
//			$("#PAYAMT").val("¥"+formatMoney(MSTTOTALAMT,1));
 			$("#checkId").val("1");
 			return;
		}
 		
 		
 		if($("#checkId").val()=="1"){
//			$("#PAYAMT").val("¥"+formatMoney(LnBal,1));
			$("#checkId").val("0");
			return;
		}
 		
 	}
/**
 * 我要还款上一步
 * @param LnNo
 */
function gobackBorrow(){
	$("#quree").css({display:'none'});
	$("#qureeTwo").css({display:'none'});
}
//我要还款提交
function insReimbursement(LnNo,RTNSTS,TRM,PAYAMT){
//	var var_date="LnNo="+LnNo+"&PAYAMT="+PAYAMT+"&RTNSTS="+RTNSTS;
	if (typeof(RTNSTS) == "undefined") { 
		RTNSTS=1;
	}
	
	var var_date="LnNo="+LnNo+"&RTNSTS="+RTNSTS+"&PAYAMT="+PAYAMT+"&TRM="+TRM;
	$.ajax({
		type : "post",
		dataType : "json",
		async:false,
		url : path +"/borrow/memberCenter/insReimbursement.do?" +var_date ,
		success : function(msg) {
			$("#quree").css({display:'none'});
			$("#qureeTwo").css({display:'none'});
			if(msg.errorCode==null){
				layer.alert('已还款,'+msg.totalAmtArrearsDue+'元', 1); 
				  //setTimeout(function(){resetbgHref(LnNo);},3000);  
				//location.href=path +"/lntpayplandetail/memberCenter/sellntpayplandetail.do?LnNo="+LnNo;
			}else{
				alert('还款失败');
				//location.href=path +"/lntpayplandetail/memberCenter/sellntpayplandetail.do?LnNo="+LnNo;
			}
			 setTimeout(function(){resetbgHref(LnNo);},3000);  //3秒后跳转
			}
		});
	
}

function resetbgHref(LnNo){
	location.href=path +"/lntpayplandetail/memberCenter/sellntpayplandetail.do?codLoanID="+LnNo;
}


//融360 借款列表
function projectborrow(){
	var PagNo=$("#PagNo").val();
	var var_data = "PagNo="+PagNo;
	var variihtml = "";
	$.ajax({
				type : "get",
				dataType : "json",
				url : path +"/openService/query/project.do?"+ var_data,
				success : function(msg) {
					$("#PagNo").val(PagNo);
					 $("#totalPages").val(msg.pageCount);
					 $("#badoo").html(showPage(PagNo, msg.pageCount, 1));
					if(msg.page.list!=null){
						$.each(msg.loanListEntitys,function(i, b) {
							variihtml +="<tr height=\"50\" valign=\"middle\" align=\"center\"  class=\"size_12\">";
							variihtml +="<td><a href="+path +"/openService/query/detail.do?product_id="+b.id+">"+b.name +"</a></td>";
							variihtml +="<td>"+b.borrower +"</td>";
							variihtml +="<td>"+b.cguarant_mode +"</td>";
							variihtml +="<td>"+b.guarantors +"</td>";
							variihtml +="<td>"+formatMoney(b.account,1) +"</td>";
							variihtml +="<td>"+formatMoney(b.account_yes,1) +"</td>";
							variihtml +="<td>"+b.borrow_time+b.cborrow_time_unit +"</td>";
							variihtml +="<td>"+b.tender_num +"</td>";
							variihtml +="<td>"+formatMoney(b.progress,1)+"%</td>";
							variihtml +="<td>"+b.publish_time +"</td>";
							variihtml +="<td>"+b.status +"</td>";
							variihtml +="<td>"+b.borrow_type +"</td>";
							variihtml +="<td>"+b.cpay_type +"</td>";
							variihtml +="<td>"+formatMoney(b.apr,1) +"%</td>";
							variihtml +="<td>"+formatMoney(b.start_price,1)+"</td>";
							variihtml +="<td>"+formatMoney(b.step_price,1)+"</td>";			
							variihtml +="<td>"+b.start_time +"</td>";
							variihtml +="</tr>";
					});
					}else{
						variihtml += "<tr><td  align=\"center\">该条件没有搜索到相关数据</td></tr>";
					}
					$("#ul_li").html(variihtml);
				}
	});
}


function selVdlexts(LnNo){
			$.ajax({
				type : "post",
				dataType : "json",
				url : path +"/lntpayplandetail/memberCenter/selVdlexts.do?LnNo="+LnNo ,
				success : function(msg) {
					if(msg.isOk==true){
						location.href=path +"/lntpayplandetail/memberCenter/selRollOver.do?LnNo="+LnNo;
					}else{
						layer.alert(msg.ms);
					}
					}
				});
}











