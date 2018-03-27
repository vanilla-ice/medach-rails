<template lang="pug">
    div.main-container
      loader-component(v-if="isLoading")
      header-component
      .main
        article-component(v-if="activeMediaPost", :postInfo = " {origin: activeMediaPost.media.origin, author: activeMediaPost.media.author, redaction: activeMediaPost.media.redaction, translate: activeMediaPost.media.translate, infographic: activeMediaPost.media.infographic, tags: activeMediaPost.media.tags} ",
          :coverImage="activeMediaPost.media.coverImage.url",
          :date="activeMediaPost.media.publishOn",
          :title = "activeMediaPost.media.title",
          :post="activeMediaPost.media.body")
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
      ...mapGetters(['activeMediaPost'])
    },

    mounted() {
      this.$store.dispatch('getActiveMediaPost', {id: this.$route.params.id}).then(() => this.isLoading = false)
    }
  }
</script>

<style lang="scss" scoped>

</style>