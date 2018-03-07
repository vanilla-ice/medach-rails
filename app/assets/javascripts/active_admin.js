//= require active_admin/base
//= require katex/dist/katex.js
//= require quill.js
//= require chosen-jquery

var _typeof = typeof Symbol === "function" && typeof Symbol.iterator === "symbol" ? function (obj) { return typeof obj; } : function (obj) { return obj && typeof Symbol === "function" && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; };

var _createClass = function () {
  function defineProperties(target, props) {
    for (var i = 0; i < props.length; i++) {
      var descriptor = props[i];descriptor.enumerable = descriptor.enumerable || false;descriptor.configurable = true;if ("value" in descriptor) descriptor.writable = true;Object.defineProperty(target, descriptor.key, descriptor);
    }
  }return function (Constructor, protoProps, staticProps) {
    if (protoProps) defineProperties(Constructor.prototype, protoProps);if (staticProps) defineProperties(Constructor, staticProps);return Constructor;
  };
}();

var _get = function get(object, property, receiver) {
  if (object === null) object = Function.prototype;var desc = Object.getOwnPropertyDescriptor(object, property);if (desc === undefined) {
    var parent = Object.getPrototypeOf(object);if (parent === null) {
      return undefined;
    } else {
      return get(parent, property, receiver);
    }
  } else if ("value" in desc) {
    return desc.value;
  } else {
    var getter = desc.get;if (getter === undefined) {
      return undefined;
    }return getter.call(receiver);
  }
};

function _classCallCheck(instance, Constructor) {
  if (!(instance instanceof Constructor)) {
    throw new TypeError("Cannot call a class as a function");
  }
}

function _possibleConstructorReturn(self, call) {
  if (!self) {
    throw new ReferenceError("this hasn't been initialised - super() hasn't been called");
  }return call && ((typeof call === "undefined" ? "undefined" : _typeof(call)) === "object" || typeof call === "function") ? call : self;
}

