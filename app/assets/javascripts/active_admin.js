//= require active_admin/base
<<<<<<< Updated upstream
//= require activeadmin/quill_editor/quill
//= require activeadmin/quill_editor_input


// var IMGUR_CLIENT_ID = 'bcab3ce060640ba';
// var IMGUR_API_URL = 'https://api.imgur.com/3/image';

// function imageHandler(image, callback) {
=======
//= require quill/dist/quill.js


// var IMGUR_CLIENT_ID = 'bcab3ce060640ba';
// var API_URL = '/api/images';

// var imageHandler = function(image, callback) {

>>>>>>> Stashed changes
//   var data = new FormData();
//   data.append('image', image);

//   var xhr = new XMLHttpRequest();
<<<<<<< Updated upstream
//   xhr.open('POST', IMGUR_API_URL, true);
=======
//   xhr.open('POST', API_URL, true);
>>>>>>> Stashed changes
//   // xhr.setRequestHeader('Authorization', 'Client-ID ' + IMGUR_CLIENT_ID);
//   xhr.onreadystatechange = function() {
//     if (xhr.readyState === 4) {
//       var response = JSON.parse(xhr.responseText);
//       if (response.status === 200 && response.success) {
//         callback(response.data.link);
//       } else {
//         var reader = new FileReader();
//         reader.onload = function(e) {
//           callback(e.target.result);
//         };
//         reader.readAsDataURL(image);
//       }
//     }
//   }
//   xhr.send(data);
// }
<<<<<<< Updated upstream

// // document.addEventListener("DOMContentLoaded", function() {
// //   var quill = new Quill('#article_body', {
// //     modules: {
// //       toolbar: [['bold', 'italic', 'underline', 'strike'],
// //       ['link', 'image'],
// //       [{ 'size': ['small', false, 'large', 'huge'] }],
// //       [{ 'script': 'sub'}, { 'script': 'super' }],
// //       [{ 'direction': 'rtl' }] ,
// //       ['blockquote', 'code-block'] ,
// //       [{ 'list': 'ordered'}, { 'list': 'bullet' }],
// //       [{ 'indent': '-1'}, { 'indent': '+1' }],
// //       ['clean']]

//     },
//     theme: 'snow',
//     imageHandler: imageHandler
//   });
// });

=======



document.addEventListener("DOMContentLoaded", function() {
  var quill = new Quill('#article_body', {
    modules: {
      toolbar:
      [
        ['bold', 'italic', 'underline', 'strike'],
        ['link', 'image'],
        [{ 'size': ['small', false, 'large', 'huge'] }],
        [{ 'script': 'sub'}, { 'script': 'super' }],
        [{ 'direction': 'rtl' }] ,
        ['blockquote', 'code-block'] ,
        [{ 'list': 'ordered'}, { 'list': 'bullet' }],
        [{ 'indent': '-1'}, { 'indent': '+1' }],
        [{ 'color': [] }, { 'background': [] }],
        ['clean']
      ],
    },
    theme: 'snow'
  });

//   var toolbar = quill.getModule('toolbar');
//   toolbar.addHandler('image', imageHandler);
});
>>>>>>> Stashed changes
