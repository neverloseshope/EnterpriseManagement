import Vue from 'vue'
import App from './App.vue'
import router from './router'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import './assets/gloable.css'
import store from "@/store";
import request from "@/utils/request";

Vue.config.productionTip = false

Vue.use(ElementUI,{size:'mini'});

Vue.prototype.request = request
// 全局定义axios,这样this.request就是我们的axios实例

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
