import Vue from 'vue'
import Vuex from 'vuex'
import createLogger from 'vuex/dist/logger'
import moment from 'moment'

import { 
  getArticles,
  getPost
 } from '../helpers/requests'

Vue.use(Vuex)

function store () {
  return new Vuex.Store({
    state: {
      posts: [],
      activeDate: moment(new Date()).format('DD/MM/YYYY'),
      activePost: null
    },

    getters: {
      posts: state => state.posts,
      activeDate: state => state.activeDate,
      activePost: state => state.activePost
    },

    mutations: {
      getPosts(state) {
        getArticles().then(res => state.posts = [...res.data])
      },

      getActivePost(state, payload) {
        const { id } = payload
        getPost(id).then(res => state.activePost = res.data)
      }
    },

    plugins: [createLogger()]
  })
}

export default store
