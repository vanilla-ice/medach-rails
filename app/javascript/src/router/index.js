import Vue from 'vue'
import Router from 'vue-router'
import Home from '../pages/index.vue'
import Blogs from '../pages/blogs.vue'
import News from '../pages/news.vue'
import Post from '../pages/post.vue'
import Tag from '../pages/tag.vue'
import Search from '../pages/search.vue'
import InOrder from '../pages/inOrder.vue'
import BlogPost from '../pages/blogPost.vue'
import NewsPost from '../pages/newsPost.vue'
import Articles from '../pages/articles.vue'

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
      path: '/news',
      name: 'news',
      component: News
    },
    {
      path: '/articles',
      name: 'articles',
      component: Articles
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

export default router