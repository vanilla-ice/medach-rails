<template lang="pug">
  div.main-container
    loader-component(v-if="isLoading")
    header-component
    .main
      top-blogs(v-if="blogsPageConfig" :info="blogsPageConfig")
      three-columns(v-if="blogsPageConfig" :info="blogsPageConfig.spotlightBlogs")
      two-columns(v-if="blogsPageConfig" :info="blogsPageConfig.mainBlogs")
      intresting(v-if="blogsPageConfig" :info="blogsPageConfig.promotedBlogs")
    footer-component
</template>

<script>
  import HeaderComponent from '../components/Header.vue'
  import FooterComponent from '../components/Footer.vue'
  import TopBlogs from '../components/blogs/TopBlogs.vue'
  import ThreeColumns from '../components/blogs/ThreeColumns.vue'
  import TwoColumns from '../components/blogs/TwoColums.vue'
  import Intresting from '../components/blogs/Intresting.vue'

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
      LoaderComponent
    },

    computed: {
      ...mapGetters(['blogsPageConfig'])
    },

    data() {
      return {
        isLoading: true
      }
    },

    mounted() {
      this.$store.dispatch('getBlogsPageConfig').then((res) => {
        setTimeout(() => this.isLoading = false, 300)
      });
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