$(document).ready(function(){

  $(".check-all").click(function(){

    if ($(this).prop("checked")) {
      $("._topic").prop("checked", true);
    } else {
      $("._topic").prop("checked", false);
    }
  });

  $(".delete").click(function(){
    trash();
  });


  $(".fobiden").click(function(){
    trash(true);
  });

  function trash(params){
    var topic_array = []; //clear

    $("._topic").each(function(){
      var own = $(this);
      if (own.prop("checked")) {
        topic_array.push(own.data('topic-id'));
      }
    });

    var url = "/admin/topics/trash_all?topic_ids="+ topic_array.join(',');

    if (params) {
      url += "&locked=true";
    }

    $.post(url, function(data){
      location.reload();
    });
  }
});