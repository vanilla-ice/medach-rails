<template lang="pug">
    div.main-container
      loader-component(v-if="isLoading")
      header-component
      .main
        article-component(v-if="activeNewsPost", :postInfo = " {origin: activeNewsPost.news.origin, author: activeNewsPost.news.author, redaction: activeNewsPost.news.redaction, translate: activeNewsPost.news.translate, infographic: activeNewsPost.news.infographic, tags: activeNewsPost.news.tags} ",
          :coverImage="activeNewsPost.news.coverImage.url",
          :date="activeNewsPost.news.publishOn",
          :title = "activeNewsPost.news.title",
          :post="activeNewsPost.news.body")
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
      ...mapGetters(['activeNewsPost'])
    },

    mounted() {
      this.$store.dispatch('getActiveNewsPost', {id: this.$route.params.id}).then(() => this.isLoading = false)
    }
  }
</script>

<style lang="scss" scoped>

</style>