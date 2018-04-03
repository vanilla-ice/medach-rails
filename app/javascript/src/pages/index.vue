<template lang="pug" >
  div.main-container(:class="{'main-open-menu': isOpen}")
    loader-component(v-if="isLoading")
    scroll-top(v-if="scrollButton")
    header-component(@isOpen="toggleMenu")
    .main
      .main-wrapper(v-if="!sortState && checkChildren(item)" v-for="(item, index) in mainPageConfig")
        top-articles(v-if="item && item.pinnedArticles.length > 1" :info="item.pinnedArticles")
        blogs(v-if="item && item.pinnedBlogs.length > 4" :info="item.pinnedBlogs")
        news(v-if="item && item.mainNews.length > 1" :info="item.mainNews")
        worst-articles(v-if="item && item.promotedArticles.length > 2" :info="item.promotedArticles")
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
    InOrderMain,
    ScrollTop: () => import('../components/ScrollTop.vue')
  },

  data () {
    return {
      isLoading: true,
      scrollBottom: true,
      isOpen: false,
      scrollButton: false
    }
  },

  mounted() {
    this.$store.dispatch('getMainPageConfig').then((res) => {
      this.isLoading = false
    });

    this.$store.dispatch('getActiveIndexInOrder', {id: this.currentId(), scroll: false}).then((res) => {
      this.isLoading = false
    });

    window.addEventListener('scroll', this.getNextPage)

    window.addEventListener('scroll', this.showScrollToButton)
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

    toggleMenu() {
      this.isOpen = !this.isOpen;
    },

    showScrollToButton() {
      if (window.pageYOffset) return this.scrollButton = true
      return this.scrollButton = false
    },

    checkChildren(item) {
      const childrenStatus = item.pinnedArticles.length > 1 || item.pinnedBlogs.length > 4 || item.mainNews.length > 1 || item.promotedArticles.length > 2
      if (childrenStatus) return true
      return false
    }
  },

  beforeDestroy (to, from, next) {
    window.removeEventListener('scroll', this.getNextPage)
    window.removeEventListener('scroll', this.getScrollCoord)
    this.$store.dispatch('removeMeta')
  }
}
</script>

<style lang="scss" scopped>
.main-wrapper:last-child {
  margin-bottom: 0;
}

.main {
  min-height: 100vh;
  padding-top: 15px;
  padding-bottom: 15px;

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

.main-open-menu::after {
  content: '';
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;

  background: rgba(0,0,0,0.2);
  z-index: 100;
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
