(function ($R) {
  $R.add('plugin', 'clear_format', {
    // set translations
    translations: {
      en: {
        "clear_format": "Удалить стили"
      }
    },
    init: function (app) {
      this.app = app;
      this.toolbar = app.toolbar;
      this.inline = app.inline;
      this.block = app.block;
      this.lang = app.lang;
    },
    start: function () {
      // set up the button with lang variable
      var buttonData = {
        title: this.lang.get('clear_format'),
        api: 'plugin.clear_format.toggle',
      };

      // add the button to the toolbar
      var $button = this.toolbar.addButton('clear_format', buttonData);
    },
    toggle: function () {
      this.inline.clearFormat();
      this.inline.clearStyle();
      this.block.clearFormat();
      this.block.clearStyle();
    }
  });
})(Redactor);