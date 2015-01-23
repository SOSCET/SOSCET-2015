//取得瀏覽器視窗高度
function getBrowserHeight() {
  return window.innerHeight;
}

$(document).ready(function(){
  var navHeight = $('#nav').height();
  //滾動事件
  $(window).scroll(function() {
    var headerHeight = $('#header').height();
    var scrollTopHeight = $(window).scrollTop();
    if(scrollTopHeight > headerHeight) {
      $('#nav').addClass('navbar-fixed-top');
      $('#wrapper').css({marginTop: navHeight});
    } else {
      $('#nav').removeClass('navbar-fixed-top');
      $('#wrapper').css({marginTop: "0px"});
    }
  });

  //body附加滾動監視
  $('html,body').scrollspy({target: '#nav', offset: navHeight});
  $('.fixbug').remove();
  $('html,body').scrollspy('refresh');
  //增加點擊事件
  $('#scrolldown > p').click(function(){
    $('.presentation:first-child a')[0].click();
  })

  //點擊錨點的平滑滾動
  $('.presentation > a').click(function(){
    $('html, body').animate({scrollTop: ($($(this).attr("href")).offset().top - (navHeight - 1))});
    return false;
  });
});

var map;
var myLatlng = new google.maps.LatLng(23.999612, 121.62038);
function initialize() {
  var mapOptions = {
    zoom: 17,
    center: myLatlng
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
}

var marker = new google.maps.Marker({
    position: myLatlng,
    map: map,
    title: "Hello World!"
});

google.maps.event.addDomListener(window, 'load', initialize);