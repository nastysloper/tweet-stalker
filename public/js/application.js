$(document).ready(function() {
  if ( window.location.pathname != '/' ) {
    var username = (window.location.pathname).match(/\/(.*)/)[1];

    $.ajax({
      type: 'get',
      url: '/check_stale/' + username
    }).done(function (response) {
      console.log(response);
      if ( response == 'true' ) {
        $.ajax({
          type: 'post',
          url: '/get_tweets/' + username
        }).done(function (tweets) {
          $('#all-tweets').html(tweets);
        });
      }
      $('img').css('display', 'none');
      $('#all-tweets').css('display', 'inline-block');
    });
  }
});
