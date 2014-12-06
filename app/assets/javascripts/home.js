$(function(){
	//slider
	$('.slider-tag li img').click(function(){
		var src = $(this).attr('src');
		$('.show').attr('src',src);
	});
	var index = 0;
	setInterval(function(){
		if(index<2){
			index++;
		}else{
			index = 0;
		}
		$('.slider-tag li img').eq(index).click();
	},3000);

	//举报
	$('.inform-bac').css({'width':$(document.body).width(),
						'height':$(document.body).height()
						});
	$('.inform-con').css({'top':$(document.body).scrollTop()});
	$('.inform').click(function(){
		$('.inform-bac,.inform-con').removeClass('hidden');
	});

	$('.inform-con').click(function(){
		$('.inform-bac,.inform-con').addClass('hidden');
	});
})