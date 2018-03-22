import Vue from 'vue'
import Vuex from 'vuex'
import createLogger from 'vuex/dist/logger'
import moment from 'moment'

import {
  getArticles,
  getIndexInOrder,
  getPost,
  getNews,
  getBlogPost,
  getNewsPost,
  getNewsNextPage,
  getTranslatedArticles,
  getPostsByTag,
  searchRequest,
  tagsMostUsed,
  getAllTags,
  mainPageConfig,
  blogsPageConfig
 } from '../helpers/requests'

Vue.use(Vuex)

function store () {
  return new Vuex.Store({
    state: {
      news: null,
      newsMeta: null,
      articles: null,
      articlesMeta: null,
      translated: null,
      translatedMeta: null,
      indexInOrder: null,
      indexInOrderMeta: null,
      activeDate: moment(new Date()).format('DD/MM/YYYY'),
      activePost: null,
      activeBlogPost: null,
      activeNewsPost: null,
      activeTag: null,
      popularTags: [],
      pageCount: 0,
      indexPageCount: 1,
      allTags: [],
      mainPageConfig: null,
      blogsPageConfig: null,
      sortState: null
    },

    getters: {
      news: state => state.news,
      newsMeta: state => state.newsMeta,
      activeArticles: state => state.articles,
      articlesMeta: state => state.articlesMeta,
      translatedArticles: state => state.translated,
      translatedMeta: state => state.translatedMeta,
      activeDate: state => state.activeDate,
      activePost: state => state.activePost,
      activeBlogPost: state => state.activeBlogPost,
      activeNewsPost: state => state.activeNewsPost,
      activeTag: state => state.activeTag,
      popularTags: state => state.popularTags,
      pageCount: state => state.pageCount,
      indexPageCount: state => state.indexPageCount,
      tags: state => state.allTags,
      mainPageConfig: state => state.mainPageConfig,
      blogsPageConfig: state => state.blogsPageConfig,
      sortState: state => state.sortState,
      indexInOrder: state => state.indexInOrder,
      indexInOrderMeta: state => state.indexInOrderMeta
    },

    mutations: {
      incrementIndexPageCount(state) {
        state.indexPageCount = state.indexPageCount + 1
      } 
    },

    actions: {
      getActiveIndexInOrder({state}, payload) {
        const {id, scroll} = payload
        return new Promise((resolve, reject) => {
          getIndexInOrder(id).then(res => {
            if (scroll) {
              state.indexInOrder = [...state.indexInOrder, ...res.data.allArticles];
              state.indexInOrderMeta = {...res.data.meta}
            } else {
              state.indexInOrder = [...res.data.allArticles];
              state.indexInOrderMeta = {...res.data.meta}
            }
            resolve(res);
          })
        })
      },

      sortStateToggle({state}) {
        state.sortState = !state.sortState
      },

      removeMeta({state}) {
        state.translatedMeta = null;
        state.articlesMeta = null;
      },

      getActiveArticles({state}, payload) {
        const {id, scroll} = payload
        return new Promise((resolve, reject) => {
          getArticles(id).then(res => {
            if (scroll) {
              state.articles = [...state.articles, ...res.data.articles];
              state.articlesMeta = {...res.data.meta}
            } else {
              state.articles = [...res.data.articles];
              state.articlesMeta = {...res.data.meta}
            }
            resolve(res);
          })
        })
      },

      getActiveTranslatedArticles({state}, payload) {
        const {id, scroll} = payload
        return new Promise((resolve, reject) => {
          getTranslatedArticles(id).then(res => {
            if (scroll) {
              state.translated = [...state.translated, ...res.data.articles];
              state.translatedMeta = {...res.data.meta}
            } else {
              state.translated = [...res.data.articles];
              state.translatedMeta = {...res.data.meta}
            }
            resolve(res);
          })
        })
      },

      getActiveNews({state}, payload) {
        return new Promise((resolve, reject) => {
          getNews(payload).then(res => {
            state.news = [...res.data.news];
            state.newsMeta = {...res.data.meta}
            resolve(res);
          })
        })
      },

      getActiveNextPageNews({state}, payload) {
        const { id } = payload
        return new Promise((resolve, reject) => {
          getNewsNextPage(id).then(res => {
            state.news = [...state.news, ...res.data.news]
            state.newsMeta = {...res.data.meta}
            resolve(res)
          })
        })
      },

      getTags({state}) {
        getAllTags().then((res) => state.allTags = [...res.data])
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
