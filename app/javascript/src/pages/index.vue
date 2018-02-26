<template lang="pug" >
  div.main-container
    loader-component(v-if="isLoading")
    header-component
    main.main-index
      .big-photos
        big-fotos-component(:posts="pinnedPosts" v-if="pinnedPosts.length > 0")
      
      .slider(v-if="pinnedPosts && pinnedPosts.length > 0")
        carousel
          slide(v-for="(post, id) in pinnedPosts", :key="id")
            router-link.main__big-foto(:to="'post/' + post.id")
              .placeholder
                span MEDACH
              .image(v-if="post.image", :style="{ background: `url(${post.image.thumb.url})` }")
      
      .inner
        .days-wrapper
          MinFotosComponent(:posts="posts")
          .loader(v-if="isFetching")
            img(src="../static/images/loader.svg")
      


</template>

<script>
import moment from 'moment'
import { Carousel, Slide } from 'vue-carousel'

import HeaderComponent from '../components/Header.vue'
import DataComponent from '../components/Data.vue'
import BigFotosComponent from '../components/BigFotos.vue'
import MinFotosComponent from '../components/MinFotos.vue'
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
    DataComponent,
    BigFotosComponent,
    MinFotosComponent,
    LoaderComponent,
    Carousel,
    Slide
  }
}
</script>

<style lang="scss" scopped>

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
