<template lang="pug" >
  div
    header-component
    data-component(:date="activeDate")
    main.main-index
      big-fotos-component(:posts="getActivePosts")
      .inner
        .days-wrapper()
          MinFotosComponent(:posts="posts")

</template>

<script>
import moment from 'moment'

import HeaderComponent from '../components/Header.vue'
import DataComponent from '../components/Data.vue'
import BigFotosComponent from '../components/BigFotos.vue'
import MinFotosComponent from '../components/MinFotos.vue'

import { mapGetters } from 'vuex'
moment.locale('ru')

export default {
  data () {
    return {
    }
  },

  created() {
    this.$store.commit('getPosts')
    console.log(this.$store.state)
  },

  computed: {
    ...mapGetters(['posts', 'activeDate']),

    getActivePosts () {
      return this.getPostsByDay[this.activeDate]
    },

    getPostsByDay () {
      const sortedPosts = {}
      const posts = this.posts.reduce((res, curr, id) => {
        const date = moment(curr.created_at).format('DD/MM/YYYY')

        if (!res.hasOwnProperty(date)) {
          res[date] = []
        }
        res[date].push(curr)
        return res
      }, {})

      return posts
    }
  },

  methods: {

  },

  components: {
    HeaderComponent,
    DataComponent,
    BigFotosComponent,
    MinFotosComponent
  }
}
</script>

<style lang="scss" scopped>

.days-wrapper {
  &:nth-child(even) {
    background: #F8F8F8;
  }
}

</style>
