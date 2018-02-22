import Vue from 'vue'
import Router from 'vue-router'
import Home from '../pages/index.vue'
import Post from '../pages/post.vue'
import Tag from '../pages/tag.vue'
import Search from '../pages/search.vue'

Vue.use(Router)

const router = new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home
    },
    {
      path: '/post/:id',
      name: 'post',
      component: Post
    },
    {
      path: '/tag/:id',
      name: 'tag',
      component: Tag
    },
    {
      path: '/search',
      name: 'search',
      component: Search
    },
    { 
      path: '*',
      beforeEnter: (to, from, next) => {
        window.location = 'http://old.medach.pro' + to.path
      }
    }
  ]
})

export default router