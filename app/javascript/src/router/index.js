import Vue from 'vue'
import Router from 'vue-router'
import Home from '../pages/index.vue'
import Blogs from '../pages/blogs.vue'
import Post from '../pages/post.vue'
import Tag from '../pages/tag.vue'
import Search from '../pages/search.vue'
import InOrder from '../pages/inOrder.vue'

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
      path: '/blogs',
      name: 'blogs',
      component: Blogs
    },
    {
      path: '/in-order',
      name: 'in-order',
      component: InOrder
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