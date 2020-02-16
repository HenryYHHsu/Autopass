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
import { isThisSecond } from 'date-fns'
import { formatRelativeWithOptions } from 'date-fns/fp'
Vue.component('vue-datepicker-local', VueDatepickerLocal);

document.addEventListener('turbolinks:load', () => {
    const active = new Vue({
      el: '#active',
      data :{
          activename:"",
          singleactive:"",
          useractive:"",
          timeactive:"",
          particularstore:"",
          particularitem:"",
          money_discount:"",
          money_discount_target:0,
          money_discount_cash:0,
          money_discount_percent:0,
          free_delivery_target:0,
          time: new moment().format('l'),
          range: [ new moment().format('l'), new moment().format('l')],
          time_delta:0,
          store_name:"",
          item_name:"",
          single_number:0,
          single_limit_number:0,
          user_number:0,
          user_limit_number:0,
          singleactivestatus:false,
          useractivestatus:false,
          timeactivestatus:false,
          particularstorestatus:false,
          particularitemstatus:false,
          active_content:[],
          checked_single:false,
          checked_user:false,
          checked_time:false,
          checked_ps:false,
          checked_pi:false,
          checked_a:false,
          checked_b:false,
          checked_c:false,
          checked_d:false,
          checked_e:false,
          activestatus:false,
          extra_bonus_target:0,
          ps:"",
          ps_target:0,
          ps_cash:0,
          ps_percent:0,
          pi:"",
          pi_target:0,
          pi_cash:0,
          pi_percent:0,
      },
      methods:{
        create_active: function(){
          this.activestatus =true;
          let active_condition = [{ name: '活動名稱',
                                    status:true,
                                    values:this.activename,
                                    condtion:true,
                                  },
                                  { name: '活動總數量',
                                    status: this.checked_single,
                                    condtion:this.singleactivestatus,
                                    description:'優惠上限金額',
                                    values: this.single_number,
                                    limit: this.single_limit_number
                                  },
                                  {
                                    name: '每人限定次數',
                                    status: this.checked_user,
                                    condtion: this.useractivestatus,
                                    description: '優惠上限金額',
                                    values: this.user_number,
                                    limit: this.user_limit_number
                                  },
                                  { name: '期限限定期間',
                                    status:this.checked_time,
                                    values:this.range,
                                    condtion:true,
                                  },
                                  { name: '特定店活動(店名)',
                                    status:this.checked_ps,
                                    values: this.store_name,
                                    condtion:true,
                                  },
                                  { name: '特定產品活動(產品編號)',
                                    status: this.checked_pi,
                                    values: this.item_name,
                                    condtion:true,
                                  }]
          this.active_content =[];
          let active_condition_sort = active_condition.filter( function(item, index, array){
              return item.status === true
          })
          if (this.activename !=="" && active_condition_sort.length > 1){
              this.active_content = active_condition_sort
              console.log(this.active_content)
          }else{
            alert('至少填個名稱 或是 少填了條件喔')
          }
        }
      },
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
                let oneDay = 24 * 60 * 60 * 1000 
                this.time_delta =Math.round(Math.abs(this.range[1] - this.range[0])/oneDay)
                console.log(this.time_delta)
                console.log(this.range)
          },
          store_choice(){
          },
          item_choice(){
            if (this.particularitem === 'Yes'){
                this.particularitemstatus = true;
            } else{
                this.particularitemstatus = false;
            } 
          }
      }
    })
})