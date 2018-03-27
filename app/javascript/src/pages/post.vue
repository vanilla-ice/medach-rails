<template lang="pug" >
  div.main-container
    loader-component(v-if="isLoading")
    header-component
    .main
      article-component(v-if="activePost", :postInfo = " {origin: activePost.article.origin, author: activePost.article.author, redaction: activePost.article.redaction, translate: activePost.article.translate, infographic: activePost.article.infographic, tags: activePost.article.tags} ",
        :coverImage="activePost.article.coverImage.url",
        :date="activePost.article.publishOn",
        :title = "activePost.article.title",
        :post="activePost.article.body")
    footer-component

</template>

<script>
import HeaderComponent from '../components/Header.vue'
import LoaderComponent from '../components/Loader.vue'
import ArticleComponent from '../components/ArticleComponent.vue'
import FooterComponent from '../components/Footer.vue'

import { mapGetters } from 'vuex'

export default {
  components: {
    HeaderComponent,
    LoaderComponent,
    ArticleComponent,
    FooterComponent
  },

  data () {
    return {
      isLoading: true
    }
  },

  computed: {
    ...mapGetters(['activePost']),

    image () {
      return [{
        src: this.activePost ? this.activePost.image.url : null,
      }]
    }
  },

  mounted () {
    this.$store.dispatch('getActivePost', {id: this.$route.params.id}).then(() => this.isLoading = false, 300)
  }
}
</script>

<style scoped lang="scss">
  .main {
    padding-top: 20px;
    padding-bottom: 20px;
  }
</style>
