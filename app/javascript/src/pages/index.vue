<template lang="pug" >
  div.main-container
    loader-component(v-if="isLoading")
    header-component
    .main
      .main-wrapper(v-if="!sortState")
        top-articles(v-if="mainPageConfig" :info="mainPageConfig")
        blogs(v-if="mainPageConfig" :info="mainPageConfig")
        news(v-if="mainPageConfig" :info="mainPageConfig.mainNews")
        worst-articles(v-if="mainPageConfig" :info="mainPageConfig.promotedArticles")
      .in-order(v-if="sortState")
        in-order-main(v-if="indexInOrder" :info="indexInOrder" :bouncing="!scrollBottom")
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
import InOrderMain from '../components/in-order/InOrderMain.vue'

import LoaderComponent from '../components/Loader.vue'
import { mapGetters } from 'vuex'
moment.locale('ru')

export default {
  components: {
    HeaderComponent,
    TopArticles,
    Blogs,
    News,
    WorstArticles,
    FooterComponent,
    LoaderComponent,
    InOrderMain
  },

  data () {
    return {
      isLoading: true,
      scrollBottom: true
    }
  },

  mounted() {
    console.log(this.mainPageConfig)
    this.$store.dispatch('getMainPageConfig').then((res) => {
      this.isLoading = false
    });

    this.$store.dispatch('getActiveIndexInOrder', {id: this.currentId(), scroll: false}).then((res) => {
      this.isLoading = false
    });

    window.addEventListener('scroll', this.getNextPage)
  },

  computed: {
    ...mapGetters(['activeDate', 'pageCount', 'indexPageCount', 'mainPageConfig', 'sortState', 'indexInOrder', 'indexInOrderMeta'])
  },

  methods: {
    currentId() {
      if (this.indexInOrderMeta) {
        return this.indexInOrderMeta.currentPage
      }
      return 1;
    },

    getNextPage() {
      const $container = document.querySelector(".main")
      if ($container.scrollHeight - 200 < (window.pageYOffset + window.innerHeight)) {
        if (this.indexInOrderMeta.nextPage && this.scrollBottom && this.sortState) {
          this.scrollBottom = false;
          
          this.$store.dispatch('getActiveIndexInOrder', {id: this.indexInOrderMeta.nextPage, scroll: true})
          .then(() => this.scrollBottom = true)
        }
      }
    },
  },

  beforeDestroy (to, from, next) {
    window.removeEventListener('scroll', this.getNextPage)
    this.$store.dispatch('removeMeta')
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
