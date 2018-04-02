// JavaScript Document
function detail(id) {
	//alert($("#_DETAIL").val()+"?id="+id+"&offerCount="+offerCount+"&concernCount="+concernCount);
	window.location.href = $("#_DETAIL").val()+"?id="+id;
}


$(function(){ 

	
	$("body").delegate(".proj_btn2","click",function(){
		 var btn_id=$(this).attr("id").substring(6);

		 if(!$(this).hasClass('proj_btn2_click')){
		   $().myPouUp("确认意向认购",1,2);
           $("#sure_btn").click(function(){
		       $.ajax({
				url : $("#_CONTEXT_PATH").val()+"/changeOfferFlag.do?id="+btn_id,
				type : "POST",
				dataType:"JSON",
				success : function(data) {
					if (data.result == "Y") {
						$().mySuccesW("意向认购成功",1);
					    $("#offer_"+btn_id).addClass("proj_btn2_click");
					}else{
						$().mySuccesW("意向认购失败",1);
					}
				},
		     	}); 
           	});
		};
		//$(this).toggleClass("proj_btn2_click");
	});
 	 $("body").delegate(".proj_btn3","click",function(){
		var btn_id=$(this).attr("id").substring(8);
		 if(!$(this).hasClass('proj_btn3_click')){
//			 $().myPouUp("确认关注",1,2);
//			 $("#sure_btn").click(function(){
			// $(this).toggleClass("proj_btn3_click");
	       $.ajax({
				url : $("#_CONTEXT_PATH").val()+"/changeConcernFlag.do?id="+btn_id,
				type : "POST",
				dataType:"JSON",
				success : function(data) {
					if (data.result == "Y") {
						$().mySuccesW("关注项目成功",1);
  					    $("#concern_"+btn_id).addClass("proj_btn3_click");
					}else{
						$().mySuccesW("关注项目失败",1);
					}
				},
		       }); 
//		     }); 
		}
	    else
    	{
		       $.ajax({
					url : $("#_CONTEXT_PATH").val()+"/cancelConcernFlag.do?id="+btn_id,
					type : "POST",
					dataType:"JSON",
					success : function(data) {
						if (data.result == "Y") {
							$().mySuccesW("取消关注项目成功",1);
							$("#concern_"+btn_id).toggleClass("proj_btn3_click");
						}else{
							$().mySuccesW("取消关注项目失败",1);
						}
					},
			       }); 
			 
    	   
    	};
		/* // $().mySuccesW("关注项目成功",1);
		$(this).toggleClass(""); */
	}); 

 	 $("body").delegate("#btn_concern","click",function(){
 		 
         var ids="";
         $("input[id='chkID']:checkbox").each(
           function(){ 
                     if($(this).attr("checked")){
                    	 ids += $(this).val()+","
                     }
           }
          )

          var btn_ids = ids.substring(0,ids.length-1).split(",");

 			 $().myPouUp("确认关注",1,2);
 			 $("#sure_btn").click(function(){
 		       $.ajax({
 				url : $("#_CONTEXT_PATH").val()+"/changeConcernFlags.do?id="+btn_ids,
 				type : "POST",
 				dataType:"JSON",
 				success : function(data) {
 					if (data.result == "Y") {
						$().mySuccesW("关注项目成功",1);
 						
 				          $(btn_ids).each(function(){
 							 $("#concern_"+this).addClass("proj_btn3_click");
 				          })
 					}else{
						$().mySuccesW("关注项目失败",1);
 					}
 				},
 		       }); 
 		     }); 
 	}); 
 	 
 	 $("body").delegate("#btn_offer","click",function(){
 		 
         var ids="";
         $("input[id='chkID']:checkbox").each(
           function(){ 
                     if($(this).attr("checked")){
                    	 ids += $(this).val()+","
                     }
           }
          )

          var btn_ids = ids.substring(0,ids.length-1).split(",");

		   $().myPouUp("确认意向认购",1,2);
           $("#sure_btn").click(function(){
		       $.ajax({
				url : $("#_CONTEXT_PATH").val()+"/changeOfferFlags.do?id="+btn_ids,
				type : "POST",
				dataType:"JSON",
				success : function(data) {
					if (data.result == "Y") {
						$().mySuccesW("意向认购成功",1);

				          $(btn_ids).each(function(){
    					    $("#offer_"+this).addClass("proj_btn2_click");
 				          })
					}else{
						$().mySuccesW("意向认购失败",1);
					}
				},
		     	}); 
           	});

 	 }); 	 
 	 
	$("body").delegate(".check_input","click",function(){
		$(this).prev().toggleClass("check_icon_no");
	});
	$(".select_btn1,.select_btn2").click(function(){
		$(".select_btn2,.select_btn1,.check_box,.recommend").toggle();
	});
	$(".select_btn2").click(function(){
		//$().mySuccesW("批量操作成功",1);
	});
	
	//筛选按钮切换
	$(".search_box .search_cond dl dd").click(function(){
		$(this).toggleClass("curr");
		$ ("#toggle_box").slideToggle (300);

		if(!$(this).hasClass('last')){
		  	 $(this).siblings("dd:last").children(".check_input").attr("checked",false);
			 $(this).siblings("dd:last").removeClass("curr");
		}else{
			$(this).siblings().children(".check_input").attr("checked",false);
			$(this).siblings().removeClass("curr");
			}
		
	});
//	$(".search_wrap").css({"height":$(".search_box").height()-50+'px'});
	//选中checkbox对dd按钮添加样式
	$(".search_cond input[checked]").each(function(){
		$(this).parent().addClass("curr");
	});

	
	$.ajax({
		   async:false,
		   url:$("#_CONTEXT_PATH").val()+"/search.do",
		   type: "POST",
		   dataType: 'html',
		   data:$("#assetsVo").serialize(),
		   success: function (data) {
			   $("#_FTIAO_PAGINATE_CONTENT").removeClass("paginate_loading");
			   	$("#_FTIAO_PAGINATE_CONTENT").html(data);
		   }
		});
	

	
});

$(window).load(function(){
	$(".text").mCustomScrollbar({
	scrollButtons:{
		enable:true
	},
	theme:"dark-thick"
});
	

});






