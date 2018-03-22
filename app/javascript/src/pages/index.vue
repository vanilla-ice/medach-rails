<template lang="pug" >
  div.main-container
    loader-component(v-if="isLoading")
    header-component
    .main
        top-articles(v-if="mainPageConfig" :info="mainPageConfig")
        blogs(v-if="mainPageConfig" :info="mainPageConfig")
        news(v-if="mainPageConfig" :info="mainPageConfig.mainNews")
        worst-articles(v-if="mainPageConfig" :info="mainPageConfig.promotedArticles")
    .in-order
      //- in-order-main(v-if="news" :info="news")
    footer-component
</template>

<script>
import moment from 'moment'

import HeaderComponent from '../components/Header.vue'
import TopArticles from '../components/index/TopArticles.vue'
import Blogs from '../components/index/Blogs.vue'
import News from '../components/index/News.vue'
import WorstArticles from '../components/index/WorstArticles.vue'
import FooterComponent from '../components/Footer.vue'

import LoaderComponent from '../components/Loader.vue'
import { mapGetters } from 'vuex'
moment.locale('ru')

export default {
  data () {
    return {
      inOrder: false,
      isLoading: true,
      isFetching: false,
      inThrottle: false
    }
  },

  mounted() {
    this.$store.dispatch('getMainPageConfig').then((res) => {
      setTimeout(() => this.isLoading = false, 300)
    });

    this.$store.dispatch('getActiveIndexInOrder', {id: this.currentId(), scroll: false}).then((res) => {
        setTimeout(() => this.isLoading = false, 300)
    });

    window.addEventListener('scroll', this.getNextPage)
  },

  computed: {
    ...mapGetters(['activeDate', 'pageCount', 'indexPageCount', 'mainPageConfig', 'sortState', 'indexInOrder', 'translatedMeta'])
  },

  methods: {
    currentId() {
      if (this.translatedMeta) {
        return this.translatedMeta.currentPage
      }
      return 1;
    },

    getNextPage() {
      // const $container = document.querySelector("#app")
      // if ($container.scrollHeight === (window.pageYOffset + window.innerHeight)) {
        
      //   if (this.translatedMeta.nextPage) this.$store.dispatch('getActiveTranslatedArticles', {id: this.translatedMeta.nextPage, scroll: true})
      // }
    }
  },

  components: {
    HeaderComponent,
    TopArticles,
    Blogs,
    News,
    WorstArticles,
    FooterComponent,
    LoaderComponent
  }
}
</script>

<style lang="scss" scopped>
.main {
  min-height: 100vh;
  padding-top: 30px;
  padding-bottom: 30px;

  background: #e0e0e0;
}

.days-wrapper {
  &:nth-child(even) {
    background: #F8F8F8;
  }
}

.placeholder {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #f8f8f8;
  z-index: 1;

  span {
    font-size: 28px;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    line-height: 24px;
    color: #aaaaaa;
  }
}

.slider {
  display: none;
  margin-bottom: 80px;
}

.main__big-foto {
  display: block;
  height: 275px;
  position: relative;
}

.loader {
  display: flex;
  flex-flow: row nowrap;
  justify-content: center;
}

@media (max-width: 1024px) {
  .main-container {
    margin-top: 62px;
  }
}

@media (max-width: 767px) {
  .big-photos {
    display: none;
  }

  .slider {
    display: block;
  }
}

</style>
