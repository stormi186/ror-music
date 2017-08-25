jQuery(function() {
  var albums;
  albums = $('#track_album_id').html();
  console.log(albums);
  return $('#track_artist_id').change(function() {
    var artist, options;
    artist = $('#track_artist_id :selected').text();
    options = $(albums).filter("optgroup[label=" + artist + "]").html();
    console.log(options);
    if (options) {
      return $('#person_album_id').html(options);
    } else {
      return $('#person_album_id').empty();
    }
  });
});
