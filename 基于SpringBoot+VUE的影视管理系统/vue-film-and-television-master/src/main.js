import Vue from 'vue'
import App from './App.vue'
import router from '@/router/index'
import Element from 'element-ui'
import { Swipe, SwipeItem } from 'vant';
import 'element-ui/lib/theme-chalk/index.css';

Vue.use(Swipe);
Vue.use(SwipeItem);
Vue.use(Element);

Vue.config.productionTip = false
import '@/assets/styles/reset.css';
import "lib-flexible"

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')
