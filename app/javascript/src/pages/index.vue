<template lang="pug" >
  div.main-container
    loader-component(v-if="isLoading")
    header-component
    .main
      top-articles
      blogs
      autors
      worst-articles
</template>

<script>
import moment from 'moment'

import HeaderComponent from '../components/Header.vue'
import TopArticles from '../components/index/TopArticles.vue'
import Blogs from '../components/index/Blogs.vue'
import Autors from '../components/index/Autors.vue'
import WorstArticles from '../components/index/WorstArticles.vue'

import LoaderComponent from '../components/Loader.vue'
import { mapGetters } from 'vuex'
moment.locale('ru')

export default {
  data () {
    return {
      isLoading: true,
      isFetching: false,
      inThrottle: false
    }
  },

  mounted() {
    this.$store.dispatch('getPosts', this.currentPage).then((res) => {
      setTimeout(() => this.isLoading = false, 300)
    })
    this.$store.dispatch('getPinnedPosts')
    let isThrottling = false;

    window.addEventListener('scroll', () => {
      const $container = document.querySelector("#app")
      if ($container.scrollHeight === (window.pageYOffset + window.innerHeight)) {
        this.throttle(this.fetchPosts, 1000);
      }
    })
  },

  computed: {
    ...mapGetters(['posts', 'activeDate', 'pinnedPosts', 'pageCount', 'indexPageCount'])
  },

  methods: {
    fetchPosts() {
      this.$store.dispatch('getPosts').then(() => this.isFetching = false)
    },

    throttle(func, limit) {
      if (!this.inThrottle) {
        func()
        this.inThrottle = true
        setTimeout(() => this.inThrottle = false, limit)
      }
    }
  },

  components: {
    HeaderComponent,
    TopArticles,
    Blogs,
    Autors,
    WorstArticles,
    LoaderComponent
  }
}
</script>

<style lang="scss" scopped>
.main {
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

.image { 
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-size: cover !important;
  background-repeat: no-repeat !important;
  background-position: center !important;
  z-index: 2;
}

.loader {
  display: flex;
  flex-flow: row nowrap;
  justify-content: center;
}

@media (max-width: 1024px) {
  .main-container {
    margin-top: 115px;
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
