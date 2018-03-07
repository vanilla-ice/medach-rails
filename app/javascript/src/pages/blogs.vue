<template lang="pug">
  div.main-container
    loader-component(v-if="isLoading")
    header-component
    .main
      top-blogs
      three-columns
      two-columns
      intresting
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

    data() {
      return {
        isLoading: true
      }
    },
    mounted() {
      this.$store.dispatch('getPosts', this.currentPage).then((res) => {
        setTimeout(() => this.isLoading = false, 300)
      })
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