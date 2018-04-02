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
