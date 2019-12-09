$(function(){

  let path = location.pathname.split("/")
  let page = -1;
  switch(path[2]) {
    case "user_add":
      page = 0;
      break;
    case "phone_add":
      page = 1;
      break;
    case "address_add":
      page = 2;
      break;
    case "card_add":
      page = 3;
      break;
    case "complete":
      page = 4;
      break;
  }
  if (page !== -1) {
    $(".header-with-progress__nav__lists__li").eq(page).
    css('color', '#ea352d');

    for (let i = 0; i <= page; i++) {
      $(".circle").eq(i).
      addClass("circle--red");
    }
  }

  $(".main-k__form__password").on("keyup", function() {
    let pass = $(this).val();
    $(".main-k__form__reveal-pass").text(pass);
  });

  $("#main-k__form__checkbox").change(function() {
    let is = $(this).prop('checked');
    if (is) {
      $(".main-k__form__reveal-pass").show();
    } else {
      $(".main-k__form__reveal-pass").hide();
    }
  })
});