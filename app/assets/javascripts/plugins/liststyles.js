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

            var $button = this.toolbar.addButtonAfter('lists', 'liststyles', buttonData);
            $button.setDropdown(dropdown);
        },

        findParentList:function(node){
          for ( ; node && node !== document; node = node.parentNode ) {

            if(node.tagName == "UL" || node.tagName == "OL")
              return node;
          }
          return null;
        },



        changeListType:function(type){
          var node = document.getSelection().anchorNode;
          var el = this.findParentList(node)
          console.log(el);
          if(el)
            for(var child=el.firstChild; child!==null; child=child.nextSibling)
                $(child).css('list-style-type', type);
        },

        // TODO Refactor
        disc: function()
        {
            this.changeListType('disc');
        },
        circle: function()
        {
            this.changeListType('circle');
        },
        square: function()
        {
            this.changeListType( 'square');
        },
        decimal: function()
        {
            this.changeListType( 'decimal');
        },
        upperLatin: function()
        {
            this.changeListType('upper-latin');
        },
        lowerLatin: function()
        {
            this.changeListType( 'lower-latin');
        },
        upperRoman: function()
        {
            this.changeListType( 'upper-roman');
        },
        lowerRoman: function()
        {
            this.changeListType('lower-roman');
        },
    });
})(Redactor);