function _inherits(subClass, superClass) {
  if (typeof superClass !== "function" && superClass !== null) {
    throw new TypeError("Super expression must either be null or a function, not " + (typeof superClass === "undefined" ? "undefined" : _typeof(superClass)));
  }subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } });if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass;
}


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
  var fd = new FormData();
  fd.append('image', file);

  var xhr = new XMLHttpRequest();
  xhr.open('POST', '/api/images', true);
  xhr.onload = function () {
    if (xhr.status === 200) {
      // this is callback data: url
      var url = JSON.parse(xhr.responseText).url;
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
  var range = editor.getSelection();
  editor.insertEmbed(range.index, 'image', url);
}

window.onload = function () {
  var editors = document.getElementById('article_body');
  if (!editors) return;
  var default_options = {
    modules: {
      formula: true,
      toolbar:
      // custom функционал
      [['bold', 'italic', 'underline', 'strike'], ['link', 'image'], ['formula'], [{ 'size': ['small', false, 'large', 'huge'] }], [{ 'font': [] }], [{ 'script': 'sub' }, { 'script': 'super' }], [{ 'direction': 'rtl' }], [{ 'align': [] }], ['blockquote', 'code-block'], [{ 'list': 'ordered' }, { 'list': 'bullet' }], [{ 'indent': '-1' }, { 'indent': '+1' }], [{ 'color': [] }, { 'background': [] }], ['clean'], ['titleImg'], ['contentImg']]
    },
    theme: 'snow'
  };

  var Embed = Quill.import('blots/inline');

  var TitleImg = function (_Embed) {
    _inherits(TitleImg, _Embed);

    function TitleImg() {
      _classCallCheck(this, TitleImg);

      return _possibleConstructorReturn(this, (TitleImg.__proto__ || Object.getPrototypeOf(TitleImg)).apply(this, arguments));
    }

    _createClass(TitleImg, null, [{
      key: 'create',
      value: function create(value) {
        var node = _get(TitleImg.__proto__ || Object.getPrototypeOf(TitleImg), 'create', this).call(this);
        return node;
      }
    }]);

    return TitleImg;
  }(Embed);

  TitleImg.blotName = 'titleImg';
  TitleImg.className = 'quill__title-img';
  TitleImg.tagName = 'p';

  var ContentImg = function (_Embed2) {
    _inherits(ContentImg, _Embed2);

    function ContentImg() {
      _classCallCheck(this, ContentImg);

      return _possibleConstructorReturn(this, (ContentImg.__proto__ || Object.getPrototypeOf(ContentImg)).apply(this, arguments));
    }

    _createClass(ContentImg, null, [{
      key: 'create',
      value: function create(value) {
        var node = _get(ContentImg.__proto__ || Object.getPrototypeOf(ContentImg), 'create', this).call(this);
        return node;
      }
    }]);

    return ContentImg;
  }(Embed);

  ContentImg.blotName = 'contentImg';
  ContentImg.className = 'quill__title-content';
  ContentImg.tagName = 'p';

  var addBlockHandler = function addBlockHandler() {
    // get the position of the cursor
    var range = quill_editor.getSelection();
    if (range) {
      quill_editor.insertEmbed(range.index, "div", " ");
    }
  };

  Quill.register({
    'formats/titleImg': TitleImg,
    'formats/contentImg': ContentImg
  });

  var quill_editor = new Quill(editors, default_options);

  var toolbar = quill_editor.getModule('toolbar');
  toolbar.addHandler(addBlockHandler);

  setTimeout(function () {
    $('.ql-toolbar').append('<span class="ql-formats js-quickview">Предпросмотр</span>');
  }, 0);

  

  quill_editor.getModule('toolbar').addHandler('image', function () {
    selectLocalImage(quill_editor);
  });

  var formtastic = document.querySelector('form.formtastic');

  if (formtastic) {
    formtastic.onsubmit = function () {
      var input = document.getElementById('quill_editor_input');
      input.value = quill_editor.root.innerHTML;
    };
  }
};

var renderQuickviewPopup = function renderQuickviewPopup(data) {
  var result = '<div class="quickview-popup">' + '<div class="js-close close-popup">Закрыть</div>' + '<div class="main main-description">' + '<div class="container">' + '<div class="foto-column">' + '<div class="foto-column__poster">' + '<img src="' + data.image + '"/>' + ' </div>' + '</div>' + '<div class="desc-column ql-editor">' + '<div class="desc-column__title">' + data.name + '</div>' + '<div class="desc-column__text">' + data.post + '</div>' + '</div>' + '<div class="info-column">' + '<div class="info-column__item">Автор: ' + data.author + '</div>' + '<div class="info-column__item info-column__infographic">Инфографика: <a href="' + data.infographic + '">' + data.infographic + '</a></div>' + '<div class="info-column__item">Редакция: ' + data.redaction + '</div>' + '<div class="info-column__item info-column__infographic">Оригинал: <a href="' + data.origin + '">' + data.origin + '</a></div>' + '</div>' + '</div>' + '</div>' + '</div>';

  return result;
};

$(document).ready(function () {

  $('.chosen-select').chosen({
    allow_single_deselect: true,
    no_results_text: 'No results matched',
    width: '80%'
  })

  var body = $('.row-body').find('td').text();
  $('.row-body').find('td').html(body);
  $('body').append('<div class="popup-wrapper"></div>');
  $('#tabs').append('<li><a href="/" target="_blank" >Go to the website</a></li>');

  $('.actions ol').append('<li class="action input_action"><button class="js-draft">Save as draft</button></li>');

  $('.ql-toolbar').append('<span class="ql-formats js-quickview">Предпросмотр</span>');
  $('body').on('click', '.js-quickview', function () {
    $('body').css('overflow-y', 'hidden');
    var data = {};

    data['name'] = $('#article_title').val();
    data['post'] = $('.ql-editor').html();
    data['redaction'] = $('#article_redaction').val();
    data['author'] = $('#article_author').val();
    data['infographic'] = $('#article_infographic').val();
    data['origin'] = $('#article_origin').val();
    data['image'] = $('#article_image_url').val();

    $('.popup-wrapper').append(renderQuickviewPopup(data));
  });

  $('body').on('click', '.js-close', function () {
    $('.popup-wrapper > div').remove();
    $('body').css('overflow-y', 'initial');
  });

  $('body').on('click', '.js-draft', function (e) {
    e.preventDefault();
    $('#article_publish_on_1i').val('2022');
    $('#article_submit_action input').trigger('click');
  });
});