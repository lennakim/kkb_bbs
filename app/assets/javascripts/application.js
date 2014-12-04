//= require jquery
//= require jquery_ujs
//= require kindeditor
//= require_tree .


$(document).ready(function(){
  // search
  $(".search").keydown(function(e){
    if(e.keyCode == 13){
      $(this).parent('form').submit();
    }
  });

});