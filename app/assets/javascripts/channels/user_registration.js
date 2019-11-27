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

  $(".main__form__password").on("keyup", function() {
    let pass = $(this).val();
    $(".main__form__reveal-pass").text(pass);
  });

  $("#main__form__checkbox").change(function() {
    let r = $(this).prop('checked');
    if (r) {
      $(".main__form__reveal-pass").show();
    } else {
      $(".main__form__reveal-pass").hide();
    }
  })
});