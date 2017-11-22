import Vue from 'vue'
import Vuex from 'vuex'
import createLogger from 'vuex/dist/logger'
import moment from 'moment'

import { 
  getArticles,
  getPost,
  getPostsByTag,
  searchRequest
 } from '../helpers/requests'

Vue.use(Vuex)

function store () {
  return new Vuex.Store({
    state: {
      posts: [],
      activeDate: moment(new Date()).format('DD/MM/YYYY'),
      activePost: null,
      activeTag: null
    },

    getters: {
      posts: state => state.posts,
      activeDate: state => state.activeDate,
      activePost: state => state.activePost,
      activeTag: state => state.activeTag
    },

    mutations: {
      getPosts(state) {
        getArticles().then(res => state.posts = [...res.data])
      },

      getActivePost(state, payload) {
        const { id } = payload
        getPost(id).then(res => state.activePost = res.data)
      },

      getTaggedPosts(state, payload) {
        const { id } = payload
        state.activeTag = id
        getPostsByTag(id).then(res => state.posts = [...res.data])
      },

      search(state, payload) {
        searchRequest(payload).then(res => state.posts = [...res.data])
      }
    },

    plugins: [createLogger()]
  })
}

export default store
