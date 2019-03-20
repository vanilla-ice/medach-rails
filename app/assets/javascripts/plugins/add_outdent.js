(function ($R)
{
    $R.add('plugin', 'add_outdent', {
        translations: {
            en: {
                "add_outdent": "Убрать отступ"
            }
        },
        init: function (app) 
        {
            this.app = app;
            this.lang = app.lang;
            this.toolbar = app.toolbar;
        },
        // public
        start: function () 
        {
            var buttonData = {
                title: this.lang.get('add_outdent'),
                api: 'plugin.add_outdent.remove'
            };

            var $button = this.toolbar.addButtonBefore('image', 'add_outdent', buttonData);
            $button.setIcon('<i class="fas fa-outdent"></i>');
        },
        remove: function()
        {
            var node = document.getSelection().anchorNode;
            var el = node.nodeType == 3 ? node.parentNode : node;
            var currentStyleValue = parseInt($(el).css('margin-left').slice(0, -2));
            if (currentStyleValue !== 0) {
                $(el).css('margin-left', currentStyleValue - 40 + 'px');
            }
            this.toolbar.getButton('add_outdent').setActive();
        }
    });
})(Redactor);