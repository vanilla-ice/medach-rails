import Vue from 'vue'
import Vuex from 'vuex'
import createLogger from 'vuex/dist/logger'
import { firebaseMutations, firebaseAction } from 'vuexfire'
import moment from 'moment'

Vue.use(Vuex)

function store () {
  return new Vuex.Store({
    state: {
      posts: [],
      activeDate: moment(new Date()).format('DD/MM/YYYY')
    },

    getters: {
      posts: state => state.posts,
      activeDate: state => state.activeDate
    },

    mutations: {
      ...firebaseMutations,

      setActiveDate (store, date) {
        store.activeDate = date
      }
    },

    plugins: [createLogger()],

    actions: {
      setPostsRef: firebaseAction(({
        bindFirebaseRef
      }, ref) => {
        return new Promise((resolve, reject) => {
          bindFirebaseRef('posts', ref, {
            readyCallback: resolve,
            cancelCallback: reject
          })
        })
      })
    }
  })
}

export default store
