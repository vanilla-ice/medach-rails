var article_type_map = {
  'Блоги': 'blog',
  'Лонгриды': 'longread',
  'Медиа': 'media',
  'Новости': 'news',
  'Кейсы': 'case'
}

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
  input_wrappers.find('input').val('');
  input_wrappers.find('select').val('');
  $('.article_' + article_type_map[article_type]).removeAttr('style');
}
