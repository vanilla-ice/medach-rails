import Vue from 'vue'
import Vuex from 'vuex'
import createLogger from 'vuex/dist/logger'
import moment from 'moment'

import { 
  getArticles,
  getPost,
  getPostsByTag,
  searchRequest,
  tagsCount,
  getPinnedPostsRequest
 } from '../helpers/requests'

Vue.use(Vuex)

function store () {
  return new Vuex.Store({
    state: {
      posts: [],
      activeDate: moment(new Date()).format('DD/MM/YYYY'),
      activePost: null,
      activeTag: null,
      popularTags: [],
      pinnedPosts: [],
      pageCount: 0
    },

    getters: {
      posts: state => state.posts,
      activeDate: state => state.activeDate,
      activePost: state => state.activePost,
      activeTag: state => state.activeTag,
      popularTags: state => state.popularTags,
      pinnedPosts: state => state.pinnedPosts,
      pageCount: state => state.pageCount
    },

    mutations: {
    },

    actions: {
      getPosts({state}, page) {
        return new Promise((resolve, reject) => {
          getArticles(page).then(res => {
            state.posts = [...state.posts, ...res.data.articles]
            state.pageCount = Math.ceil(res.data.count / 20)
            resolve()
          })
        })
      },

      getPinnedPosts({state}) {
        getPinnedPostsRequest().then((res) => state.pinnedPosts = [...res.data])
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
