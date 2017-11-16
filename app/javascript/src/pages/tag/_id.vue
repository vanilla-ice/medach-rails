<template lang="pug" >
  div
    header-component
    main.main-surgery
      .main-surgery__title
        | {{ getTagName }}
      posters-component(:posts="posts")
</template>
<script>
import HeaderComponent from '~/components/Header.vue'
import PostersComponent from '~/components/Posters.vue'

import { db } from '~/db'
import { mapGetters } from 'vuex'
const $posts = db.ref('posts')

export default {
  data () {
    return {
      availableTags: [
        {
          value: 'surgery',
          name: '#ХИРУРГИЯ'
        },
        {
          name: '#ТЕРАПИЯ',
          value: 'therapy'
        },
        {
          name: '#ОФТАЛЬМОЛОГИЯ',
          value: 'ophthalmology'
        },
        {
          name: '#КАРДИОЛОГИЯ',
          value: 'cardiology'
        },
        {
          name: '#ОБРАЗОВАНИЕ',
          value: 'education'
        },
        {
          name: '#CRISPR',
          value: 'crispr'
        },
        {
          name: '#НЕЙРОХИРУРГИЯ',
          value: 'neurosurgery'
        }
      ]
    }
  },

  created () {
    this.$store.dispatch('setPostsRef', $posts.orderByChild(`tags/${this.$route.params.id}`).equalTo(true))
  },

  mounted () {
    console.log('posts', this.posts)
  },

  computed: {
    ...mapGetters(['posts']),

    getTagName () {
      return this.availableTags.filter(item => item.value === this.$route.params.id)[0].name
    }
  },

  components: {
    HeaderComponent,
    PostersComponent
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
