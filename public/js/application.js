$(document).ready(function() {
  if ( window.location.pathname != '/' ) {
    var username = (window.location.pathname).match(/\/(.*)/)[1];

    $.ajax({
      type: 'post',
      url: '/get_tweets/' + username
    }).done(function (tweets) {
      if ( tweets != 'SHAZAM' ) {
        $('#all-tweets').html(tweets);
      }
      $('img').css('display', 'none');
      $('#all-tweets').css('display', 'inline-block');
    });
  }
});
