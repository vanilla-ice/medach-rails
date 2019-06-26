//= require active_admin/base
//= require activeadmin_addons/all
//= require chosen-jquery
//= require active_material
//= require redactor3
//= require plugins/ru
//= require plugins/ru.plugins
//= require plugins/alignment
//= require plugins/fontcolor
//= require plugins/table
//= require plugins/video
//= require plugins/widget
//= require plugins/fullscreen
//= require plugins/fontfamily
//= require plugins/fontsize
//= require plugins/inlinestyle
//= require plugins/clear
//= require plugins/preview
//= require plugins/add_indent
//= require plugins/add_outdent
//= require plugins/liststyles
//= require plugins/lineheight

/**
 * Step2. save to server
 *
 * @param {File} file
 */

/**
 * Step3. insert image url to rich editor.
 *
 * @param {string} url
 */

function insertToEditor(url, editor) {
  // push image url to rich editor.
  console.log('insert to editor', editor)

  editor.content.uploadImages(function (e) {
    console.log('e', e)
  });
}


/**
 * Step1. select local image
 *
 */
function selectLocalDocument(onSuccess) {
  var input = document.createElement('input');
  input.setAttribute('type', 'file');
  input.click();
  // Listen upload local image and save to server
  input.onchange = function () {
    var file = input.files[0];
    saveDocumentToServer(file)
      .then(onSuccess)
      .catch(console.error);
  };
}

/**
 * Step2. save to server
 *
 * @param {File} file
 */
function saveDocumentToServer(file) {
  return new Promise(function (resolve, reject) {
    var fd = new FormData();
    fd.append('document', file);

    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/api/documents', true);
    xhr.onload = function () {
      if (xhr.status === 200) {
        // this is callback data: url
        var url = JSON.parse(xhr.responseText).url;
        var data = {
          url: url
        }
        resolve(data)
      } else {
        reject('error')
      }
    };
    xhr.send(fd);
  })
}

function saveToServer(file, editor) {
  return new Promise(function (resolve, reject) {
    var fd = new FormData();
    fd.append('image', file);

    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/api/images', true);
    xhr.onload = function () {
      if (xhr.status === 200) {
        console.log('xhr 200')
        // this is callback data: url
        var url = JSON.parse(xhr.responseText).url;
        console.log('save to server url', url)
        // insertToEditor(url, editor);
        var data = {
          url: url,
          editor: editor
        }
        resolve(data)
      } else {
        alert('Ошибка загрузки, попробуйте еще раз')
        reject('error')
      }
    };
    xhr.send(fd);
  })
}

let renderQuickviewPopup = function renderQuickviewPopup(data) {
  let result = '<div class="quickview-popup">' + '<div class="js-close close-popup">Закрыть</div>' + '<div class="container">' + '<div class="article__wrapper">' + '<div class="article">' + '<div class="article-title">' + data.name + '</div>' + '<div class="article-info__wrapper">' + '<div class="article-info">' + '<div class="article-info__item">' + '<a href="' + data.origin + '">' + data.origin + '</a>' + '</div>' + '<div class="article-info__item">' + '<div> Автор: </div>' + '<div>' + data.author + '</div>' + '</div>' + '<div class="article-info__item">' + '<div> Перевод: </div>' + '<div>' + data.translate + '</div>' + '</div>' + '<div class="article-info__item">' + '<div> Редакция: </div>' + '<div>' + data.redaction + '</div>' + '</div>' + '<div class="article-info__item">' + '<div> Оформление: </div>' + '<div>' + data.infographic + '</div>' + '</div>' + '</div>' + '</div>' + '<div class="article__content">' + '<div class="article__content-text">' + data.post + '</div>' + '</div>' + '</div>' + '</div>' + '</div>' + '</div>';
  return result;
};

function makeDocumentLink(linkText, documentUrl) {
  return '<p><a target="_blank" href="' + documentUrl + '">' + linkText + '</a><br /></p>'
}


