import Quill from 'quill';

window.Quill = Quill;

import {
  ImageResize
} from 'quill-image-resize-module';
import {
  ImageDrop
} from 'quill-image-drop-module';
// import BlotFormatter from 'quill-blot-formatter';
// import { urlEmbed, urlEmbedModule } from 'quill-url-embeds'
// import MagicUrl from 'quill-magic-url';

// Quill.register('modules/blotFormatter', BlotFormatter);
Quill.register('modules/imageDrop', ImageDrop);
Quill.register('modules/imageResize', ImageResize);
// Quill.register({
//   'blots/urlEmbed': urlEmbed,
//   'modules/urlEmbeds': urlEmbedModule({
//     metaApi
//   })
// });
// Quill.register('modules/magicUrl', MagicUrl);



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

$(document).ready(function () {
  if (document.getElementById('article_body')) {

    let toolbarOptions = [
      [{
        size: ['small', false, 'large', 'huge']
      }],
      ['bold', 'italic', 'underline', 'strike'],
      ['blockquote'],
      [{
        'header': 1
      }, {
        'header': 2
      }],
      ['link', 'image', 'video', 'formula'],
      // ['code'],
      [{
        'list': 'ordered'
      }, {
        'list': 'bullet'
      }],
      [{
        'color': []
      }, {
        'background': []
      }],
      [{
        'align': []
      }],
      ['caption'],
      [{
        'script': 'sub'
      }, {
        'script': 'super'
      }],
      ['clean'],
    ];

    let Block = Quill.import('blots/block');

    class imgCaption extends Block {}

    imgCaption.blotName = 'caption';
    imgCaption.tagName = 'caption';

    Quill.register(imgCaption, true);

    // Quill.register({
    //   'formats/caption': imgCaption
    // });

    var quill = new Quill('#article_body', {
      theme: 'bubble',
      bounds: '#article_body',
      toolbar: '#toolbar',
      modules: {
        toolbar: {
          container: toolbarOptions,
          handlers: {
            'image': function () {
              const input = document.createElement('input');
              input.setAttribute('type', 'file');
              input.setAttribute('accept', 'image/*');
              input.click();
              input.onchange = async function () {
                const file = input.files[0];
                const data = await saveToServer(file, editor);
                let range = quill.getSelection();


                quill.insertEmbed(range.index, 'image', data.url);
                const cObj = {
                  text: 'Описание',
                  value: 'value'
                };
                quill.insertEmbed(range.index + 1, 'caption', cObj);
                // range = quill.getSelection();
                // quill.insertText(range.index, 'Quill');
              }
            }
          }
        },
        imageDrop: false,
        formula: true,
        ImageResize: {
          modules: ['Resize', 'DisplaySize', 'Toolbar']
        }
      }
    });

    setTimeout(_ => {
      quill.setSelection(0, 0);
    }, 500);

    var txtArea = document.createElement('textarea');
    txtArea.style.cssText = "width: 100%;margin: 0px;background: rgb(29, 29, 29);box-sizing: border-box;color: rgb(204, 204, 204);font-size: 15px;outline: none;padding: 20px;line-height: 24px;font-family: Consolas, Menlo, Monaco, &quot;Courier New&quot;, monospace;position: absolute;top: 0;bottom: 0;border: none;display:none"

    var htmlEditor = quill.addContainer('ql-custom')
    htmlEditor.appendChild(txtArea)

    var myEditor = document.querySelector('#article_body')
    quill.on('text-change', (delta, oldDelta, source) => {
      var html = myEditor.children[0].innerHTML
      txtArea.value = html
    })

    var customButton = document.querySelector('.ql-showHtml');
    customButton.addEventListener('click', function () {
      if (txtArea.style.display === '') {
        var html = txtArea.value

        $("#hidden").val(html)
        // quill.clipboard.dangerouslyPasteHTML(html);
        $(".ql-editor").html(html);
        quill.update();
      }
      txtArea.style.display = txtArea.style.display === 'none' ? '' : 'none'
    });

    // $(document).on('contextmenu', '#article_body', function(e) {
    // 	e.preventDefault();
    // 	quill.theme.tooltip.edit();
    // 	quill.theme.tooltip.show();
    // 	return false;
    // });

    $('.js-quickview').on('click', function (e) {

      $('body').css('overflow-y', 'hidden');
      var data = {};

      data['name'] = $('.js_title').val();
      data['post'] = $(".ql-editor").html();
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
    });

    window.onbeforeunload = function (e) {
      var dialogText = 'Покинуть страницу?';
      e.returnValue = dialogText;
      return dialogText;
    }

    $('input[name="commit"]').on('click', function () {
      window.onbeforeunload = false
    })

  }

  $(".ql-editor").html($("#hidden").val());

  quill.on('editor-change', function (eventName, ...args) {
    $("#hidden").val($(".ql-editor").html());
  });

  $("#new_longread_article").on("submit", function () {
    $("#hidden").val($(".ql-editor").html());
  });

});