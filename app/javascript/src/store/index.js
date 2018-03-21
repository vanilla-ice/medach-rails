import Vue from 'vue'
import Vuex from 'vuex'
import createLogger from 'vuex/dist/logger'
import moment from 'moment'

import {
  getArticles,
  getPost,
  getNews,
  getBlogPost,
  getNewsPost,
  getNewsNextPage,
  getPostsByTag,
  searchRequest,
  tagsMostUsed,
  getPinnedPostsRequest,
  getAllTags,
  mainPageConfig,
  blogsPageConfig
 } from '../helpers/requests'

Vue.use(Vuex)

function store () {
  return new Vuex.Store({
    state: {
      posts: [],
      news: null,
      activeDate: moment(new Date()).format('DD/MM/YYYY'),
      activePost: null,
      activeBlogPost: null,
      activeNewsPost: null,
      activeTag: null,
      popularTags: [],
      pinnedPosts: [],
      pageCount: 0,
      indexPageCount: 1,
      allTags: [],
      mainPageConfig: null,
      blogsPageConfig: null
    },

    getters: {
      posts: state => state.posts,
      news: state => state.news,
      activeDate: state => state.activeDate,
      activePost: state => state.activePost,
      activeBlogPost: state => state.activeBlogPost,
      activeNewsPost: state => state.activeNewsPost,
      activeTag: state => state.activeTag,
      popularTags: state => state.popularTags,
      pinnedPosts: state => state.pinnedPosts,
      pageCount: state => state.pageCount,
      indexPageCount: state => state.indexPageCount,
      tags: state => state.allTags,
      mainPageConfig: state => state.mainPageConfig,
      blogsPageConfig: state => state.blogsPageConfig
    },

    mutations: {
      incrementIndexPageCount(state) {
        state.indexPageCount = state.indexPageCount + 1
      } 
    },

    actions: {
      getPosts({state, commit}) {
        const page = state.indexPageCount

        return new Promise((resolve, reject) => {
          if (state.pageCount === 0 || (state.pageCount > page || state.pageCount === page)) {
            getArticles(page).then(res => {
              state.posts = [...state.posts, ...res.data.articles]
              state.pageCount = Math.ceil(res.data.count / 20)
              commit('incrementIndexPageCount')
              resolve()
            })
          }
          else {
            resolve()
          }
        })
      },

      getActiveNews({state}, payload) {
        return new Promise((resolve, reject) => {
          getNews(payload).then(res => {
            state.news = {...res.data};
            resolve(res);
          })
        })
      },

      getActiveNextPageNews({state}, payload) {
        const { id } = payload
        return new Promise((resolve, reject) => {
          getNewsPost(id).then(res => {
            state.activeNewsPost = res.data
            resolve(res)
          })
        })
      },

      getTags({state}) {
        getAllTags().then((res) => state.allTags = [...res.data])
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

      getActiveBlogPost({state}, payload) {
        const { id } = payload
        return new Promise((resolve, reject) => {
          getBlogPost(id).then(res => {
            state.activeBlogPost = res.data
            resolve()
          })
        })
      },

      getActiveNewsPost({state}, payload) {
        const { id } = payload
        return new Promise((resolve, reject) => {
          getNewsPost(id).then(res => {
            state.activeNewsPost = res.data
            resolve()
          })
        })
      },

      search({state}, payload) {
        return new Promise((resolve, reject) => {
          searchRequest(payload).then(res => {
            state.posts = {...res.data.articles}
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

      getTagsMostUsed({state}) {
        return tagsMostUsed().then((res) => state.popularTags = [...res.data]).catch(error => console.log(error))
      },

      getMainPageConfig({state}) {
        return mainPageConfig().then((res) => {
          state.mainPageConfig = {...res.data.mainConfig}
        }).catch(error => console.log(error))
      },
      
      getBlogsPageConfig({state}) {
        return blogsPageConfig().then((res) => {
          state.blogsPageConfig = {...res.data.blogsConfig}
        }).catch(error => console.log(error))
      }, 
    },

    plugins: [createLogger()]
  })
}

export default store
