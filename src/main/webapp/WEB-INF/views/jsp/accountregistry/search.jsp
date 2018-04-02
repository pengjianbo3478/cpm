<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="${ctx}/js/ui/Dialog/jquery-ui-1.10.4.dialog.css" />
<script type="text/javascript" src="${ctx}/js/common/pageUtils4Ajax.js"></script>
<script type="text/javascript" src="${ctx}/js/ui/Dialog/jquery-ui-1.10.4.dialog.js?v=1"></script>
<script type="text/javascript" src="${ctx}/js/component/my97DatePicker/WdatePicker.js?v=1.0.0"></script>
<input type="hidden" id="_MENU_L0" value="2" /> 
<div class="search">
	<form:form commandName="accountRegistry" action="${ctx}/accountregistry/search.do" modelAttribute="accountRegistry" method="GET" cssClass="validate">
		<div class="sear_tab mb10">
			<span>商户编号</span>
			<form:input path="account" cssClass="input_txt_l" cssStyle="width:100px" />
			<span>状态</span>
			<form:select path="status" cssClass="input_txt_l" cssStyle="width:100px" >
				<form:option value="">选择状态</form:option>
			<form:option value="P">未激活</form:option>
			<form:option value="A">激活成功</form:option>
			<form:option value="D">完结</form:option>
			</form:select>
			<input class="inp_btn" style="margin-left: 20px;" type="button" value="搜索" id="queryBtn" />
			<input class="inp_btn" style="margin-left: 20px;" type="button" value="新增" id="addBtn" />
		</div>
		<input type="hidden" id="_FTIAO_PAGINATE" name="currentPageNum" value="1" form-id="accountRegistry" btn-id="queryBtn" />
	</form:form>
	<div id="_FTIAO_PAGINATE_CONTENT"></div>
</div>
<div id="_DELETE_DIALOG"></div>
<div id="window_dialog" style="display: none;"></div>
<input type="hidden" id="_MENU_L0" value="5" />
<input type="hidden" id="_MENU_L1" value="0" />
<input type="hidden" class="ctx" value="${ctx}" />
<input type="hidden" id="_ADD" value="${ctx}/accountregistry/add.do">
<script type="text/javascript">
	$(document).ready(function() {
		$("#addBtn").on("click", function() {
			window.location.href = $("#_ADD").val();
		});
		 $("#queryBtn").click();
	});
	
</script>
