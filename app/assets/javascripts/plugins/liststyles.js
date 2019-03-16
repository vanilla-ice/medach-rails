(function ($R)
{
    $R.add('plugin', 'liststyles', {
        translations: {
            en: {
                "liststyles": "Стиль списка"
            }
        },
        init: function (app) 
        {
            this.app = app;
            this.lang = app.lang;
            this.block = app.block;
            this.inline = app.inline;
            this.element = app.element;
            this.toolbar = app.toolbar; 
        },
        // public
        start: function () 
        {
            var dropdown = {};
            dropdown.disc = {
                title: '&bull;',
                api: 'plugin.liststyles.disc'
            };
            dropdown.circle = {
                title: '&#9675;',
                api: 'plugin.liststyles.circle'
            };
            dropdown.square = {
                title: '&#9632;',
                api: 'plugin.liststyles.square'
            };
            dropdown.decimal = {
                title: '1.',
                api: 'plugin.liststyles.decimal'
            };
            dropdown.upperLatin = {
                title: 'A.',
                api: 'plugin.liststyles.upperLatin'
            }
            dropdown.lowerLatin = {
                title: 'a.',
                api: 'plugin.liststyles.lowerLatin'
            }
            dropdown.upperRoman = {
                title: 'I.',
                api: 'plugin.liststyles.upperRoman'
            }
            dropdown.lowerRoman = {
                title: 'i.',
                api: 'plugin.liststyles.lowerRoman'
            }

            var buttonData = {
                title: this.lang.get('liststyles'),
            };

            var $button = this.toolbar.addButton('liststyles', buttonData);
            $button.setDropdown(dropdown);
        },
        // TODO Refactor
        disc: function() 
        {
            var node = document.getSelection().anchorNode;
            var el = node.nodeType == 3 ? node.parentNode : node;
            $(el).css('list-style-type', 'disc');
        },
        circle: function() 
        {
            var node = document.getSelection().anchorNode;
            var el = node.nodeType == 3 ? node.parentNode : node;
            $(el).css('list-style-type', 'circle');
        },
        square: function() 
        {
            var node = document.getSelection().anchorNode;
            var el = node.nodeType == 3 ? node.parentNode : node;
            $(el).css('list-style-type', 'square');
        },
        decimal: function() 
        {
            var node = document.getSelection().anchorNode;
            var el = node.nodeType == 3 ? node.parentNode : node;
            $(el).css('list-style-type', 'decimal');
        },
        upperLatin: function() 
        {
            var node = document.getSelection().anchorNode;
            var el = node.nodeType == 3 ? node.parentNode : node;
            $(el).css('list-style-type', 'upper-latin');
        },
        lowerLatin: function() 
        {
            var node = document.getSelection().anchorNode;
            var el = node.nodeType == 3 ? node.parentNode : node;
            $(el).css('list-style-type', 'lower-latin');
        },
        upperRoman: function() 
        {
            var node = document.getSelection().anchorNode;
            var el = node.nodeType == 3 ? node.parentNode : node;
            $(el).css('list-style-type', 'upper-roman');
        },
        lowerRoman: function() 
        {
            var node = document.getSelection().anchorNode;
            var el = node.nodeType == 3 ? node.parentNode : node;
            $(el).css('list-style-type', 'lower-roman');
        },
    });
})(Redactor);