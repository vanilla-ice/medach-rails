<template lang="pug">
  div.main-container
    loader-component(v-if="isLoading")
    header-component
    .main
      .main-wrapper(v-if="!sortState")
        top-blogs(v-if="blogsPageConfig" :info="blogsPageConfig")
        three-columns(v-if="blogsPageConfig" :info="blogsPageConfig.spotlightBlogs")
        two-columns(v-if="blogsPageConfig" :info="blogsPageConfig.mainBlogs")
        intresting(v-if="blogsPageConfig" :info="blogsPageConfig.promotedBlogs")
      .in-order(v-if="sortState")
        in-order-main(v-if="blogsInOrder" :info="blogsInOrder")
    footer-component
</template>

<script>
  import HeaderComponent from '../components/Header.vue'
  import FooterComponent from '../components/Footer.vue'
  import TopBlogs from '../components/blogs/TopBlogs.vue'
  import ThreeColumns from '../components/blogs/ThreeColumns.vue'
  import TwoColumns from '../components/blogs/TwoColums.vue'
  import Intresting from '../components/blogs/Intresting.vue'
  import InOrderMain from '../components/in-order/InOrderMain.vue'

  import LoaderComponent from '../components/Loader.vue'

  import { mapGetters } from 'vuex'

  export default {
    components: {
      HeaderComponent,
      TopBlogs,
      ThreeColumns,
      TwoColumns,
      FooterComponent,
      Intresting,
      LoaderComponent,
      InOrderMain
    },

    computed: {
      ...mapGetters(['blogsPageConfig', 'sortState', 'blogsInOrder', 'blogsInOrderMeta'])
    },

    data() {
      return {
        isLoading: true,
        scrollBottom: false
      }
    },

    mounted() {
      this.$store.dispatch('getBlogsPageConfig').then((res) => {
        this.isLoading = false
      });

      this.$store.dispatch('getActiveBlogsInOrder', {id: this.currentId(), scroll: false}).then((res) => {
        this.isLoading = false
    });

    window.addEventListener('scroll', this.getNextPage)
    },

    methods: {
      currentId() {
        if (this.blogsInOrderMeta) {
          return this.blogsInOrderMeta.currentPage
        }
        return 1;
      },

      getNextPage() {
        const $container = document.querySelector(".main")
        if ($container.scrollHeight < (window.pageYOffset + window.innerHeight)) {
          if (this.blogsInOrderMeta.nextPage && this.scrollBottom && this.sortState) {
            this.$store.dispatch('getActiveBlogsInOrder', {id: this.blogsInOrderMeta.nextPage, scroll: true})
            .then(() => this.scrollBottom = true)

            this.scrollBottom = false;
          }
        }
      }
    }
  }
</script>

<style lang="scss" scoped>
  .main-container {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
  }

  @media(max-width: 1440px) {
    
  }
</style>