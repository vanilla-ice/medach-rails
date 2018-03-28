//= require active_admin/base
//= require activeadmin_addons/all
//= require katex/dist/katex.js
//= require chosen-jquery
//= require ./textboxio/textboxio.js

/**
 * Step1. select local image
 *
 */
function selectLocalImage(editor) {
  var input = document.createElement('input');
  input.setAttribute('type', 'file');
  input.click();

  // Listen upload local image and save to server
  input.onchange = function () {
    var file = input.files[0];

    // file type is only image.
    if (/^image\//.test(file.type)) {
      saveToServer(file, editor);
    } else {

      console.warn('You could only upload images.');
    }
  };
}

/**
 * Step2. save to server
 *
 * @param {File} file
 */
function saveToServer(file, editor) {
  return new Promise(function(resolve, reject) {
    var fd = new FormData();
    fd.append('image', file);

    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/api/images', true);
    xhr.onload = function () {
      if (xhr.status === 200) {
        console.log('xhr 200')
        // this is callback data: url
        var url = JSON.parse(xhr.responseText).url;
        // insertToEditor(url, editor);
        var data = {
          url: url,
          editor: editor
        }
        resolve(data)
      }
      else {
        reject('error')
      }
    };
    xhr.send(fd);
  })
}
/**
 * Step3. insert image url to rich editor.
 *
 * @param {string} url
 */

function insertToEditor(url, editor) {
  // push image url to rich editor.
  console.log('insert to editor', editor)

  editor.content.uploadImages(function(e) {
    console.log('e', e)
  });

}

var renderQuickviewPopup = function renderQuickviewPopup(data) {
  console.log(data)
  var result = '<div class="quickview-popup">' + '<div class="js-close close-popup">Закрыть</div>' + '<div class="container">' + '<div class="article__wrapper">' + '<div class="article">' + '<div class="article-title">' + data.name + '</div>' + '<div class="article-info__wrapper">' + '<div class="article-info">' + '<div class="article-info__item">' + '<a href="' + data.origin + '">' + data.origin + '</a>' + '</div>' + '<div class="article-info__item">' + '<div> Автор: </div>' + '<div>' + data.author + '</div>' + '</div>' + '<div class="article-info__item">' + '<div> Перевод: </div>' + '<div>' + data.translate + '</div>' + '</div>' + '<div class="article-info__item">' + '<div> Редакция: </div>' + '<div>' + data.redaction + '</div>' + '</div>' + '<div class="article-info__item">' + '<div> Оформление: </div>' + '<div>' + data.infographic + '</div>' + '</div>' + '</div>' + '</div>' + '<div class="article__content">' + '<img src="' + data.image + '" class="article__cover-image" />' + '<div class="article__content-text">' + data.post + '</div>' + '</div>' + '</div>' + '</div>' +  '</div>' +  '</div>';	
  return result;	
};
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
  return new Promise(function(resolve, reject) {
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
      }
      else {
        reject('error')
      }
    };
    xhr.send(fd);
  })
}

function makeDocumentLink (linkText, documentUrl) {
  return '<p><a download href="' + documentUrl + '">' + linkText + '</a><br /></p>'
}

$(document).ready(function () {
  var editor;

  var config = {
    basePath: '/textboxio',
    images: {
      upload: {
        handler: function(data, success, failture) {
          saveToServer(data.blob(), editor)
            .then(function(data) {
              success(data.url)
            })
            .catch(function(error) {
              failture('uploading error', error)
            })
        }
      }
    },
    paste: {
      style: 'clean',  // Overrides default: 'prompt' for MS Office content
      enableFlashImport: true // Note, true is the default
    },
    ui: {
      toolbar: {
        items: [
          {
            label: 'undo',
            items: ['undo', 'redo']
          },
          {
            label: 'insert',
            id: 'insert',
            items: ['link', 'fileupload', 'table', 'media', 'hr', 'specialchar']
          },
          'style',
          {
            label: 'emphasis',
            items: ['bold', 'italic', 'underline']
          },
          {
            label: 'align',
            items: ['alignment']
          },
          {
            label: 'format',
            items: ['font-menu', 'removeformat']
          },
          {
            label: 'listindent',
            items: ['ul', 'ol', 'indent', 'outdent', 'blockquote']
          },
          {
            label: 'tools',
            items: ['find', 'accessibility', 'fullscreen', 'usersettings']
          },
          {
            label: 'Quickview',
            items: [
              {
                id: 'quickview1',
                text: 'Открыть предпросмотр',

                action: function(e) {
                  
                  $('body').css('overflow-y', 'hidden');	
                  var data = {};	
                
                  data['name'] = $('.js_title').val();	
                  data['post'] = e.content.get()
                  data['redaction'] = $('.js_redaction').val();	
                  data['author'] = $('.js_author').val();	
                  data['infographic'] = $('.js_infographic').val();	
                  data['origin'] = $('.js_original').val();
                  data['translate'] = $('.js_translate').val();
                  data['image'] = $('.file .inline-hints img').attr('src');	
                  $('body').append(renderQuickviewPopup(data));	
                
                  $('body').on('click', '.js-close', function () {	
                    $('.quickview-popup').remove();	
                    $('body').css('overflow-y', 'initial');	
                  });	
                }
              }
            ]
          },
          {
            label: 'FileLoader',
            items: [
              {
                id: 'fileLoaderPdf',
                text: 'Загрузить файл',

                action: function() {
                  selectLocalDocument(function (data) {
                    var ed = textboxio.getActiveEditor()
                    var linkText = prompt('Введите текст ссылки для скачивания', 'Скачать документ') || 'Скачать документ'
                    ed.content.insertHtmlAtCursor(makeDocumentLink(linkText, data.url))
                  })
                }
              }
            ]
          },
        ]
      }
    }
  };

  if (document.getElementById('article_body')) {
    editor = textboxio.replace('#article_body', config)
  }

  $('.chosen-select').chosen({
    allow_single_deselect: true,
    no_results_text: 'No results matched',
    width: '80%'
  })
});
