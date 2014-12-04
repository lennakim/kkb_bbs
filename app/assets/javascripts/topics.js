$(document).ready(function(){
  (function(){
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
  }());

  (function(){
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
  }());

  (function(){
    // topic show
    var flag = 1;

    $('.post-list .add-btn li:nth-child(2)').click(function(){
      if(flag == 1){
        $(this).addClass('bac').parents('.top-btn').siblings('.reply').removeClass('hidden');
        $(this).text('收起回复');
        flag = 0;
      }else{
        $(this).removeClass('bac').parents('.top-btn').siblings('.reply').addClass('hidden');
        $(this).text('回复');
        flag = 1;
      }
    });
  }());

});
