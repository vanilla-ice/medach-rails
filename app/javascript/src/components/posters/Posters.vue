<template lang="pug">
  .posters
    .container
      .posters__wrapper
        posters-item(:posts="posts")
</template>

<script>
import PostersItem from './PostersItem.vue'

import moment from 'moment'

export default {
  props: ['posts'],

  components: {
    PostersItem
  },

  data() {
    return {
    }
  },

  methods: {
    getPostDate (date) {
      return moment(date).format('DD.MM.YYYY')
    }
  }
}
</script>

<style scoped lang="scss">
.posters {
  min-height: 100vh;
  background: #e0e0e0;
}

.posters__wrapper {
  max-width: 800px;
  width: 100%;
  margin: 0 auto;
  padding-top: 27px;
  padding-bottom: 18px;
}
</style>

