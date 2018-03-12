<template lang="pug" >
  div.main-container
    loader-component(v-if="isLoading")
    header-component
    .main
      article-component(v-if="activePost", :title = "activePost.article.title", :post="activePost.article.body")

    //- main.main.main-description
    //-   .container
    //-     .foto-column
    //-       .foto-column__poster(v-if="image[0].src")
    //-         lightbox#lightbox(:images="image")
    //-       .placeholder(v-if="!image[0].src")
    //-         span
    //-           | MEDACH
    //-     desc-column(v-if="activePost", :post="activePost.body", :name="activePost.title")
    //-     info-column(v-if="activePost", :info="activePost")
</template>

<script>
import HeaderComponent from '../components/Header.vue'
import LoaderComponent from '../components/Loader.vue'
import ArticleComponent from '../components/ArticleComponent.vue'

// import Lightbox from 'vue-simple-lightbox'
// import DescColumn from '../components/DescColumn.vue'
// import InfoColumn from '../components/InfoColumn.vue'
// import descColumnBottom from '../components/DescColumnBottom.vue'


import { mapGetters } from 'vuex'

export default {

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
    this.$store.dispatch('getActivePost', {id: this.$route.params.id}).then(() => setTimeout(() => this.isLoading = false, 300))
  },

  components: {
    HeaderComponent,
    LoaderComponent,
    ArticleComponent
  }
}
</script>

<style scoped lang="scss">
  .main {
    padding-top: 0;
    padding-bottom: 0;
  }
</style>
