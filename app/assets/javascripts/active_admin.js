//= require active_admin/base
//= require katex/dist/katex.js
//= require quill.js

                /**
                 * Step1. select local image
                 *
                 */
  function selectLocalImage(editor) {
    const input = document.createElement('input');
    input.setAttribute('type', 'file');
    input.click();

                // Listen upload local image and save to server
    input.onchange = function(){
      const file = input.files[0];

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
    const fd = new FormData();
    fd.append('image', file);

    const xhr = new XMLHttpRequest();
    xhr.open('POST', '/api/images', true);
    xhr.onload = function() {
      if (xhr.status === 200) {
                // this is callback data: url
        const url = JSON.parse(xhr.responseText).url;
        insertToEditor(url, editor);
      }
    };
    xhr.send(fd);
  }
              /**
               * Step3. insert image url to rich editor.
               *
               * @param {string} url
               */

function insertToEditor(url, editor) {
              // push image url to rich editor.
  const range = editor.getSelection();
  editor.insertEmbed(range.index, 'image', url);
}

window.onload = function() {
  var editors = document.getElementById('article_body');
  if (!editors) return;
  var default_options = {
    modules:{
      formula: true,
      toolbar:
                // custom функционал
      [
        ['bold', 'italic', 'underline', 'strike'],
        ['link', 'image'],['formula'],
        [{ 'size': ['small', false, 'large', 'huge'] }],
        [{ 'font': [] }],
        [{ 'script': 'sub'}, { 'script': 'super' }],
        [{ 'direction': 'rtl' }] ,
        [{ 'align': [] }],
        ['blockquote', 'code-block'] ,
        [{ 'list': 'ordered'}, { 'list': 'bullet' }],
        [{ 'indent': '-1'}, { 'indent': '+1' }],
        [{ 'color': [] }, { 'background': [] }],
        ['clean'],
        ['showHtml']
      ]
    },
    theme: 'snow'
  };

  var txtArea = document.createElement('textarea');
  txtArea.style.cssText = "width: 100%;margin: 0px;background: rgb(29, 29, 29);box-sizing: border-box;color: rgb(204, 204, 204);font-size: 15px;outline: none;padding: 20px;line-height: 24px;font-family: Consolas, Menlo, Monaco, &quot;Courier New&quot;, monospace;position: absolute;top: 0;bottom: 0;border: none;display:none"

  var quill_editor = new Quill( editors, default_options );


  var htmlEditor = quill_editor.addContainer('ql-custom')
  htmlEditor.appendChild(txtArea)

  var myEditor = document.querySelector('#article_body')

  quill_editor.on('text-change', (delta, oldDelta, source) => {
    var html = myEditor.children[0].innerHTML
    txtArea.value = html
  })

  var customButton = document.querySelector('.ql-showHtml');
  customButton.addEventListener('click', function() {
    if (txtArea.style.display === '') {
      var html = txtArea.value
      quill_editor.pasteHTML(html)
    }
    txtArea.style.display = txtArea.style.display === 'none' ? '' : 'none'
  });


  quill_editor.getModule('toolbar').addHandler('image', function() {
    selectLocalImage(quill_editor);
  });

  var formtastic = document.querySelector( 'form.formtastic' );

  if( formtastic ) {
    formtastic.onsubmit = function() {
      var input = document.getElementById( 'quill_editor_input' );
      input.value = quill_editor.root.innerHTML;
    };
  }
};

var renderQuickviewPopup = function(data) {
  var result =
    '<div class="quickview-popup">' +
      '<div class="js-close close-popup">Закрыть</div>' + 
      '<div class="main main-description">' +
        '<div class="container">' +

          '<div class="foto-column">' +
            '<div class="foto-column__poster">' +
              '<img src="' + data.image + '"/>' +
           ' </div>' + 
          '</div>' + 

          '<div class="desc-column ql-editor">' +
            '<div class="desc-column__title">' + data.name + '</div>' +
            '<div class="desc-column__text">' + data.post + '</div>' +
          '</div>' +

          '<div class="info-column">' +

            '<div class="info-column__item">Автор: ' + data.author +  '</div>' +
            '<div class="info-column__item info-column__infographic">Инфографика: <a href="' + data.infographic + '">' + data.infographic + '</a></div>' +
            '<div class="info-column__item">Редакция: ' + data.redaction + '</div>' +
            '<div class="info-column__item info-column__infographic">Оригинал: <a href="' + data.origin + '">' + data.origin + '</a></div>' +

          '</div>' +
        '</div>' +
      '</div>' +
    '</div>'

    return result;
  
};

$(document).ready(function() {
  var body = $('.row-body').find('td').text()
  $('.row-body').find('td').html(body)
  $('body').append('<div class="popup-wrapper"></div>');
  $('#tabs').append('<li><a href="/" target="_blank" >Go to the website</a></li>');
  
  setTimeout(function() { $('.ql-toolbar').append('<span class="ql-formats js-quickview">Предпросмотр</span>')}, 0);
  $('.actions ol').append('<li class="action input_action"><button class="js-draft">Save as draft</button></li>');

  $('body').on('click', '.js-quickview', function() {
    $('body').css('overflow-y', 'hidden')
    var data = {};

    data['name'] = $('#article_title').val()
    data['post'] = $('.ql-editor').html()
    data['redaction'] = $('#article_redaction').val()
    data['author'] = $('#article_author').val()
    data['infographic'] = $('#article_infographic').val()
    data['origin'] = $('#article_origin').val()
    data['image'] = $('#article_image_url').val()

    $('.popup-wrapper').append(renderQuickviewPopup(data))
  });

  $('body').on('click', '.js-close', function() {
    $('.popup-wrapper > div').remove()
    $('body').css('overflow-y', 'initial')
  });

  $('body').on('click', '.js-draft', function(e) {
    e.preventDefault()
    $('#article_publish_on_1i').val('2022')
    $('#article_submit_action input').trigger('click')
  });

  
});
