$(document).ready(function() {

  $('#menu-list').scrollspy();

  $(window).scroll(function() {
    if ($(this).scrollTop() > 300) {
      $('#menu').css('position', 'fixed').css('top', 0);
    } else {
      $('#menu').css('position', 'relative');
    }
  });

  $(".anchor-link").not(".sobre").click(function(event) {
    event.preventDefault();
    var session = $(this).attr('href');
    var sessionPosition = $(session).offset().top;

    $('body').animate({ scrollTop: sessionPosition }, 500, function() {
        window.location.hash = session;
    });

    $('.sobre').click(function(e) {
      e.preventDefault();
    
      $('body').animate({ scrollTop: 0 }, 500, function() {
        window.location.hash = '';
      });  
    });
  });
});