$(document).ready(function () {
  var editor;

  if (document.getElementById('article_body')) {
    let options = {
      imageUpload: function (formData, files, event, upload) {
        saveToServer(files[0], editor).then(function (data) {
          upload.complete(data.url)
        })
      },
      formatting: ['p', 'blockquote', 'pre'],
      formattingAdd: {
        "h1": {
          title: 'Заголовок 1',
          api: 'module.block.format',
          args: {
              'tag': 'h1',
              'class': 'header-1-custom'
          }
        },
        "h2": {
          title: 'Заголовок 2',
          api: 'module.block.format',
          args: {
              'tag': 'h2',
              'class': 'header-2-custom'
          }
        },
        "h3": {
          title: 'Заголовок 3',
          api: 'module.block.format',
          args: {
              'tag': 'h3',
              'class': 'header-3-custom'
          }
        },
        "h4": {
          title: 'Заголовок 4',
          api: 'module.block.format',
          args: {
              'tag': 'h4',
              'class': 'header-4-custom'
          }
        }
      },
      fileUpload: '/api/documents',
      buttons: ['undo', 'redo', 'format','line', 'bold', 'italic', 'sup', 'sub', 'lists', 'image', 'file', 'link', 'html'],
      imageResizable: true,
      imagePosition: true,
      structure: true,
      breakline: false,
      lang: 'ru',
      pasteLinkTarget: '_blank',
      plugins: ['liststyles', 'add_outdent', 'add_indent', 'alignment', 'fontcolor', 'fontsize', 'lineheight', 'fontfamily', 'table', 'video', 'preview', 'clear_format', 'fullscreen'],
      callbacks: {
        click: function(e)
        {
          // get node
          var node = document.getSelection().anchorNode;
          var el = node.nodeType == 3 ? node.parentNode : node;
          
          // get relevant buttons and values
          var fontsizeBtn = this.toolbar.getButton('fontsize');
          var fontsizeValue = $(el).css('font-size');

          var fontfamilyBtn = this.toolbar.getButton('fontfamily');
          var fontfamilyValue = $(el).css('font-family');

          var lineheightBtn = this.toolbar.getButton('lineheight');
          var lineheightValue = $(el).css('line-height');
          
          var fontcolorBtn = this.toolbar.getButton('fontcolor');
          var fontcolorValue = $(el).css('color');
          var fontcolorBackgroundValue = $(el).css('background-color');

          var alignLeftBtn = this.toolbar.getButton('align-left');
          var alignCenterBtn = this.toolbar.getButton('align-center');
          var alignRightBtn = this.toolbar.getButton('align-right');
          var alignJustifyBtn = this.toolbar.getButton('align-justify');
          var alignValue = $(el).css('text-align');

          fontsizeBtn.setIcon(`<i class="re-icon-fontsize">  ${fontsizeValue}</i>`);
          fontfamilyBtn.setIcon(`<i class="re-icon-fontfamily"> ${fontfamilyValue}</i>`);
          lineheightBtn.setIcon(`<i class="fas fa-arrows-alt-v"> ${lineheightValue}</i>`);
          fontcolorBtn.setIcon(`
            <i class="fas fa-palette"">
              <i class="fas fa-square" style="color: ${fontcolorValue}"></i>
            </i>
            
            <i class="fas fa-fill">
              <i class="fas fa-square" style="color: ${fontcolorBackgroundValue}"></i>
            </i>
          `);
          switch(alignValue) {
            case 'left':
              alignLeftBtn.setActive();
              break;
            case 'center':
              alignCenterBtn.setActive();
              break;
            case 'right':
              alignRightBtn.setActive();
              break;
            case 'justify':
              alignJustifyBtn.setActive();
              break;
          }
        },
        keydown: function(e) 
        {
          // get node
          var node = document.getSelection().anchorNode;
          var el = node.nodeType == 3 ? node.parentNode : node;

          // get relevant buttons
          var fontsizeBtn = this.toolbar.getButton('fontsize');
          var fontsizeValue = $(el).css('font-size');

          var fontfamilyBtn = this.toolbar.getButton('fontfamily');
          var fontfamilyValue = $(el).css('font-family');

          var lineheightBtn = this.toolbar.getButton('lineheight');
          var lineheightValue = $(el).css('line-height');
                    
          var fontcolorBtn = this.toolbar.getButton('fontcolor');
          var fontcolorValue = $(el).css('color');
          var fontcolorBackgroundValue = $(el).css('background-color');

          var alignLeftBtn = this.toolbar.getButton('align-left');
          var alignCenterBtn = this.toolbar.getButton('align-center');
          var alignRightBtn = this.toolbar.getButton('align-right');
          var alignJustifyBtn = this.toolbar.getButton('align-justify');
          var alignValue = $(el).css('text-align');

          fontsizeBtn.setIcon(`<i class="re-icon-fontsize">  ${fontsizeValue}</i>`);
          fontfamilyBtn.setIcon(`<i class="re-icon-fontfamily"> ${fontfamilyValue}</i>`);
          lineheightBtn.setIcon(`<i class="fas fa-arrows-alt-v"> ${lineheightValue}</i>`);
          fontcolorBtn.setIcon(`
            <i class="fas fa-palette"">
              <i class="fas fa-square" style="color: ${fontcolorValue}"></i>
            </i>
            
            <i class="fas fa-fill">
              <i class="fas fa-square" style="color: ${fontcolorBackgroundValue}"></i>
            </i>
          `);
          switch(alignValue) {
            case 'left':
              alignLeftBtn.setActive();
              break;
            case 'center':
              alignCenterBtn.setActive();
              break;
            case 'right':
              alignRightBtn.setActive();
              break;
            case 'justify':
              alignJustifyBtn.setActive();
              break;
          }
        },
        format: function(type, nodes)
        {
          setTimeout(() => {
            window.getSelection().collapseToStart();
            console.log("HELLO");
           }
          , 1);
        }
      }
    };

    $R('#article_body', options);

    window.onbeforeunload = function (e) {
      var dialogText = 'Покинуть страницу?';
      e.returnValue = dialogText;
      return dialogText;
    }

    $('input[name="commit"]').on('click', function () {
      window.onbeforeunload = false
    })

  }

  $('.chosen-select').chosen({
    allow_single_deselect: true,
    no_results_text: 'No results matched',
    width: '80%'
  })

});