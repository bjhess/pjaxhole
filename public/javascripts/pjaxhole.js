$(function() {
  $("#loading").css("height", $(document).height()); 

  // PJAXHERE
  $('#content a').pjax('#content', { timeout: null });
  $('#content')
    .bind('start.pjax', function() { $('#loading').fadeIn(750); })
    .bind('end.pjax', function() { $('#loading').fadeOut(750); });
})