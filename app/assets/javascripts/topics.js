$(document).ready(function(){
    // topics new
    var flag = 1;
    $('.select-title .dropdown').click(function(){
      if(flag == 1){
        $(this).parent().siblings('.post-type').removeClass('hidden');
        flag = 0;
      }else{
        $(this).parent().siblings('.post-type').addClass('hidden');
        flag = 1;
      }
    });

    $('.delete').click(function(){
      $(this).parent('li').remove();
    });

    $('.new-vote').click(function(){
      $(this).prev('ul').append('<li><input type="text"><var class="delete"></var></li>');
    });

    //帖子 切换
    $('.left li').click(function(){
      var index = $(this).index();
      $('.post-list').addClass('hidden');
      $('.post-list').eq(index).removeClass('hidden');
    });

    //帖子样式
    $('.post-list dl').hover(function(){
      $(this).addClass('border-bottom').prev().addClass('border-bottom');
    },function(){
      $(this).removeClass('border-bottom').prev().removeClass('border-bottom');
    });

    $('.personal_center ul li').click(function(){
      $(this).addClass('selected').siblings().removeClass('selected');
    });
});
