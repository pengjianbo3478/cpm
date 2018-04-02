// JavaScript Document
  $(function(){
	  //左侧菜单展开收缩
	  $(".sub_nav a").unbind("click").click(function(){
		 if ($(this).parent().children().children('.arrow').hasClass('down')) {
		$(this).parent().children('.sub_list').slideUp('fast');  
		$(this).parent().children().children('.arrow').removeClass('down')
		$(this).parent().children().children('.arrow').addClass('up')
		  } else {
			$(this).parent().children('.sub_list').slideDown('fast');  
		   $(this).parent().children().children('.arrow').addClass('down')
		   $(this).parent().children().children('.arrow').removeClass('up')  
			  }
	  })
	  
	 //找资金页面切换
   $("#btn_upload").unbind("click").click(function(){
	   $(".funds").animate({"left":-1100+'px'},'fast');
	   $(".enclosure").animate({"left":0+'px'},'fast');
	   $(".fr_main").animate({"height":650+'px'},'fast');
	   $("#top_input_info").show();
 	})
   $("#input_info").unbind("click").click(function(){
	   $(".funds").animate({"left":-1100+'px'},'fast');
	   $(".data").animate({"left":0+'px'},'fast');
	    $(".fr_main").animate({"height":1300+'px'},'fast');
	   $("#top_btn_upload").show();
 	})
	$("#top_btn_upload").unbind("click").click(function(){
	   $(".data").animate({"left":-1100+'px'},'fast');
 	   $(".enclosure").animate({"left":0+'px'},'fast');
	   $(".fr_main").animate({"height":650+'px'},'fast');
	   $("#top_btn_upload").hide();
	   $("#top_input_info").show();
 	})
   $("#top_input_info").unbind("click").click(function(){
	   $(".enclosure").animate({"left":-1100+'px'},'fast');
	   $(".data").animate({"left":0+'px'},'fast');
	   $(".fr_main").animate({"height":1300+'px'},'fast');
	   $("#top_input_info").hide();
	   $("#top_btn_upload").show();
 	})
		
	 
	 //增加上传文件
    $(".add").unbind("click").click(function(){
             var _len = $("#upload-file dl").length+1;        
            $("#upload-file").append("<dl id="+_len+" class='dl1' ><dt>&nbsp;</dt><dd>"
			+"<div class='file-box1'><input type='text' name='textfield' id='textfield"+_len+"' class='txt1' placeholder='项目说明书原件'>" 
			+"<input type='button' class='btn1' value='浏览...'>"
			+"<input type='file' name='myfiles' class='file1' id='imagefile"+_len+"' size=\'28\' onchange='document.getElementById(\"textfield"+_len+"\").value=this.value;document.getElementById(\"textfield"+_len+"\").style.textIndent=\"5px\"'></div>"
			+"<span class='remove' onclick=\'deltr("+_len+")\'>-</span>" 
           );            
        }) 
		
	//资产发布筛选
	 	 $(".m_classify").unbind("click").click(function(e) {
              $(".m_classify_list").toggle();
				e.stopPropagation();
            });
	 	 $(document).unbind("click").click(function(){ 
               $(".m_classify_list").hide();
 			});
		 $(".m_classify_list li").unbind("click").click(function() {
                $(".m_classify").text($(this).text());
                $(".m_classify_list").hide();
            });	
			
	//筛选按钮切换
	$(".check-box1 li").unbind("click").click(function(){
		$(this).toggleClass("curr");
		if(!$(this).hasClass('last')){
		  	 $(this).siblings("li:last").children(".check_input").attr("checked",false);
			 $(this).siblings("li:last").removeClass("curr");
		}else{
			$(this).siblings().children(".check_input").attr("checked",false);
			$(this).siblings().removeClass("curr");
			}
 	});
	//选中checkbox对dd按钮添加样式
	$(".check-box1 li input[checked]").each(function(){
		$(this).parent().addClass("curr");
	});
			
	//排序按钮切换
	$(".funds_release .sort").unbind("click").click(function(){
 		$(this).toggleClass("up");
  	});	
	$(".funds_sell .sort").unbind("click").click(function(){
        $(this).parent().siblings().children(".sort").removeClass("up");
		$(this).toggleClass("up");
  	});	
	
	//我的进度滑动
	$(".my_progress li").unbind("click").click(function(){
		$(".my_progress ul").removeClass("s1"); 
		$(".my_progress ul").removeClass("s2");
		$(".my_progress ul").removeClass("s3");
		$(".my_progress ul").removeClass("s4");
	});	
	$(".my_progress .p1").unbind("click").click(function(){ 
 		$(".my_progress ul").addClass("s1");
		$(".my_progress li").removeClass("passed"); 
  	});	
	$(".my_progress .p2").unbind("click").click(function(){ 
 		$(".my_progress ul").addClass("s2");
		$(".my_progress li").removeClass("passed");
		$(".my_progress .p1").addClass("passed");
		
  	});	
	$(".my_progress .p3").unbind("click").click(function(){ 
 		$(".my_progress ul").addClass("s3");
		$(".my_progress li").removeClass("passed");
		$(".my_progress .p1").addClass("passed");
		$(".my_progress .p2").addClass("passed");
  	}); 
	$(".my_progress .p4").unbind("click").click(function(){ 
 		$(".my_progress ul").addClass("s4");
		$(".my_progress li").removeClass("passed");
		$(".my_progress .p1").addClass("passed");
		$(".my_progress .p2").addClass("passed");
		$(".my_progress .p3").addClass("passed");
  	}); 
	 
	//提醒切换
	$(".funds_d_list .tips").unbind("click").click(function(){
 		$(this).toggleClass("active");
  	});	 
	
	
	//监听输入框
$("body").on("change",".txt1",function(){
 	$("#save-btn").removeClass("disabled"); 
	$("#save-btn").attr("disabled","false");	
});
			
 	})	 

  //删除上传文件
    var deltr =function(index)
     {
         var _len = $("#upload-file dl").length;   
        $("dl[id='"+index+"']").remove();//删除当前行
	} 
 
 
 // 滚动
  $(window).scroll(function(){ 
 var scrollt = document.body.scrollTop+document.documentElement.scrollTop;  
 var fm_height = $("#fr_main").height();
 if( scrollt > 65 & fm_height > 800){   
$(".fl_nav").addClass('fl_nav_fixed'); 
} 
  else{ 
 $(".fl_nav").removeClass('fl_nav_fixed');
}
});
 
	$(".file-box1 select option[selected]").each(function(){
		if ($(this).value() == '99'){
	        $("#other_input_1").show();
			} else {
			$("#other_input_1").hide();	
		}
	});
  
//下拉框其他
function showInput1(v){ 
         if (v == '99'){
        $("#other_input_1").show();
		} else {
		$("#other_input_1").hide();	
			}
		
 }
function showInput2(v){ 
    if (v == '99'){
        $("#other_input_2").show();
		} else {
		$("#other_input_2").hide();	
			}
}
