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
    input.onchange = () => {
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
    xhr.onload = () => {
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
  if (!editors) return
  var default_options = {
    modules:{
      formula: true,
      toolbar:
                // custom функционал
      [
        ['bold', 'italic', 'underline', 'strike'],
        ['image'],['formula'],
        [{ 'size': ['small', false, 'large', 'huge'] }],
        [{ 'font': [] }],
        [{ 'script': 'sub'}, { 'script': 'super' }],
        [{ 'direction': 'rtl' }] ,
        [{ 'align': [] }],
        ['blockquote', 'code-block'] ,
        [{ 'list': 'ordered'}, { 'list': 'bullet' }],
        [{ 'indent': '-1'}, { 'indent': '+1' }],
        [{ 'color': [] }, { 'background': [] }],
        ['clean']
      ]
    },
    placeholder: '',
    theme: 'snow'
  };


      var quill_editor = new Quill( editors, default_options );

      quill_editor.getModule('toolbar').addHandler('image', () => {
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


