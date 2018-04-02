//function header(){
//	$(document).mousemove(function(event){
//		if(event.pageY > 0 && event.pageY < 30 && event.pageX > 72){
//			$('#header').css('display','block');	
//		}	
//	});
//	$('#header').hover(function(){
//		$('#header').css('display','block');	
//	},function(){
//		$('#header').css('display','none');		
//	});
//}

function tabvariedcolor() {
	$('table.tabList tbody tr:odd').addClass('treven');
	$('table.tabList tbody tr').hover(function() {
		$(this).addClass('trhover');
	}, function() {
		$(this).removeClass('trhover');
	});
}

function leftBtn() {
	var winHeight = $(window).height();
	var navHeight = $('.nav').height();
	var liHeight = $('.nav li').height();
	var num = 6;
	if (navHeight > (winHeight - 70)) {
		$('#cntLeft').prepend("<a href='javascript:void(0)' class='upBtn' id='upBtn'>▲</a>");
		$('#cntLeft').append("<div id='navList'></div>");
		$('.nav').appendTo($('#navList'));
		$('#cntLeft').append("<a href='javascript:void(0)' class='downBtn' id='downBtn'>▼</a>");
		$('#navList').css({
			'height' : liHeight * num,
			'overflow' : 'hidden'
		});
		$('.nav').css('margin-top', 0);
		// 初始化左边选中图标
		if ($('.nav li.lon').index() > 1 && $('.nav li.lon').index() < ($('.nav li').length - num)) {
			$('.nav').css('margin-top', -($('.nav li.lon').index() - 1) * liHeight);
		} else if ($('.nav li.lon').index() >= ($('.nav li').length - num)) {
			$('.nav').css('margin-top', -($('.nav li').length - num) * liHeight);
		}
		// up button click
		$('#upBtn').bind('click', function() {
			if (parseInt($('.nav').css('margin-top')) < 0) {
				$('.nav').animate({
					'margin-top' : (parseInt($('.nav').css('margin-top')) + liHeight)
				}, 100);
			}
		});
		// down button click
		$('#downBtn').bind('click', function() {
			if (parseInt($('.nav').css('margin-top')) > -($('.nav li').length - num) * liHeight) {
				$('.nav').animate({
					'margin-top' : (parseInt($('.nav').css('margin-top')) - liHeight)
				}, 100);
			}
		});
	}
}

function addRightMenu(i_on_num) {
	if (i_on_num == '15') {
		var i15 = '<a href="' + $("#_CONTEXT_PATH").val() + '/mgr/index/index.do">首页</a>';
		i15 += '<a href="' + $("#_CONTEXT_PATH").val() + '/sc/changepassword/merge.do">密码修改</a>';
		$('#cRTnav').html(i15);
	} else if (i_on_num == '1') {
		var i1 = '<a href="' + $("#_CONTEXT_PATH").val() + '/ea/personal/search.do">用户管理</a>';
		i1 += '<a href="' + $("#_CONTEXT_PATH").val() + '/ea/personal/money/search.do">用户余额查询</a>';
		i1 += '<a href="' + $("#_CONTEXT_PATH").val() + '/ea/personalaccount/search.do">收支明细</a>';
		$('#cRTnav').html(i1);
	} else if (i_on_num == '3') {
		var i3 = '<a href="' + $("#_CONTEXT_PATH").val() + '/ea/merchant/search.do">商户管理</a>';
		i3 += '<a href="' + $("#_CONTEXT_PATH").val() + '/ea/merchant/add.do">商户新增</a>';
		i3 += '<a>商户详情</a>';
		i3 += '<a>交易费率维护</a>';
		i3 += '<a>交易费率新增</a>';
		i3 += '<a href="' + $("#_CONTEXT_PATH").val() + '/ea/organization/search.do">机构查询</a>';
		i3 += '<a href="' + $("#_CONTEXT_PATH").val() + '/ea/organization/add.do">机构新增</a>';
		i3 += '<a>机构详情</a>';
		i3 +=  '<a>机构修改</a>';
		i3 +=  '<a>添加商户风控规则</a>';
		$('#cRTnav').html(i3);
	} else if (i_on_num == '5') {
		var i5 = '<a href="' + $("#_CONTEXT_PATH").val() + '/pb/personalrecharge/search.do">充值订单查询</a>';
		i5 += '<a href="' + $("#_CONTEXT_PATH").val() + '/pb/merchantwithdrawal/search.do">商户提现查询</a>';
		i5 += '<a>商户提现查询详情</a>';
		i5 += '<a href="' + $("#_CONTEXT_PATH").val() + '/pb/personalwithdrawal/search.do">个人提现查询</a>';
		i5 += '<a>个人提现订单详情</a>';
		i5 += '<a href="' + $("#_CONTEXT_PATH").val() + '/pb/paymentbean/search.do">乐豆交易查询</a>';
		$('#cRTnav').html(i5);
	} else if (i_on_num == '6') {
		var i6 = '<a href="' + $("#_CONTEXT_PATH").val() + '/rc/risk/search.do">风控管理</a>';
		i6+= '<a href="' + $("#_CONTEXT_PATH").val() + '/rc/merchantriskconfig/merge.do">风险规则维护</a>';
		i6+= '<a href="' + $("#_CONTEXT_PATH").val() + '/rc/merriskwarn/search.do">风险规则触发管理</a>';
		$('#cRTnav').html(i6);
	}else if (i_on_num == '7') {
		var i7 = '<a href="' + $("#_CONTEXT_PATH").val() + '/ea/merchanttrade/search.do">行业类别查询</a>';
		i7 += '<a href="' + $("#_CONTEXT_PATH").val() + '/ea/area/search.do">区域类别查询</a>';
		i7 += '<a href="' + $("#_CONTEXT_PATH").val() + '/sc/operator/search.do">操作员管理</a>';
		i7 += '<a href="' + $("#_CONTEXT_PATH").val() + '/sc/operator/add.do">操作员新增</a>';
		i7 += '<a>操作员详情</a>';
		i7 += '<a>操作员修改</a>';
		$('#cRTnav').html(i7);
	}  else if (i_on_num == '8') {
			var i8 = '<a href="' + $("#_CONTEXT_PATH").val() + '/pb/payment/search.do">商户交易查询</a>';
			 i8 +='<a href="' + $("#_CONTEXT_PATH").val() + '/st/settle/search.do">结算查询</a>';
			 i8 +='<a href="javascript:;">结算明细查询</a>';
			 i8 +='<a href="' + $("#_CONTEXT_PATH").val() + '/st/beanaccountresulttotal/search.do">乐豆对账</a>';
			 i8 +='<a href="javascript:;">乐豆对账明細</a>';
			 i8 +='<a href="' + $("#_CONTEXT_PATH").val() + '/st/unionpayaccountdetail/search.do">银联对账</a>';
			$('#cRTnav').html(i8);
		} 
}

