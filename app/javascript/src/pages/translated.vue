<template lang="pug">
  div.main-container
    loader-component(v-if="isLoading")
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
      LoaderComponent
    },

    data() {
      return {
        isLoading: true
      }
    },

    mounted() {
      this.$store.dispatch('getActiveTranslatedArticles', {id: this.currentId(), scroll: false}).then((res) => {
        this.isLoading = false
      });

      window.addEventListener('scroll', this.getNextPage)
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
      }
    },

    beforeDestroy (to, from, next) {
      window.removeEventListener('scroll', this.getNextPage)
      this.$store.dispatch('removeMeta')
    }
  }
</script>

<style lang="scss" scoped>

</style>