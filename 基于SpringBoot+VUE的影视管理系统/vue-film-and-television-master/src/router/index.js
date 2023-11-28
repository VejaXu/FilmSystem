import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'
import History from '@/views/history/history'
import About from '@/views/notice/notice'

Vue.use(VueRouter)

//创建一个公共路由
const routers = [
  {
    path: '/historys',
    component: History,
    hidden: true
  },
  {
    path: '/notice',
    component: About
  },
  {
    path: '/login',
    component: (resolve) => require(['@/views/login/login'], resolve),
  },
  {
    path: '/',
    component: HomeView
  },
  {
    path: '/detail/:id',
    component: (resolve) => require(['@/views/detail/detail'], resolve),
    hidden: true
  },
  {
    path: '/collect',
    component: (resolve) => require(['@/views/collect/collect'], resolve),
  },
  {
    path:'/community',
    component: (resolve) => require(['@/views/community/community'], resolve),
  },
  {
    path: '/search/:title',
    component: (resolve) => require(['@/views/search/search'], resolve),
    hidden: true
  }
];

// 防止连续点击多次路由报错
let routerPush = VueRouter.prototype.push;
VueRouter.prototype.push = function push(location) {
  return routerPush.call(this, location).catch(err => err)
}

export default new VueRouter({
  base: '/',
  // mode: 'history', // 去掉url中的#
  scrollBehavior: () => ({ y: 0 }),
  routes: routers
})
