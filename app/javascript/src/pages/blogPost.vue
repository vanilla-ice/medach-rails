<template lang="pug">
    div.main-container
      loader-component(v-if="isLoading")
      header-component
      .main
        article-component(v-if="activeBlogPost", :postInfo = " {origin: activeBlogPost.blog.origin, author: activeBlogPost.blog.author, redaction: activeBlogPost.blog.redaction, translate: activeBlogPost.blog.translate, infographic: activeBlogPost.blog.infographic, tags: activeBlogPost.blog.tags} ",
          :coverImage="activeBlogPost.blog.coverImage.url",
          :date="activeBlogPost.blog.publishOn",
          :title = "activeBlogPost.blog.title",
          :post="activeBlogPost.blog.body")
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
      ...mapGetters(['activeBlogPost'])
    },

    mounted() {
      this.$store.dispatch('getActiveBlogPost', {id: this.$route.params.id}).then(() => this.isLoading = false)
    }
  }
</script>

<style lang="scss" scoped>

</style>