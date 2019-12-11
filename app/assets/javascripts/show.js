$(document).on('turbolinks:load', function() {
  /*初期表示*/
  $('.tabcontent').hide();
  $('.tabcontent').eq(0).show();
  $('.mypagetab').eq(0).addClass('is-active');
  /*クリックイベント*/
  $('.mypagetab').each(function () {
    $(this).on('click', function () {
      var index = $('.mypagetab').index(this);
      $('.mypagetab').removeClass('is-active');
      $(this).addClass('is-active');
      $('.tabcontent').hide();
      $('.tabcontent').eq(index).show();
    });
  });
});


$(document).on('turbolinks:load', function() {
  /*初期表示*/
  $('.tabcontent2').hide();
  $('.tabcontent2').eq(0).show();
  $('.mypagetab2').eq(0).addClass('is-active');
  /*クリックイベント*/
  $('.mypagetab2').each(function () {
    $(this).on('click', function () {
      var index = $('.mypagetab2').index(this);
      $('.mypagetab2').removeClass('is-active');
      $(this).addClass('is-active');
      $('.tabcontent2').hide();
      $('.tabcontent2').eq(index).show();
    });
  });
});