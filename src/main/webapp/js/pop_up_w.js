// JavaScript Document
(function($){
	
$.fn.myPouUp = function(PopTxt,PopIcon,PopBtn){ 
    
		//PopTxt: //弹出窗提示内容
		//PopIcon: //图标样式，警示图标为1，勾选图标为2
		//PopBtn: //确认取消按钮个数，只有确认按钮为1，确认取消按钮都在为2 
    $("body").append("<div class='modal2'></div><div class='pop_up_w'><p class='tips_txt'></p><div class='btn_bott'><a class='a_btn' id='sure_btn'>确认</a><a class='a_btn m_l60' id='esc_btn'>取消</a></div><i class='tips_icon'></i><a class='pop_up_clo'>X</a></div>");
	
	 
	$(".tips_txt").html(PopTxt);
	if(PopIcon==2){
		 $(".tips_icon").addClass("tips_icon2") ;
		}
	if(PopBtn==1){
		 $("#esc_btn").hide() ;
		}
	var popH=$(".pop_up_w").height(),
	    popW=$(".pop_up_w").width(),
		windowH=$(window).height(),
		windowW=$(window).width(),
		reflaut=2;
	$(".pop_up_w").css({"top":(windowH-popH)/2+'px',"left":(windowW-popW)/2+'px'});
	$(".pop_up_w2").css({"height":(popH+10)+'px',"width":(popW+10)+'px',"top":(windowH-popH-10)/2+'px',"left":(windowW-popW-10)/2+'px'});
	$(".tips_icon").css("top",($(".tips_txt").height()+34)/2+'px');
	$(".pop_up_clo,.a_btn").click(function(){
		   $(".pop_up_w,.modal2").remove();
		   
		   //document.documentElement.style.overflow = "";
		})
	$("#esc_btn").click(function(){
		  reflaut=2;      //取消按钮返回1
		})
	$("#sure_btn").click(function(){
		  reflaut=1;      //确认按钮返回2
		})
	return reflaut;
    event.stopPropagation(); 
};  

    

})(jQuery);