// 设置导航信息,add by cp 20140515
function setNavMsg(obj) {
	if ($('#cRTnav').html() != "") {
		var cTnavHtml = $('#cTnav').find('a').text();
		$('#cTnav').html('<a href="javascript:void(0);">' + cTnavHtml + '</a>&nbsp;&gt;&nbsp;<span>' + $(obj).text() + '</span>');
	}
}
// add by cp 20140515
function cRTnavBindClick(node) {
	// 右边菜单添加click事件及on样式
	$('#cRTnav').find("a").bind('click', function() {
		$(this).addClass('on').siblings().removeClass('on');
		// $(this).addClass('on');
		// 设置导航信息
		setNavMsg(this);
	});
}
// 点亮menu,add by cp 20140515
function initMenu() {
	var leftMenu = $("#cntLeft .nav").find("a").get(parseInt($("#_MENU_L0").val()));
	$(leftMenu).addClass("on");
	$(leftMenu).parent().addClass("lon");
	var i_class = $(leftMenu).find("i").attr("class");
	var i_on_num = $.trim(i_class).substring(1);
	$(this).find("i").addClass("on" + i_on_num);
	// 右边菜单添加click事件及on样式
	addRightMenu(i_on_num);
	// 添加导航
	var cntLeftText = $(leftMenu).text();
	$('#cTnav').html('<a href="javascript:void(0);">' + cntLeftText + '</a>');
	// $(leftMenu).click();
	var rightMenu = $("#cRTnav").find("a").get(parseInt($("#_MENU_L1").val()));
	// $(rightMenu).click();
	$(rightMenu).addClass('on');
	// 添加右边菜单的click事件
	cRTnavBindClick();
	// 设置导航信息
	setNavMsg(rightMenu);
}

// add by cp 20140515
function leftMenuClick() {
	// 左边菜单添加click事件及样式
	$("#cntLeft .nav").find("a").bind('click', function() {
		$("#cntLeft .nav").find("li").removeClass("lon");
		$("#cntLeft .nav").find("a").removeClass("on");
		$("#cntLeft .nav").find("i").each(function() {

			var i_class = $(this).attr("class");
			var i_on_class = "on" + $.trim(i_class).substring("i");
			$(this).removeClass(i_on_class);
		});
		$(this).addClass("on");
		$(this).parent().addClass("lon");
		var i_class = $(this).find("i").attr("class");
		var i_on_num = $.trim(i_class).substring(1);
		$(this).find("i").addClass("on" + i_on_num);
		// 添加右边菜单
		addRightMenu(i_on_num);
		// 添加导航
		var cntLeftText = $(this).text();
		$('#cTnav').html('<a href="javascript:void(0);">' + cntLeftText + '</a>');
		cRTnavBindClick();
	});
	initMenu();
}

$(function() {
	leftBtn();
	$('.header').on('click', '.userName', function() {
		if ($('.userListCenter').css('display') == 'none') {
			$('.userListCenter').css('display', 'block');
			$('.userName').css('border-radius', '12px 12px 0 0');
		} else {
			$('.userListCenter').css('display', 'none');
			$('.userName').css('border-radius', '12px');
		}

		var offset = $(this).offset();
		$('.userListCenter').css({
			left : offset.left,
			top : offset.top + 20,
			width : $(this).width() + 32
		});
	});
	//add by cp 20140515
	leftMenuClick();

	$('form').each(function() {
		if ($(this).hasClass('validate')) {
			$(this).validate();
		}
	});
});
