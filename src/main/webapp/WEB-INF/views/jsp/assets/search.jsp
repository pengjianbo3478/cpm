<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<script src="${static_ftiao_cn}/js/assets.query.js?v=1.1" charset="UTF-8"></script>
<script type="text/javascript" src="${ctx}/js/common/jquery.alerts.js"></script>
<link rel="stylesheet" href="${ctx}/js/ui/Dialog/jquery-ui-1.10.4.dialog.css" />
<script type="text/javascript" src="${ctx}/js/common/pageUtils4Ajax.js"></script>
<script type="text/javascript" src="${ctx}/js/ui/Dialog/jquery-ui-1.10.4.dialog.js?v=1"></script>
<script type="text/javascript" src="${ctx}/js/common/jquery.metadata.js"></script>
<script type="text/javascript" src="${ctx}/js/common/messages_zh.js"></script>
<input type="hidden" class="ctx" value="${ctx}" />
<input type="hidden" id="_ADD" value="${ctx}/assets/add.do"/>
<input type="hidden" id="_MERGE" value="${ctx}/assets/merge.do"/>
<input type="hidden" id="_MERGESTATUS" value="${ctx}/assets/mergestatus.do"/>
<div id="_DELETE_DIALOG"></div>
<input type="hidden" id="_QUERY" value="${ctx}/assets/query.do"/>
<input type="hidden" id="_DETAIL" value="${ctx}/assets/fundsdetail.do">
<div id="_FTIAO_PAGINATE_CONTENT"></div>
<div id="window_dialog" style="display: none;"></div>

<input type="hidden" class="ctx" value="${ctx}" />
<script type="text/javascript">
	$(function(){ 
		$.ajax({
			   async:false,
			   url:$("#_QUERY").val(),
			   type: "POST",
			   dataType: 'html',
			   success: function (data) {
				   $("#_FTIAO_PAGINATE_CONTENT").removeClass("paginate_loading");
				   	$("#_FTIAO_PAGINATE_CONTENT").html(data);
			   }
			});
	});	

</script>