(function ($R)
{
    $R.add('plugin', 'indents', {
        translations: {
            en: {
                "indents": "Отступы"
            }
        },
        init: function (app) 
        {
            this.app = app;
            this.lang = app.lang;
            this.block = app.block;
            this.toolbar = app.toolbar;
            this.source = app.source; 
        },
        // public
        start: function () 
        {
            var dropdown = {};
            dropdown.add = {
                title: 'Добавить отступ',
                api: 'plugin.indents.add'
            };
            dropdown.remove = {
                title: 'Убрать отступ',
                api: 'plugin.indents.remove'
            };

            var buttonData = {
                title: this.lang.get('indents'),
              };

            var $button = this.toolbar.addButton('indents', buttonData);
            $button.setDropdown(dropdown);
        },
        add: function() 
        {
            var node = document.getSelection().anchorNode;
            var el = node.nodeType == 3 ? node.parentNode : node;
            var currentStyleValue = parseInt($(el).css('margin-left').slice(0, -2));
            $(el).css('margin-left', currentStyleValue + 40 + 'px');
        },

        remove: function()
        {
            var node = document.getSelection().anchorNode;
            var el = node.nodeType == 3 ? node.parentNode : node;
            var currentStyleValue = parseInt($(el).css('margin-left').slice(0, -2));
            if (currentStyleValue !== 0) {
                $(el).css('margin-left', currentStyleValue - 40 + 'px');
            }
        }
    });
})(Redactor);