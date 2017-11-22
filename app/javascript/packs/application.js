/* eslint no-console:0 */
import Vue from 'vue'
import App from '../app.vue'
import router from '../src/router'
import store from '../src/store'

document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('app'))
  const app = new Vue({
    el: 'app',
    router,
    store,
    template: '<App/>',
    components: { App }
  })
})
