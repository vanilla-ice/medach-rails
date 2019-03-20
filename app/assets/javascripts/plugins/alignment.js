(function($R)
{
    $R.add('plugin', 'alignment', {
        translations: {
    		en: {
    			"align": "Align",
    			"align-left": "Align Left",
    			"align-center": "Align Center",
    			"align-right": "Align Right",
    			"align-justify": "Align Justify"
    		}
        },
        init: function(app)
        {
            this.app = app;
            this.opts = app.opts;
            this.lang = app.lang;
            this.block = app.block;
            this.toolbar = app.toolbar;
        },
        // public
        start: function()
        {
    		var btnLeftData = { title: this.lang.get('align-left'), api: 'plugin.alignment.set', args: 'left' };
    		var btnCenterData = { title: this.lang.get('align-center'), api: 'plugin.alignment.set', args: 'center' };
    		var btnRightData = { title: this.lang.get('align-right'), api: 'plugin.alignment.set', args: 'right' };
    		var btnJustifyData = { title: this.lang.get('align-justify'), api: 'plugin.alignment.set', args: 'justify' };

			var $buttonLeft = this.toolbar.addButtonAfter('liststyles', 'align-left', btnLeftData);
			var $buttonCenter = this.toolbar.addButtonAfter('align-left', 'align-center', btnCenterData);
			var $buttonRight = this.toolbar.addButtonAfter('align-center', 'align-right', btnRightData);
			var $buttonJustify = this.toolbar.addButtonAfter('align-right', 'align-justify', btnJustifyData);
			$buttonLeft.setIcon('<i class="fas fa-align-left"></i>');
			$buttonCenter.setIcon('<i class="fas fa-align-center"></i>');
			$buttonRight.setIcon('<i class="fas fa-align-right"></i>');
			$buttonJustify.setIcon('<i class="fas fa-align-justify"></i>');
        },
        set: function(type)
		{
    		if (type === 'left' && this.opts.direction === 'ltr')
    		{
        		return this._remove();
    		}

    		var args = {
        	    style: { 'text-align': type }
    		};

			this.block.toggle(args);
		},

		// private
		_remove: function()
		{
		    this.block.remove({ style: 'text-align' });
		}
    });
})(Redactor);