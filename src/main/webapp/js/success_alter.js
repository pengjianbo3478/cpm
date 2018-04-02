// JavaScript Document
(function($){
	
$.fn.mySuccesW = function(PopTxt,PopIcon){ 
    
		//PopTxt: //弹出窗提示内容
		//PopIcon: //图标样式，警示图标为2，勾选图标为1
    $("body").append("<div class='succes_w'><i class='tips_icon'></i><p class='tips_txt'></p></div>");

	$(".tips_txt").html(PopTxt);
	if(PopIcon==2){
		 $(".tips_icon").addClass("tips_icon2") ;
		}
	
	var popH=$(".succes_w").height(),
	    popW=$(".succes_w").width(),
		windowH=$(window).height(),
		windowW=$(window).width();
	$(".succes_w").css({"top":(windowH-popH)/2+'px',"left":(windowW-popW)/2+'px'});
	
	setTimeout(function () { $(".succes_w").animate({opacity: "hide"}, 800);}, 800);
	setTimeout(function () { $(".succes_w").remove();}, 1600);
	
	
};  

    

})(jQuery);