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
});
