$(function(){

	// //头部导航
	// $('.nav a').click(function(){
	// 	$(this).css({'background':'#288ce6','color':'#fff'});
	// });


	//帖子 切换
	$('.post-list .tags li').click(function(){
		var index = $(this).index();
		$(this).addClass('selected').siblings().removeClass('selected');
		$('.post-list .list').addClass('hidden');
		$('.post-list .list').eq(index).removeClass('hidden');
	});

	//帖子样式
	$('.post-list dl').hover(function(){
		$(this).addClass('border-bottom').prev().addClass('border-bottom');
	},function(){
		$(this).removeClass('border-bottom').prev().removeClass('border-bottom');
	});

	//返回顶部
	$('.sidebar dl').eq(2).click(function(){
		$('body,html').animate({scrollTop:0},1000); 
	});

	$('.sidebar dt').hover(function(){
		$(this).siblings().css({'display':'block'});
	},function(){
		$(this).siblings().stop().css({'display':'none'});
	});

	//社区话题
	$('.topic-tag li').click(function(){
		$(this).addClass('selected').siblings().removeClass('selected');
	});

});