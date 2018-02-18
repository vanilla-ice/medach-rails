<template lang="pug" >
  div
    loader-component(v-if="isLoading")
    header-component
    main.main-surgery
      .main-surgery__title
        | {{ getTagName }}
      posters-component(:posts="posts")
</template>
<script>
import HeaderComponent from '../components/Header.vue'
import PostersComponent from '../components/Posters.vue'
import LoaderComponent from '../components/Loader.vue'

import { mapGetters } from 'vuex'

export default {
  data () {
    return {
      isLoading: true, 
    }
  },

  created () {
    const payload = {
      id: this.$route.params.id
    }
    this.$store.dispatch('getTaggedPosts', payload).then(res => setTimeout(() => this.isLoading = false, 300))
  },

  beforeRouteUpdate (to, from, next) {
    const payload = {
      id: to.params.id
    }
    this.isLoading = true
    this.$store.dispatch('getTaggedPosts', payload).then(res => setTimeout(() => this.isLoading = false, 300))
    next()
  },

  mounted () {
  },

  computed: {
    ...mapGetters(['posts']),

    getTagName () {
      return '#' + this.$route.params.id.toUpperCase()
    }
  },

  components: {
    HeaderComponent,
    PostersComponent,
    LoaderComponent
  }
}
</script>

<style scoped lang="scss">
  .main-surgery {
  padding-bottom: 56px;
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
