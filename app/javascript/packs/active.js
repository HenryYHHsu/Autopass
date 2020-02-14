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
import VueDatepickerLocal from 'vue-datepicker-local'
import Active from '../active.vue'
Vue.component('vue-datepicker-local', VueDatepickerLocal);

document.addEventListener('turbolinks:load', () => {
    const active = new Vue({
      el: '#active',
      data :{
          singleactive:"",
          useractive:"",
          timeactive:"",
          particularstore:"",
          particularitem:"",
          singleactivestatus:false,
          useractivestatus:false,
          timeactivestatus:false,
          particularstorestatus:false,
          particularitemstatus:false,
          time: new Date(),
          range: [new Date(),new Date()],
          store_name:"",
      },
      methods:{},
      computed:{
          single_choice(){
            if (this.singleactive === 'Yes'){
                this.singleactivestatus = true;
            } else{
                this.singleactivestatus = false;
            }
          },
          user_choice(){
            if (this.useractive === 'Yes'){
                this.useractivestatus = true;
            } else{
                this.useractivestatus = false;
            }
          },
          time_choice(){
            if (this.timeactive === 'Yes'){
                this.timeactivestatus = true;
                console.log(this.range)
            } else{
                this.timeactivestatus = false;
            }
          },
          store_choice(){
            if (this.particularstore === 'Yes'){
                this.particularstorestatus = true;
                // return this.particularstore
            } else{
                this.particularstorestatus = false;
                // return this.particularstore
            } 
          },
          item_choice(){
            if (this.particularitem === 'Yes'){
                this.particularitemstatus = true;
                // return this.particularitem
            } else{
                this.particularitemstatus = false;
                // return this.particularitem
            } 
          }
      }
    })
})