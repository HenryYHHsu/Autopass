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
          time: new Date().getTime(),
          range: [new Date().getTime(), new Date().getTime()],
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
          active_condition_content:[],
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
          let active_condition = [{ name: '活動總數量',
                                    symbol:0,
                                    status: this.checked_single,
                                    condition:this.singleactivestatus,
                                    values: [this.single_number,this.single_limit_number],
                                  },
                                  {
                                    name: '每人限定次數',
                                    symbol:1,
                                    status: this.checked_user,
                                    condition: this.useractivestatus,
                                    values: [this.user_number,this.user_limit_number]
                                  },
                                  { name: '期限限定期間',
                                    symbol:2,
                                    status:this.checked_time,
                                    values: [this.range[0],this.range[1]]
                                  },
                                  { name: '特定店活動(店名)',
                                    symbol:3,
                                    status:this.checked_ps,
                                    values: [this.store_name],
                                  },
                                  { name: '特定產品活動(產品編號)',
                                    symbol:4,
                                    status: this.checked_pi,
                                    values: [this.item_name],
                                  }]
          this.active_condition_content =[];
          let active_condition_sort = active_condition.filter( function(item, index, array){
              return item.status === true
          })
          if (this.activename !=="" && active_condition_sort.length > 0){
              this.active_condition_content = active_condition_sort
              console.log(this.active_condition_content)
          }else{
            alert('至少填個名稱 或是 少填了條件喔')
          }
        },
        create_content: function(){
          let active_content_select =[{ name: '活動A:滿額折現',
                                        status: this.checked_a,
                                        symbol: 0,
                                        content: this.money_discount,
                                        value:[this.money_discount_target,this.money_discount_cash,this.money_discount_percent]
                                      },
                                      { name: '活動B:滿額免運',
                                        status: this.checked_b,
                                        symbol: 1,
                                        value:[this.free_delivery_target]
                                      },
                                      { name: '活動C:滿額送禮',
                                        status: this.checked_c,
                                        symbol: 2,
                                        value: [this.extra_bonus_target]
                                      },
                                      { name: '活動D:特定店優惠',
                                        status: this.checked_d,
                                        symbol:3,
                                        content: this.ps,
                                        value:[this.ps_target, this.ps_cash, this.ps_percent]
                                      },
                                      { name: '活動E:特定商品優惠',
                                        status: this.checked_e,
                                        symbol:4,
                                        content: this.pi,
                                        value:[this.pi_target, this.pi_cash, this.pi_percent]
                                      }]     
          this.active_content= active_content_select.filter( function(item, index, array){
          return item.status === true
          })
          if(this.activestatus === true && this.active_content.length > 0 ){
          let active_hash = {
              name: this.activename,
              condition: this.active_condition_content,
              content: this.active_content
          }
          var self = this ;
             axios.post("http://localhost:3000/actives",active_hash)
                  .then(function(response){
                    console.log(response)
                  } )  



          }else{
            alert('請建立活動條件或是勾選活動內容')
          }
        },
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
                // this.time_delta =Math.round(Math.abs(this.range[1] - this.range[0])/oneDay)
                
                // console.log(this.time_delta)
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