$(document).on('page:change', function() {
var i = 0
  
  $('#submit').click(function next(){
    i ++ ;
    if(i == 1){
      $('.url-bar input#article_url').fadeOut( 'fast', function(){
        $('.url-bar input#article_title').css('display', 'block');
      });
    } else {
      $( this ).css('display', 'none');
      $('.url-bar input#article_title').fadeOut( 'fast', function(){
        $('.url-bar select').css('display', 'block');
      });
      i = 0
    };
  });

  $(document).keypress(function(e) {
    if(e.which == 13) {
      if($('#submit').is(":visible")){
        e.preventDefault();
      } else {
        $('input[type=submit]').click();
      };
      $('#submit').click();
    }
  });
});