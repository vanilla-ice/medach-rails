<template lang="pug">
  div.main-container
    loader-component(v-if="isLoading")
    scroll-top(v-if="scrollButton")
    header-component
    .main
      in-order-main(v-if="news" :info="news" :bouncing="!scrollBottom")
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
        scrollBottom: true,
        scrollButton: false
      }
    },

    mounted() {
        this.$store.dispatch('getActiveNews').then((res) => {
          this.isLoading = false
        });
   

      window.addEventListener('scroll', this.getNextPage)
      window.addEventListener('scroll', this.showScrollToButton)
    },

    computed: {
      ...mapGetters(['news', 'newsMeta'])
    },

    methods: {
      getNextPage() {
        const $container = document.querySelector("#app")
        if ($container.scrollHeight - 200 < (window.pageYOffset + window.innerHeight)) {
          if (this.newsMeta && this.newsMeta.nextPage && this.scrollBottom) {
            this.scrollBottom = false

            this.$store.dispatch('getActiveNextPageNews', {id: this.newsMeta.nextPage})
            .then(() => this.scrollBottom = true)
          }  
        }
      },

      showScrollToButton() {
        if (window.pageYOffset) return this.scrollButton = true
        return this.scrollButton = false
      }
    },

    beforeDestroy () {
      window.removeEventListener('scroll', this.getNextPage)
      window.removeEventListener('scroll', this.showScrollToButton)
    },
  }
</script>

<style lang="scss" scoped>

</style>