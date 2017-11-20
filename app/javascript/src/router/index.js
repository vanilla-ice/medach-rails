import Vue from 'vue'
import Router from 'vue-router'
import Home from '../pages/index.vue'
import Post from '../pages/post.vue'
import Tag from '../pages/tag.vue'

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
  ]
})

export default router