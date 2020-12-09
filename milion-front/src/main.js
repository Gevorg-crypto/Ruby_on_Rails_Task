// The Vue build version to load with the `import` commands
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
// import axios from 'axios'
import VueAxios from 'vue-axios'
import App from './App'
import router from './router'
import {securedAxiosInstance, plainAxiosInstance} from './backend/axios'

Vue.use(VueAxios, {
  secured: securedAxiosInstance,
  plain: plainAxiosInstance
})

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  securedAxiosInstance,
  plainAxiosInstance,
  components: {App},
  template: '<App/>'
})
