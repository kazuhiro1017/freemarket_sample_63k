$(document).on('turbolinks:load', function (){

  $(".category1").hide();
  $(".category2").hide();
  $(".form-group-size").hide();
  $(".form-group-brand").hide();

  function showChildSelect(children){
    $('.child-option').remove();
    $('.grandchild-option').remove();
    children.forEach(function(child){
      var child_option =`<option value="${child.id}" class="child-option">${child.name}</option>`
      $('#child-select').append(child_option);
    })
    $('.category1').show();
  }

  function showGrandChildSelect(children){
    $('.grandchild-option').remove();
    children.forEach(function(child){
      var child_option =`<option value="${child.id}" class="grandchild-option">${child.name}</option>`
      $('#grandchild-select').append(child_option);
    })
    $('.category2').show();
  }

  $('#category-select').change(function(){
    var parent_id = $(this).val();
    $.ajax({
      url: "/items/category_find",
      type: "GET",
      dataType: 'json',
      data: { category_id: parent_id }
    })
    .done(function(children){
      showChildSelect(children);
    });
  });
  $('#child-select').change(function(){
    var parent_id = $(this).val();
    $.ajax({
      url: "/items/category_find",
      type: "GET",
      dataType: 'json',
      data: { category_id: parent_id }
    })
    .done(function(children){
      showGrandChildSelect(children);
      selected_child = $('#child-select').val()
    });
  });
  $('#grandchild-select').change(function(){
    var child_id = $('#child-select').val();
    if (child_id < 481){
      $(".form-group-size").show();
    }
    if (child_id < 798){
      $(".form-group-brand").show();
    }
  });







  $(".after-selected-postage").hide();

  $("#item_postage").change(function(){
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