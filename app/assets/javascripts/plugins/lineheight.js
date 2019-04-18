(function ($R)
{
    $R.add('plugin', 'lineheight', {
        translations: {
            en: {
                "lineheight": "Межстрочный интервал"
            }
        },
        init: function (app) 
        {
            this.app = app;
            this.lang = app.lang;
            this.block = app.block;
            this.inline = app.inline;
            this.toolbar = app.toolbar;
            this.source = app.source; 
        },
        // public
        start: function () 
        {
            var heights = [1, 1.25, 1.5, 2, 2.5, 3];
            var dropdown = {};
            
            dropdown.remove = {
                title: "Remove Line Height",
                api: 'plugin.lineheight.remove'
            };

            for (var i = 0; i < heights.length; i++) {
                dropdown["s" + i] = {
                    title: heights[i].toString(),
                    api: 'plugin.lineheight.add',
                    args: heights[i]
                }
            }
            
            var buttonData = {
                title: this.lang.get('lineheight'),
              };

            var $button = this.toolbar.addButtonAfter('fontsize', 'lineheight', buttonData);
            $button.setIcon('<i class="fas fa-arrows-alt-v"></i>');
            $button.setDropdown(dropdown);
        },
        add: function(height)
        {
            var args = {
                style: { 'line-height': height }
            };
            this.block.format(args);
            this.inline.format(args);
        },
        remove: function()
        {
            this.block.remove({style: "line-height"});
            this.inline.remove({style: "line-height"});
        }
    });
})(Redactor);