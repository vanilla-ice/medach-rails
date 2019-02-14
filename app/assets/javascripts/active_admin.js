//= require active_admin/base
//= require activeadmin_addons/all
//= require katex/dist/katex.js
//= require chosen-jquery
//= require active_material
//= require redactor3
//= require ru
//= require ru.plugins
//= require alignment.min
//= require fontcolor.min
//= require table.min
//= require video.min
//= require widget.min
//= require fullscreen.min
//= require clear
//= require preview
//= require inlinestyle.min

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

  var config = {
    basePath: '/textboxio',
    css: {
      stylesheets: ['/css/editor.css'] // an array of CSS file URLs

    },
    paste: {
      style: 'clean'
    },
    images: {
      upload: {
        handler: function (data, success, failture) {
          var blob = data.blob()
          var filename = data.filename()

          var resultImage = new File([blob], filename)

          saveToServer(resultImage, editor)
            .then(function (data) {
              success(data.url)
            })
            .catch(function (error) {
              failture('uploading error', error)
            })
        }
      }
    },
    ui: {
      fonts: ['Helvetica', 'Arial', 'Times New Roman', '"PT Serif", sans-serif'],
      toolbar: {
        items: [{
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
            label: 'Imagebox',
            items: [{
                id: 'ImageBox-title',
                text: 'Imagebox header',
                icon: '/images/header.png',
                action: function () {
                  var ed = textboxio.getActiveEditor();

                  ed.content.insertHtmlAtCursor('<p><div class="editor_img-title">Title</div></p><br />');
                }
              },
              {
                id: 'ImageBox-content',
                text: 'Imagebox content',
                icon: '/images/content.png',
                action: function () {
                  var ed = textboxio.getActiveEditor();

                  ed.content.insertHtmlAtCursor('<p><div class="editor_img-content">Content</div></p><br />');
                }
              }
            ]
          },
          {
            label: 'Quickview',
            items: [{
              id: 'quickview1',
              text: 'Открыть предпросмотр',
              icon: '/images/preview.png',

              action: function (e) {

                $('body').css('overflow-y', 'hidden');
                var data = {};

                data['name'] = $('.js_title').val();
                data['post'] = e.content.get()
                data['redaction'] = $('.js_redaction').val();
                data['author'] = $('.js_author').val();
                data['infographic'] = $('.js_infographic').val();
                data['origin'] = $('.js_original').val();
                data['translate'] = $('.js_translate').val();
                data['tags'] = $('.js_tags').val();
                data['image'] = $('.file .inline-hints img').attr('src');
                $('body').append(renderQuickviewPopup(data));

                $('body').on('click', '.js-close', function () {
                  $('.quickview-popup').remove();
                  $('body').css('overflow-y', 'initial');
                });
              }
            }]
          },
          {
            label: 'set backup',
            items: [{
              id: 'setBackupData',
              text: 'Сделать бекап',
              icon: '/images/save-icon.svg',

              action: function (e) {
                localStorage.setItem('postData', e.content.get())
              }
            }]
          },
          {
            label: 'get backup',
            items: [{
              id: 'getBackupData',
              text: 'Использовать последний бекап',
              icon: '/images/preview.png',

              action: function (e) {
                var data = localStorage.getItem('postData');
                e.content.set(data)
              }
            }]
          },
          {
            label: 'FileLoader',
            items: [{
              id: 'fileLoaderPdf',
              text: 'Загрузить файл',
              icon: '/images/upload-file.svg',

              action: function () {
                selectLocalDocument(function (data) {
                  var ed = textboxio.getActiveEditor()
                  var linkText = prompt('Введите текст ссылки для скачивания', 'Скачать документ') || 'Скачать документ'
                  ed.content.insertHtmlAtCursor(makeDocumentLink(linkText, data.url))
                })
              }
            }]
          },
        ]
      }
    }
  };

  if (document.getElementById('article_body')) {
    let options = {
      imageUpload: function (formData, files, event, upload) {
        saveToServer(files[0], editor).then(function (data) {
          upload.complete(data.url)
        })
      },
      fileUpload: '/api/documents',
      buttons: ['undo', 'redo', 'format', 'bold', 'italic', 'lists', 'image', 'file', 'link', 'html'],
      imageResizable: true,
      imagePosition: true,
      focus: true,
      lang: 'ru',
      // air: true,
      pasteLinkTarget: '_blank',
      toolbarFixedTopOffset: 40,
      plugins: ['alignment', 'fontcolor', 'table', 'video', 'preview', 'clear_format', 'inlinestyle']
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