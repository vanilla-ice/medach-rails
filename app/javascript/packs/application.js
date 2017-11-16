/* eslint no-console:0 */
import Vue from 'vue'
import VueRouter from 'vue-router'
import App from '../app.vue'

Vue.use(VueRouter)

document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('app'))
  const app = new Vue({
    el: 'app',
    template: '<App/>',
    components: { App }
  })

  console.log(app)
})
