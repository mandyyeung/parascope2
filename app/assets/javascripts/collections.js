$(document).on('page:change', function() {
  var word = $('.header').text();
  var link = 'https://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=' + word + '%20background&imgsz=xxlarge&imgtype=photo'
  $.ajax({
      url: link,
   
      // the name of the callback parameter, as specified by the YQL service
   
      // tell jQuery we're expecting JSONP
      dataType: "jsonp",
   
      // tell YQL what we want and that we want JSON
      data: {
          format: "json"
      },
   
      // work with the response
      success: function( response ) {
        var results = response.responseData.results
        var num = Math.floor((Math.random() * 3) + 1);
        var url = results[num].url
        $('.banner').css("background-image", "url("+url+")");  
      }
  });
});