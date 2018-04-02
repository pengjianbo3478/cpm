// JavaScript Document
function click_val(type){
	document.getElementById("status").value=type;
	var flg = checkForm();
	if(type.trim()=="DF"){
		flg = true;
	}
	if(flg){
		$('#form1').submit();
	}
}
function checkForm(){
//	var reg = new RegExp("^[0-9]*$");
	$("#target_info").html("");
	var reg1=/^[\u4e00-\u9fa5]{0,}$/;
	var reg2 = /^\d*\.?\d{0,2}$/;
	var reg3 = /^\d{0,4}\.?\d{0,2}$/;
	var assetsName = $("#assetsName").val().trim();
	var assetArea = $("#assetArea").val().trim();
	var assetScales = $("#assetScales").val().trim();
	var termMin =$("#termMin").val().trim();
	var yieldMin = $("#yieldMin").val().trim();
	var yieldMax = $("#yieldMax").val().trim();
	var useOfFunds = $("#useOfFunds").val().trim();
	var financing = $("#financing").val().trim();
	var introduction = $("#introduction").val().trim();
	var financingCredit = $("#financingCredit").val().trim();
	var target = $("input[name='targetlist']").is(':checked');
	var assetType = $('#assetType option:selected').val();
	var financingCategory = $('#financingCategory option:selected').val();
	var myfile = $("#myfile").val();
	var point = myfile.lastIndexOf(".");     
    var type = myfile.substr(point);
    
	if(assetsName.length=0||assetsName==null){
		$("#assetsName_info").html("项目名称不能为空");
		return false;
	}
	$("#assetsName_info").html("");
	if(assetsName.length>40){
		$("#assetsName_info").html("项目名称长度不能超过40位");
		return false;
	}
	$("#assetsName_info").html("");
	if(assetType=="0"){
		$("#assetType_info").html("请选择资产类型");
		return false;
	}
	$("#assetType_info").html("");
	if(assetArea.length==0||assetArea==null){
		$("#assetArea_info").html("项目地区不能为空");
		return false;
	}
	$("#assetArea_info").html("");
	if(assetArea.length>20){ 
		$("#assetArea_info").html("项目地区长度不能超过20位");
		return false;
	}
	$("#assetArea_info").html("");
	if(!reg1.test(assetArea)){
		$("#assetArea_info").html("项目地区必须是中文");
		return false;
	}
	$("#assetArea_info").html("");
	if(assetScales.length==0||assetScales==null){
		$("#assetScales_info").html("融资规模不能为空");
		return false;
	}
	$("#assetScales_info").html("");
 	if(!reg3.test(assetScales)){
 		$("#assetScales_info").html("融资规模格式不正确");
		return false;
 	}
 	$("#assetScales_info").html("");
 	if(termMin.length==0||termMin==null){
 		$("#term_info").html("期限不能为空");
		return false;
 	}
 	$("#term_info").html("");
 	if(yieldMin.length==0||yieldMin==null||yieldMax.length==0||yieldMax==null){
 		$("#yield_info").html("收益率不能为空");
		return false;
 	}
 	$("#yield_info").html("");
 	if(!reg2.test(yieldMin)||!reg2.test(yieldMax)){
 		$("#yield_info").html("收益率格式不正确");
		return false;
 	}
 	$("#yield_info").html("");
 	if(yieldMin >= yieldMax){
 		$("#yield_info").html("收益率输入有误");
		return false;
 	}
 	if(yieldMax>24){
 		$("#yield_info").html("收益率输入有误");
		return false;
 	}
 	$("#yield_info").html("");
 	if(!target){
		$("#target_info").html("请勾选开放对象不能为空");
		return false;
	}
 	$("#target_info").html("");
 	if(useOfFunds.length==0||useOfFunds==null){
 		$("#useOfFunds_info").html("资产用途不能为空");
		return false;
 	}
 	$("#useOfFunds_info").html("");
 	if(financing.length==0||financing==null){
 		$("#financing_info").html("融资主体不能为空");
		return false;
 	}
 	$("#financing_info").html("");
 	if(financingCategory=="0"){
		$("#financingCategory_info").html("请选择融资主体类型");
		return false;
	}
 	$("#financingCategory_info").html("");
 	if(introduction.length==0||introduction==null){
 		$("#introduction_info").html("项目介绍不能为空");
		return false;
 	}
 	$("#introduction_info").html("");
 	if(financingCredit.length==0||financingCredit==null){
 		$("#financingCredit_info").html("融资主体信用描述不能为空");
		return false;
 	}
 	$("#financingCredit_info").html("");
 	if(type==".txt"||type==".doc"||type==".docx"||type==".jpg"||type==".gif"||type==".JPG"||type==".GIF"||type==".PNG"||type==".png"||type==".PDF"||type==".pdf"){
 		img=document.createElement("img");       
        img.src=location;
        if(img.fileSize>204800){     
            $("#target_info").html("文件尺寸请不要大于200KB");
    		return false;
        }
 	}else{
    	$("#target_info").html("文件类型不正确");
    	return false;
    }
	return true;
}
function file_Validator(){
	var flg = true;
	$("#msgcode").html("");
	$("input[name='myfiles']").each(function(){
		var myfile = this.value;
		var point = myfile.lastIndexOf(".");     
	    var type = myfile.substr(point);
	    if(type==".txt"||type==".doc"||type==".docx"||type==".jpg"||type==".gif"||type==".JPG"||type==".GIF"||type==".PNG"||type==".png"||type==".PDF"||type==".pdf"){
	      	 img=document.createElement("img");       
	           img.src=location;
	           if(img.fileSize>204800){  
	               $("#msgcode").html("文件尺寸请不要大于200KB");
	               flg = false;
	               return false;
	           }
	    	}else{
	    		$("#msgcode").html("文件类型不正确");
	    		flg = false;
	            return false;
	    	}
	});
	return flg;
}

