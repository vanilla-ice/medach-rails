<template lang="pug">
  div.main-container
    loader-component(v-if="isLoading")
    header-component
    .main
      in-order-main(v-if="news" :info="news")
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
      this.$store.dispatch('getActiveNews').then((res) => {
        setTimeout(() => this.isLoading = false, 300)
      });

      window.addEventListener('scroll', () => {
        const $container = document.querySelector("#app")
        if ($container.scrollHeight === (window.pageYOffset + window.innerHeight)) {
          // this.throttle(this.fetchPosts, 1000);
          this.$store.dispatch('getActiveNextPageNews').then(res => console.log(res))
        }
      })
    },

    computed: {
      ...mapGetters(['news'])
    }
  }
</script>

<style lang="scss" scoped>

</style>