// JavaScript Document
function fundsdetail(id) {
  			window.location.href = $("#_DETAIL").val()+"?id="+id;
    	}
     function merge(id) {
			window.location.href = $("#_MERGE").val()+"?id="+id;
		}
     
     function mergestatus(obj){
			var $this = $(obj);
			$("#_DELETE_DIALOG").dialog({
				title : "警告!",
				dialogClass : "alert",
				modal : true,
				close : function(event, ui) {
					$(this).dialog("close");
				},
				open : function() {
					$(this).html("您确定终止吗？");
				},
				buttons : [ {
					text : "确定",
					click : function() {
						$(this).dialog("close");
						$.ajax({
							url : $("#_MERGESTATUS").val(),
							type : "POST",
							data : {
								 id : $this.attr("data-id")
							},
							dataType : "json",
							success : function(data) {
								if (data.result == "Y") {
									alert("终止成功！", "提示", 1000);
									window.location.reload();  
								}
							},
							error : function() {
								alert("终止失败！", "提示", 1000);
								window.location.reload();  
							}
						});
					}
				}, 
				{
					text : "取消",
					click : function() {
						$(this).dialog("close");
					}
				} ]
			});
		}
     function mergestatus2(obj){
			var $this = $(obj);
			$("#_DELETE_DIALOG").dialog({
				title : "警告!",
				dialogClass : "alert",
				modal : true,
				close : function(event, ui) {
					$(this).dialog("close");
				},
				open : function() {
					$(this).html("您确定提交吗？");
				},
				buttons : [ {
					text : "确定",
					click : function() {
						$(this).dialog("close");
						$.ajax({
							url : $("#_MERGESTATUS").val(),
							type : "POST",
							data : {
								 id : $this.attr("data-id")
							},
							dataType : "json",
							success : function(data) {
								if (data.result == "Y") {
									alert("提交成功！", "提示", 1000);
									window.location.reload();  
								}
							},
							error : function() {
								alert("提交失败！", "提示", 1000);
								window.location.reload();  
							}
						});
					}
				}, 
				{
					text : "取消",
					click : function() {
						$(this).dialog("close");
					}
				} ]
			});
		}
	 


