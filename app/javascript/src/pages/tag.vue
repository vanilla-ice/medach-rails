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
      availableTags: [
        {
          value: 'хирургия',
          name: '#ХИРУРГИЯ'
        },
        {
          name: '#ТЕРАПИЯ',
          value: 'терапия'
        },
        {
          name: '#ОФТАЛЬМОЛОГИЯ',
          value: 'офтальмология'
        },
        {
          name: '#КАРДИОЛОГИЯ',
          value: 'кардиология'
        },
        {
          name: '#ОБРАЗОВАНИЕ',
          value: 'образование'
        },
        {
          name: '#CRISPR',
          value: 'crispr'
        },
        {
          name: '#НЕЙРОХИРУРГИЯ',
          value: 'нейрохирургия'
        }
      ]
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
      return this.availableTags.filter(item => item.value === this.$route.params.id)[0].name
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
  margin-top: 96px;
  margin-bottom: 76px;

  text-align: center;

  font-family: LucidaGrande-Bold;
  font-size: 36px;
  line-height: 43px;
}


.main-surgery .container {
  padding: 0 115px;
}
</style>
