<template lang="pug">
  div.main-container
    loader-component(v-if="isLoading")
    header-component
    .main
      in-order-main(v-if="media" :info="media" :bouncing="!scrollBottom")
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
      this.$store.dispatch('getActiveMedia', {id: this.currentId(), scroll: false}).then((res) => {
        this.isLoading = false
      });

      window.addEventListener('scroll', this.getNextPage)
    },

    computed: {
      ...mapGetters(['media', 'mediaMeta'])
    },

    methods: {
      currentId() {
        if (this.mediaMeta) {
          return this.mediaMeta.currentPage
        }
        return 1;
      },

      getNextPage() {
        const $container = document.querySelector("#app")
        if ($container.scrollHeight - 200 < (window.pageYOffset + window.innerHeight)) {
          
          if (this.mediaMeta.nextPage && this.scrollBottom) {
            this.scrollBottom = false;

            this.$store.dispatch('getActiveMedia', {id: this.mediaMeta.nextPage, scroll: true})
            .then(() => this.scrollBottom = true)
          }
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