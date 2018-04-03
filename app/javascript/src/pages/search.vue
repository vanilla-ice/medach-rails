<template lang="pug" >
  div.main-container
    scroll-top(v-if="scrollButton")
    header-component
    main.main-surgery
      in-order-main(v-if="search" :info="search" :bouncing="!scrollBottom")
</template>

<script>
import HeaderComponent from '../components/Header.vue'
import PostersComponent from '../components/posters/Posters.vue'
import InOrderMain from '../components/in-order/InOrderMain.vue'

import { mapGetters } from 'vuex'

export default {
  components: {
    HeaderComponent,
    PostersComponent,
    InOrderMain,
    ScrollTop: () => import('../components/ScrollTop.vue')
  },

  data () {
    return {
      scrollBottom: true,
      scrollButton: false
    }
  },

  computed: {
    ...mapGetters(['posts', 'search', 'searchMeta'])
  },

  mounted() {
    window.addEventListener('scroll', this.getNextPage)
    window.addEventListener('scroll', this.showScrollToButton)
  },

  methods: {
    currentId() {
      if (this.searchMeta) {
        return this.searchMeta.currentPage
      }
      return 1;
    },

    getNextPage() {
      const $container = document.querySelector("#app")
      if ($container.scrollHeight - 200 < (window.pageYOffset + window.innerHeight)) {
        if (this.searchMeta && this.searchMeta.nextPage && this.scrollBottom) {
          this.scrollBottom = false
          this.$store.dispatch('search', {id: this.searchMeta.nextPage, scroll: true})
          .then(() => this.scrollBottom = true)
        }
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

<style scoped lang="scss">
.main-surgery {
  padding-top: 30px;
  padding-bottom: 20px;
}

.main-surgery__title {
  text-align: center;

  font-family: LucidaGrande-Bold;
  font-size: 36px;
  line-height: 43px;
  max-width: 800px;
  text-overflow: ellipsis;
  overflow: hidden;
  margin: 96px auto 76px auto;
}


.main-surgery .container {
  padding: 0 115px;
}
</style>
