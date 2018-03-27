<template lang="pug">
  div.main-container
    loader-component(v-if="isLoading")
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
      LoaderComponent
    },

    data() {
      return {
        isLoading: true,
        scrollBottom: true
      }
    },

    mounted() {
      if (!this.news) {
        this.$store.dispatch('getActiveNews').then((res) => {
          this.isLoading = false
        });
      }
      window.addEventListener('scroll', this.getNextPage)

      this.isLoading = false
      return;
    },

    computed: {
      ...mapGetters(['news', 'newsMeta'])
    },

    methods: {
      getNextPage() {
        const $container = document.querySelector("#app")
        if ($container.scrollHeight - 200 < (window.pageYOffset + window.innerHeight)) {
          if (this.newsMeta.nextPage && this.scrollBottom) {
            this.scrollBottom = false

            this.$store.dispatch('getActiveNextPageNews', {id: this.newsMeta.nextPage})
            .then(() => this.scrollBottom = true)
          }  
        }
      }
    },

    beforeDestroy () {
      window.removeEventListener('scroll', this.getNextPage)
    },
  }
</script>

<style lang="scss" scoped>

</style>