<template lang="pug">
  div.main-container
    loader-component(v-if="isLoading")
    header-component
    .main
      in-order-main(v-if="activeArticles" :info="activeArticles" :bouncing="!scrollBottom")
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
        isLoading: true,
        scrollBottom: true
      }
    },

    mounted() {
      this.$store.dispatch('getActiveArticles', {id: this.currentId(), scroll: false}).then((res) => {
        this.isLoading = false
      });

      window.addEventListener('scroll', this.getNextPage)
    },

    computed: {
      ...mapGetters(['activeArticles', 'articlesMeta'])
    },

    methods: {
      currentId() {
        if (this.articlesMeta) {
          return this.articlesMeta.currentPage
        }
        return 1;
      },

      getNextPage() {
        const $container = document.querySelector("#app")
        if ($container.scrollHeight - 200 < (window.pageYOffset + window.innerHeight)) {
          if (this.articlesMeta.nextPage && this.scrollBottom) {
            this.scrollBottom = false

            this.$store.dispatch('getActiveArticles', {id: this.articlesMeta.nextPage, scroll: true})
            .then(() => this.scrollBottom = true)
          }
        }
      }
    },

    beforeDestroy (to, from, next) {
      window.removeEventListener('scroll', this.getNextPage)
    }
  }
</script>

<style lang="scss" scoped>

</style>