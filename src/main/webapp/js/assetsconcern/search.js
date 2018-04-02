// JavaScript Document

function detail(id,offerCount,concernCount) {
	alert($("#_DETAIL").val()+"?id="+id+"&offerCount="+offerCount+"&concernCount="+concernCount);
	window.location.href = $("#_DETAIL").val()+"?id="+id+"&offerCount="+offerCount+"&concernCount="+concernCount;
}
	 	$(function(){ 
	 		$("body").delegate(".proj_btn2","click",function(){
	 			 var btn_id=$(this).attr("id").substring(6);
	 			 if(!$(this).hasClass('proj_btn2_click')){
	 			   $().myPouUp("确认意向认购",1,2);
	 	           $("#sure_btn").click(function(){
	 			       $.ajax({
	 					url : $("#_CONTEXT_PATH").val()+"/assetsconcern/changeOfferFlag.do?id="+btn_id ,
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
				 var btn_id=$(this).attr("id");
				 if(!$(this).hasClass('proj_btn3_click')){
				   $().myPouUp("确认取消关注",1,2);
		         $("#sure_btn").click(function(){
				       $.ajax({
				    	url : $("#_CONTEXT_PATH").val()+"/assetsconcern/mergeDeletedFlag.do?id="+btn_id,
						type : "POST",
						dataType:"JSON",
						success : function(data) {
							if (data.result == "Y") {
								$("#"+btn_id).parent().parent().parent().remove(); 
	 							$().mySuccesW("取消关注成功",1);
							}else{
								alert("取消关注失败");
							}
						},
				     	}); 
		         	});
				};
			});
	 		$(".check_input").click(function(){
	 			$(this).prev().toggleClass("check_icon_no");
	 		});
	 		
	 		//筛选按钮切换
	 		$(".search_box .search_cond dl dd").click(function(){
	 			$(this).toggleClass("curr");
	 			if(!$(this).hasClass('last')){
	 			  	 $(this).siblings("dd:last").children(".check_input").attr("checked",false);
	 				 $(this).siblings("dd:last").removeClass("curr");
	 			}else{
	 				$(this).siblings().children(".check_input").attr("checked",false);
	 				$(this).siblings().removeClass("curr");
	 				}
	 			
	 		});
	 		$(".search_wrap").css({"height":$(".search_box").height()-50+'px'});
	 		//选中checkbox对dd按钮添加样式
	 		$(".search_cond input[checked]").each(function(){
	 			$(this).parent().addClass("curr");
	 		});

	 	})
	 


