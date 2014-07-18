$(document).on('page:change', function() {
$('.add-new-collection').click(function(){
  $('.collections').append('<select id="article_collection_ids" name="article[collection_ids]"><option value="5">Unsorted</option></select>')
});

$('.artist').change(function(){
  var selected = $(this).find('select').val();
  $.getJSON('/artists/' + selected +'/songs.json',function(songs){
    var templateString = '<li class="song">' +
      '<select name="songs[][id]">' +
        '<option disabled selected> -- Select a Song -- </option>';
        _.each(songs, function(song){
          var ts = '<option value="<%= song.id %>"><%= song.title %></option>';
          template = _.template(ts);
          templateString += template({song: song});
        });
        templateString += '</select></li>'
    $('.songs').html(templateString);
  });
});
};