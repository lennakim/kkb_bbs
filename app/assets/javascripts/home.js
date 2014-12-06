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
})