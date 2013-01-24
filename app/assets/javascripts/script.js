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

    var linkSplit       = $(this).attr('href').split('/'),
        currentLinkHref = linkSplit[linkSplit.length - 1],
        currentPage     = $(location).attr("pathname") + $(location).attr("search"),
        listItem        = $(this).parent();

    if ( currentPage.indexOf(currentLinkHref) != -1 ){
      $('#menu-list.nav > li').removeClass('active');
      listItem.addClass("active");
    }
  });

  $('#menu-video a').click(function () {
    $('#container-video iframe, #container-video object').hide();
    var video1 = $("#video1").attr("src");
    var video2 = $("#video2").attr("src");
    var video3 = $("#video3").attr("src");
    var video4 = $("#video4").attr("src");
    $("#video1").attr("src",video1);
    $("#video2").attr("src",video2);
    $("#video3").attr("src",video3);
    $("#video4").attr("src",video4);
    $('#' + $(this).attr('videolink')).show();

    $('#menu-video a img').removeClass('active');
    $(this).find('img').addClass('active');
  });
  $(".carousel").carousel();
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
