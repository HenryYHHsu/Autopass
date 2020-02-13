import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'

// ---Bootstrap Vue setting
import 'bulma'
// import { func } from 'prop-types'
// import BootstrapVue from 'bootstrap-vue'
// Vue.use(BootstrapVue)
// import 'bootstrap-vue/dist/bootstrap-vue.css'
//
import axios from 'axios'
Vue.prototype.$ajax = axios
//  
import moment from "moment";

document.addEventListener('turbolinks:load', () => {
    const active = new Vue({
      el: '#active',
      data :{
          data : "cccc",
      }
    })
})