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

</style>

