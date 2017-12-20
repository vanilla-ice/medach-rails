import Vue from 'vue'
import Vuex from 'vuex'
import createLogger from 'vuex/dist/logger'
import moment from 'moment'

import { 
  getArticles,
  getPost,
  getPostsByTag,
  searchRequest,
  tagsCount
 } from '../helpers/requests'

Vue.use(Vuex)

function store () {
  return new Vuex.Store({
    state: {
      posts: [],
      activeDate: moment(new Date()).format('DD/MM/YYYY'),
      activePost: null,
      activeTag: null,
      popularTags: []
    },

    getters: {
      posts: state => state.posts,
      activeDate: state => state.activeDate,
      activePost: state => state.activePost,
      activeTag: state => state.activeTag,
      popularTags: state => state.popularTags
    },

    mutations: {
    },

    actions: {
      getPosts({state}) {
        return new Promise((resolve, reject) => {
          getArticles().then(res => {
            state.posts = [...res.data]
            resolve()
          })
        })
      },

      getActivePost({state}, payload) {
        const { id } = payload
        return new Promise((resolve, reject) => {
          getPost(id).then(res => {
            state.activePost = res.data
            resolve()
          })
        })
      },

      search({state}, payload) {
        return new Promise((resolve, reject) => {
          searchRequest(payload).then(res => {
            state.posts = [...res.data]
            resolve()
          })
        })
      },

      getTaggedPosts({state}, payload) {
        const { id } = payload
        return new Promise((resolve, reject) => {
          state.activeTag = id
          getPostsByTag(id).then(res => {
            state.posts = [...res.data]
            resolve()
          })
        })
      },

      getTagsCount({state}) {
        return tagsCount().then((res) => state.popularTags = [...res.data]).catch(error => console.log(error))
      }
    },

    plugins: [createLogger()]
  })
}

export default store
