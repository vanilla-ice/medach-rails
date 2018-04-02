<template lang="pug">
  div.main-container
    loader-component(v-if="isLoading")
    scroll-top(v-if="scrollButton")
    header-component
    .main
      in-order-main(v-if="translatedArticles" :info="translatedArticles")
</template>

<script>
import HeaderComponent from '../components/Header.vue'
import InOrderMain from '../components/in-order/InOrderMain.vue'

import LoaderComponent from '../components/Loader.vue'
import { mapGetters } from 'vuex'

  export default {
    components: {
      HeaderComponent,
      InOrderMain,
      LoaderComponent,
      ScrollTop: () => import('../components/ScrollTop.vue')
    },

    data() {
      return {
        isLoading: true,
        scrollButton: false
      }
    },

    mounted() {
      this.$store.dispatch('getActiveTranslatedArticles', {id: this.currentId(), scroll: false}).then((res) => {
        this.isLoading = false
      });

      window.addEventListener('scroll', this.getNextPage)
      window.addEventListener('scroll', this.showScrollToButton)
    },

    computed: {
      ...mapGetters(['translatedArticles', 'translatedMeta'])
    },

    methods: {
      currentId() {
        if (this.translatedMeta) {
          return this.translatedMeta.currentPage
        }
        return 1;
      },

      getNextPage() {
        const $container = document.querySelector("#app")
        if ($container.scrollHeight === (window.pageYOffset + window.innerHeight)) {
          
          if (this.translatedMeta.nextPage) this.$store.dispatch('getActiveTranslatedArticles', {id: this.translatedMeta.nextPage, scroll: true})
        }
      },

      showScrollToButton() {
        if (window.pageYOffset) return this.scrollButton = true
        return this.scrollButton = false
      }
    },

    beforeDestroy (to, from, next) {
      window.removeEventListener('scroll', this.getNextPage)
      window.removeEventListener('scroll', this.showScrollToButton)
      this.$store.dispatch('removeMeta')
    }
  }
</script>

<style lang="scss" scoped>

</style>