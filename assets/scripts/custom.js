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

