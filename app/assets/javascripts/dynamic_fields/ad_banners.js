$( document ).ready(function() {
  var selected_values = $('.selected_values').data('selected-values');
  var article_type = $( '.article_type_select' ).val();
  var select = $('.article_' + article_type).find('select');
  select.val(selected_values);
  select.trigger('change');
});

function on_change_ad_type( args ) {
  var ad_type = $( '.ad_type_select' ).val();
  var input_wrappers = $('.content_custom, .content_google');
  input_wrappers.css('display', 'none');
  input_wrappers.find('input').val('');
  $('.content_' + ad_type).removeAttr('style');
}

function on_change_article_type( args ) {
  var article_type = $( '.article_type_select' ).val();
  var input_wrappers = $('.a_type');
  input_wrappers.css('display', 'none');
  input_wrappers.find('select').val(null).trigger('change');
  $('.article_' + article_type).removeAttr('style');
}
