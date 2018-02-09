<template lang="pug">
  .desc-column.ql-editor
    .desc-column__title {{ name }}
    .desc-column__text(v-html="post" ref="postData")

    .preview(v-if="currentImg")
      .opacity(@click="close")
      .christ(@click="close") +
      img(:src="currentImg")
      
</template>

<script>
import Lightbox from 'vue-simple-lightbox'

export default {
  props: ['post', 'name'],

  data() {
    return {
      currentImg: null
    }
  },

  mounted() {
    const images = Array.from(this.$refs.postData.querySelectorAll('img'))
    images.map(img => {
      img.addEventListener('click', () => this.renderPreviewImage(img))
    })
  },

  methods: {
    renderPreviewImage(image) {
      this.currentImg = image.getAttribute('src')
    },

    close() {
      this.currentImg = null;
    }
  },

  components: {
    Lightbox
  }
}
</script>

<style lang="scss">
@import '../assets/quill.core.css';

.desc-column {
  max-width: 739px;
  width: 100%;

  p {
    font-family: sans-serif;
    color: #515666;
    line-height: 1.58;
    font-size: 18px;
  }

  .ql-font-serif {
    font-size: 'Times New Roman';
  }

  .desc-column__title {
    font-family: LucidaGrande-Bold;
    font-size: 36px;
    line-height: 43px;
    margin-bottom: 46px;
  }

  &__text a {
    text-decoration: underline
  }

  img {
    display: block;
    max-width: 100%;
    margin: 15px auto;
    cursor: pointer;
    height: auto;
  }

  blockquote {
    padding-left: 16px;
    border-left: 3px solid #ccc;
    color: #666;
    margin: 15px 0;
  }
}

.preview {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100vh;
  background: rgba(255, 255, 255, 0.7);

  z-index: 3000;

  img {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 5;
  }
}

.opacity {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 2;
}

.christ {
  position: absolute;
  top: 8px;
  right: 40px;
  font-size: 40px;
  font-family: sans-serif;
  transform: rotate(45deg);
  cursor: pointer;
  z-index: 10;
}

@media (max-width: 1024px) {
  .desc-column {
    max-width: initial;
    padding: 0;
  }
}

</style>

