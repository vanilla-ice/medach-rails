//= require active_admin/base
//= require activeadmin_addons/all
//= require katex/dist/katex.js
//= require quill.js
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
          url,
          editor
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

  // editor.insertEmbed(range.index, 'image', url);
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
