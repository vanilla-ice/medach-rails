/* eslint no-console:0 */
import Vue from 'vue'
import App from '../app.vue'
import router from '../src/router'

document.addEventListener('DOMContentLoaded', () => {
  document.body.appendChild(document.createElement('app'))
  const app = new Vue({
    el: 'app',
    router,
    template: '<App/>',
    components: { App }
  })

  console.log(app)
})
