$(document).ready(function() {

  $('#menu-list').scrollspy();

  $(window).scroll(function() {
    if ($(this).scrollTop() > 300) {
      $('#menu').css('position', 'fixed').css('top', 0);
      $('#sobre').css('margin-top', 50);
    } else {
      $('#menu').css('position', 'relative');
      $('#sobre').css('margin-top', 0);
    }
  });

  $(".anchor-link").not(".sobre").click(function(event) {
    event.preventDefault(event);
    var session = $(this).attr('href');
    var sessionPosition = $(session).offset().top;

    $('body,html').animate({ scrollTop: sessionPosition }, 500, function() {
        window.location.hash = session;
    });
  });

  $('.sobre').click(function(event) {
    event.preventDefault(event);
    
    $('body,html').animate({ scrollTop: 0 }, 500, function() {
      window.location.hash = '';
    });  
  });

  $('#localization').hover(function(event) {
    $('#localization').animate({ opacity: 1, right: 0 }, 300).dequeue();
  }, function(event) {
    $('#localization').animate({ opacity: 0.5, right: '-30px' }, 300).dequeue();
  });
});
