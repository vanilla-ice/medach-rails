(function ($R)
{
    $R.add('plugin', 'add_indent', {
        translations: {
            en: {
                "add_indent": "Добавить отступ"
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
                title: this.lang.get('add_indent'),
                api: 'plugin.add_indent.add'
            };

            var $button = this.toolbar.addButtonAfter('add_outdent', 'add_indent', buttonData);
            $button.setIcon('<i class="fas fa-indent"></i>');
            $button.enable();
        },
        add: function() 
        {
            var node = document.getSelection().anchorNode;
            var el = node.nodeType == 3 ? node.parentNode : node;
            var currentStyleValue = parseInt($(el).css('margin-left').slice(0, -2));
            $(el).css('margin-left', currentStyleValue + 40 + 'px');
        },
        onclickStart: function()
        {
            console.log('SMTH');
        }
    });
})(Redactor);