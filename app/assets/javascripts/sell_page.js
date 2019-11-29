$(document).on('turbolinks:load', function (){

  $(".category1").hide();
  $(".category2").hide();

  $(".category #_ancestry").change(function(){
    $(".category1").show();
  });
  $(".category1 #_ancestry").change(function(){
    $(".category2").show();
  });


  $(".after-selected-postage").hide();

  $("#_postage").change(function(){
    $(".after-selected-postage").show();
  });


  $(".field-cost").on('keyup', function(){
    var num = $(".field-cost").val();
    var fee = num * 0.1
    var fee_integer = parseInt(fee)
    var fee_integer_comma = fee_integer.toLocaleString();

    var profit = num - fee_integer
    var profit_comma =profit.toLocaleString();

    if (num >= 300 && 9999999 >= num) {
      $(".hyphen").html("¥" + fee_integer_comma);
      $(".hyphen-bold").html("¥" + profit_comma);
    }
    else {
      $(".hyphen").empty();
      $(".hyphen").html("-");
      $(".hyphen-bold").empty();
      $(".hyphen-bold").html("-");
    };
  });

});