// JavaScript Document
(function($){
$(function(){ 
	//左侧筛选伸缩
	$(".screen_t,.screen_t_icon2,.screen_t_icon3").click(function(){
		   $(".search_nomal").animate({"left":-60+'px'},'fast');
		   $(".search_box").animate({"left":'0'},'slow');		
	});
	$(".search_title_icon3").click(function(){
		   $(".search_nomal").animate({"left":'0'},'slow');
		   $(".search_box").animate({"left":-315+'px'},'fast');		
	});
	
	
	
	
	// 判断浏览器是否支持 placeholder 
	 function placeholderSupport() {
        return 'placeholder' in document.createElement('input');
    }
    
    if(!placeholderSupport()){   // 判断浏览器是否支持 placeholder
       $('[placeholder]').each(function(){
            if(this.type=="password"){
                var inp1=$('<input placeholder="'+$(this).attr('placeholder')+'" type="text" />');
                $(this).after(inp1);
                $(this).hide();
                inp1.on("focus",function(){ 
					$(this).hide();
                    $(this).prev().show();
					$(this).value = ""; 
               });			   
            }
        });
        $('[placeholder]').focus(function() {
            var input = $(this);
            if (input.val() == input.attr('placeholder')) {
                input.val('');
                input.removeClass('placeholder');
            }
        }).blur(function() {
            var input = $(this);
            if (input.val() == '' || input.val() == input.attr('placeholder')) {
                input.addClass('placeholder');
                input.val(input.attr('placeholder'));
            }
        }).blur();
    };

   //弹窗
   $("#phone_btn1,#add_btn1").click(function(){
		   $(".pop_up_window,.modal").show();
		})
   $(".pop_up_close,.a_btn").click(function(){
		   $(".pop_up_window,.modal").hide();
		});
	
	//分页码居中
	$(".page ul").css({"margin-left":-$(".page ul").width()/2+'px'});
	
	//底部自适应
	$(document).ready(function() {
		 var h=window.innerHeight
        || document.documentElement.clientHeight
        || document.body.clientHeight;
        var all_per=$(".all_per").height();
		
		if (all_per<h) {
			
               $(".footer").addClass("footer_bottom");
            }
    });
	
	//首页左导航高度设置
	//自适应浏览器
$(document).ready(function(){
$(window).resize();
});
$(window).resize(function(){
    var contentHeight = $(document.body).height();
	  var search_title=$(".search_title").height();
		var mCSB_container=$(".mCSB_container").height();
		max_h=search_title+mCSB_container;
		x=contentHeight-search_title;
		  $(".search_cond .text").css("height",x+"px");

});
	$(document).ready(function() {

          
		 var h=window.innerHeight
        || document.documentElement.clientHeight
        || document.body.clientHeight;
       
		  	
    });
	
		// 返回顶部
$(function(){
$(window).scroll(function(){ 
var scrollt = document.body.scrollTop+document.documentElement.scrollTop;  
if( scrollt >100 ){   
$(".returnTop").fadeIn(300);      
}else{      
$(".returnTop").stop().fadeOut(300);    
}
});

$(".returnTop").click(function(){
$("html,body").animate({scrollTop:"0px"},300);
});
  });	
})


})(jQuery);

