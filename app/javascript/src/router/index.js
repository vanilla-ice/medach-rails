import Vue from 'vue'
import Router from 'vue-router'
import Home from '../pages/index.vue'
import Blogs from '../pages/blogs.vue'
import News from '../pages/news.vue'
import Media from '../pages/media.vue'
import Post from '../pages/post.vue'
import Tag from '../pages/tag.vue'
import Search from '../pages/search.vue'
import BlogPost from '../pages/blogPost.vue'
import NewsPost from '../pages/newsPost.vue'
import MediaPost from '../pages/mediaPost.vue'
import Articles from '../pages/articles.vue'
import Translated from '../pages/translated.vue'
import VueYandexMetrika from 'vue-yandex-metrika'  

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
      path: '/blog-post/:id',
      name: 'blog-post',
      component: BlogPost
    },
    {
      path: '/news-post/:id',
      name: 'news-post',
      component: NewsPost
    },
    {
      path: '/media-post/:id',
      name: 'media-post',
      component: MediaPost
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
      path: '/news',
      name: 'news',
      component: News
    },
    {
      path: '/media',
      name: 'media',
      component: Media
    },
    {
      path: '/articles',
      name: 'articles',
      component: Articles
    },
    {
      path: '/translated',
      name: 'translated',
      component: Translated
    },
    { 
      path: '*',
      beforeEnter: (to, from, next) => {
        window.location = 'http://old.medach.pro' + to.path
      }
    }
  ],
  scrollBehavior (to, from, savedPosition) {
    return { x: 0, y: 0 }
  }
})

Vue.use(VueYandexMetrika, {
  id: 48984611,
  router: router,
  env: process.env.NODE_ENV
})

export default router