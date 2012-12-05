$(document).ready(function() {
  $('#menu-list').scrollspy();
  $('#menu-list.nav > li').removeClass('active');
  if(window.location.hash == "") {
    $('#menu-list.nav > li:first').addClass('active');
  }

  dockMenuBarOnTop();

  $(".anchor-link").not(".sobre").click(function(event) {
    event.preventDefault(event);
    var session = $(this).attr('href');
    var sessionPosition = $(session).offset().top;

    $('body,html').animate({ scrollTop: sessionPosition }, 500, function() {
        window.location.hash = session;
    });
  });

  $('.sobre').click(backToTop);
  $('.back-to-top').click(backToTop);

  function backToTop(event) {
    event.preventDefault(event);
    
    $('body,html').animate({ scrollTop: 0 }, 500, function() {
      window.location.hash = '';
    });  
  };

  $('#localization').hover(function(event) {
    $('#localization').animate({ opacity: 1, right: 0 }, 300).dequeue();
  }, function(event) {
    $('#localization').animate({ opacity: 0.5, right: '-30px' }, 300).dequeue();
  });

  $('#menu-list.nav > li > a').each(function() {
    var urlSplit        = $(location).attr('href').split('/'),
        linkSplit       = $(this).attr('href').split('/'),
        currentPage     = urlSplit[urlSplit.length - 1],
        currentLinkHref = linkSplit[linkSplit.length - 1],
        listItem        = $(this).parent();

    if ( currentPage.indexOf(currentLinkHref) != -1 || currentPage.indexOf(currentLinkHref) != -1 ) {
      $('#menu-list.nav > li').removeClass('active');
      listItem.addClass("active");
    }
  });
});

function dockMenuBarOnTop(){
  $(window).scroll(function() {
    if ($(this).scrollTop() > $('#header').height()) {
        $('#menu').css('position', 'fixed').css('top', 0);
        $('#menu').css('opacity', '0.9');
        $('#sobre').css('margin-top', 50);
    } else {
        $('#menu').css('position', 'relative');
        $('#menu').css('opacity', '1');
        $('#sobre').css('margin-top', 0);
    }
  });
}