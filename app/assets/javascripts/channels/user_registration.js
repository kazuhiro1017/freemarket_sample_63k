$(function(){

  let path = location.pathname.split("/")
  let page = -1;
  switch(path[3]) {
    case "user_info":
      page = 0;
      break;
    case "phone_info":
      page = 1;
      break;
    case "address_info":
      page = 2;
      break;
    case "card_info":
      page = 3;
      break;
    case "complete":
      page = 4;
      break;
  }
  if (page !== -1) {
    $(".header-with-progress__nav__lists__li").eq(page).
    css('color', '#ea352d');

    for (var i = 0; i <= page; i++) {
      $(".header-with-progress__nav__lists__li > .circle").eq(i).
      addClass("circle--red");
    }
  }
});