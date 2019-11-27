$(function(){
  let path = location.pathname.split("/")
  let page = 4;
  if (1 == 1){
    $(".header-with-progress__nav__lists__li").eq(page).
    css('color', '#ea352d');

    for (var i = 0; i <= page; i++) {
      $(".header-with-progress__nav__lists__li > .circle").eq(i).
      addClass("circle--red");
    }
  }
});