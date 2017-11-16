<template lang="pug" >
  div
    | {{ activePost }}
</template>

<script>
import { mapGetters } from 'vuex'
import { db } from '~/db'
const $posts = db.ref('posts')

export default {
  layout: 'admin',

  data () {
    return {
    }
  },

  computed: {
    ...mapGetters(['posts']),

    activePost () {
      return this.posts[0]
    }
  },

  created () {
    this.$store.dispatch('setPostsRef', $posts.orderByChild('url').equalTo(this.$route.params.id))
  },

  mounted () {
  }
}
</script>

<style scoped lang="scss">

</style>
