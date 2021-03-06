(function ($R)
{
    $R.add('plugin', 'caption', {
        translations: {
            en: {
                "caption": "Подпись"
            }
        },
        init: function (app)
        {
            this.app = app;
            this.lang = app.lang;
            this.block = app.block;
            this.toolbar = app.toolbar;
            this.source = app.source;
            this.component = app.component;
            this.insertion = app.insertion;
        },
        // public
        start: function ()
        {
            var buttonData = {
                title: this.lang.get('caption'),
                api: 'plugin.caption.add'
              };

            var $button = this.toolbar.addButton('caption', buttonData);
        },
        add: function()
        {
          //var $cap = this.component.create('video',);
          this.app.insertion.insertNode(this.getSampleCaption());
        },
        getSampleCaption: function(){
          let dv  = document.createElement('div');
          dv.innerHTML =
          `
          <div class="editor_img-title"><span style="font-family: Helvetica; font-size: 14px;"></span></div>
          <div class="editor_img-content"><span style="font-family: Helvetica; font-size: 14px;"></span></div>
          `;
          return dv;
        }

    });
})(Redactor);
