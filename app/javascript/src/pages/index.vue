<template lang="pug" >
  div
    header-component
    data-component(:date="activeDate")
    main.main-index
      big-fotos-component(:posts="getActivePosts")
      .inner
        .days-wrapper(v-for="(day, index) in getPostsByDay", :key="index")
          MinFotosComponent(:posts="day", :day="index")

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

  computed: {
    ...mapGetters(['posts', 'activeDate']),

    getActivePosts () {
      return this.getPostsByDay[this.activeDate]
    },

    getPostsByDay () {
      const sortedPosts = {}
      const posts = this.posts.reduce((res, curr, id) => {
        console.log('CURRENT', curr.date)
        const date = moment(curr.date).format('DD/MM/YYYY')

        if (!res.hasOwnProperty(date)) {
          res[date] = []
        }
        res[date].push(curr)
        return res
      }, {})

      Object.keys(posts).sort((a, b) => {
        const dateA = moment(a, 'DD/MM/YYYY')
        const dateB = moment(b, 'DD/MM/YYYY')

        if (dateA > dateB) return -1
        else if (dateA < dateB) return 1
        else return 0
      }).map(item => { sortedPosts[item] = {...posts[item]} })

      return sortedPosts
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
