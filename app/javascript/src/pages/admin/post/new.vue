<template lang="pug" >
  .wrapper
    input(placeholder="Post name" v-model="activePost.name" @change="changeName")
    input(placeholder="Url" v-model="activePost.url")
    .tags
      .tag(v-for="(tag, id) in availableTags", :key="id")
        label(:for="'tag-' + id") {{ tag.name }}
        input(type="checkbox", :value="tag.value", :id="'tag-' + id" v-model="tags")

    button(@click="savePost") save
</template>

<script>
import slugify from '~/utils/slugify'
import { db } from '~/db'
const $posts = db.ref('posts')

const emptyPost = {
  name: null,
  sortDate: null,
  date: null,
  url: null,
  tags: {}
}

export default {
  layout: 'admin',

  data () {
    return {
      activePost: emptyPost,
      tags: [],
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

  computed: {

  },

  methods: {
    savePost () {
      const date = new Date()
      this.activePost.sortDate = date.getTime()
      this.activePost.date = `${date}`
      this.tags.map(item => { this.activePost.tags[item] = true })
      this.tags = []

      $posts.push().set(this.activePost)
    },

    changeName (e) {
      this.activePost.url = slugify(e.target.value)
    }
  },

  created () {

  },

  mounted () {
  }
}
</script>

<style scoped lang="scss">

</style>
