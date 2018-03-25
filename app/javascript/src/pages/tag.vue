<template lang="pug" >
  div
    loader-component(v-if="isLoading")
    header-component
    main.main-surgery
      in-order-main(v-if="search" :info="search")
</template>
<script>
import HeaderComponent from '../components/Header.vue'
import PostersComponent from '../components/posters/Posters.vue'
import LoaderComponent from '../components/Loader.vue'
import InOrderMain from '../components/in-order/InOrderMain.vue'

import { mapGetters } from 'vuex'

export default {
  components: {
    HeaderComponent,
    PostersComponent,
    LoaderComponent,
    InOrderMain
  },

  data () {
    return {
      isLoading: true, 
    }
  },

  created () {
    const payload = {
      query: this.$route.params.id,
      id: this.currentId(),
      scroll: false
    }
    this.$store.dispatch('search', payload).then(res => this.isLoading = false, 300)
  },

  beforeRouteUpdate (to, from, next) {
    this.isLoading = true
    this.$store.dispatch('removeMeta')
    const payload = {
      query: to.params.id,
      id: this.currentId(),
      scroll: false
    }

    this.$store.dispatch('search', payload).then(res => this.isLoading = false, 300)
    next()
  },

  mounted () {
    window.addEventListener('scroll', this.getNextPage)
  },

  computed: {
    ...mapGetters(['search', 'searchMeta']),

    getTagName () {
      return '#' + this.$route.params.id.toUpperCase()
    }
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
    padding-bottom: 30px;
}

.main-surgery__title {

  text-align: center;

  font-family: LucidaGrande-Bold;
  font-size: 36px;
  line-height: 43px;

   max-width: 800px;
    text-overflow: ellipsis;
    overflow: hidden;
    margin: 70px auto 50px auto;
}


.main-surgery .container {
  padding: 0 115px;
}

@media (max-width: 1024px) {
  .main-surgery__title {
    margin-top: 130px;
    margin-bottom: 25px;
  }
}

@media (max-width: 767px) {
  .main-surgery__title {
    font-size: 24px;
    margin-bottom: 15px;
  }
}
</style>
