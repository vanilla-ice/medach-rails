(function ($R) {
  $R.add('plugin', 'preview', {
    translations: {
      en: {
        "preview": "Превью"
      }
    },
    init: function (app) {
      this.app = app;
      this.lang = app.lang;
      this.toolbar = app.toolbar;
    },
    start: function () {
      // create the button data
      var buttonData = {
        title: this.lang.get('preview'),
        api: 'plugin.preview.show'
      };

      // create the button
      var $button = this.toolbar.addButton('preview', buttonData);
    },
    show: function () {
      $('body').css('overflow-y', 'hidden');
      var data = {};

      data['name'] = $('.js_title').val();
      data['post'] = $('.redactor-source').val();
      data['redaction'] = $('.js_redaction').val();
      data['author'] = $('.js_author').val();
      data['infographic'] = $('.js_infographic').val();
      data['origin'] = $('.js_original').val();
      data['translate'] = $('.js_translate').val();
      data['image'] = $('.file .inline-hints img').attr('src');
      $('body').append(renderQuickviewPopup(data));

      $('body').on('click', '.js-close', function () {
        $('.quickview-popup').remove();
        $('body').css('overflow-y', 'initial');
      });
    }
  });
})(Redactor);