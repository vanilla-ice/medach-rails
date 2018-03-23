<template lang="pug" >
  div.main-container
    header-component
    main.main-surgery
      in-order-main(v-if="search" :info="search")
</template>

<script>
import HeaderComponent from '../components/Header.vue'
import PostersComponent from '../components/posters/Posters.vue'
import InOrderMain from '../components/in-order/InOrderMain.vue'

import { mapGetters } from 'vuex'

export default {
  data () {
    return {
      scrollBottom: false
    }
  },

  computed: {
    ...mapGetters(['posts', 'search', 'searchMeta'])
  },

  components: {
    HeaderComponent,
    PostersComponent,
    InOrderMain
  },

  mounted() {
    window.addEventListener('scroll', this.getNextPage)
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
      if ($container.scrollHeight === (window.pageYOffset + window.innerHeight)) {
        if (this.searchMeta.nextPage) {
          this.$store.dispatch('search', {id: this.searchMeta.nextPage, scroll: true})
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

@media (max-width: 1024px) {
  .main-container {
    margin-top: 115px;
  }
}
</style>
