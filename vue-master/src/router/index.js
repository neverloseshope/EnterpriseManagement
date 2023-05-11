import Vue from 'vue'
import VueRouter from 'vue-router'
import store from "@/store";

Vue.use(VueRouter)

const routes = [
  // {
  //   path: '',
  //   component: () => import('../views/Manage'),
  //   redirect:'/login',
  //   children:[
  //     {
  //       path:'home',
  //       name:'首页',
  //       component:() => import('../views/Home')
  //     }, {
  //       path:'user',
  //       name:'员工管理',
  //       component:() => import('../views/User')
  //     }, {
  //       path:'person',
  //       name:'个人信息',
  //       component:() => import('../views/Person')
  //     }, {
  //       path:'file',
  //       name:'文件管理',
  //       component:() => import('../views/File')
  //     }, {
  //       path:'role',
  //       name:'角色管理',
  //       component:() => import('../views/Role')
  //     }, {
  //       path:'menu',
  //       name:'菜单管理',
  //       component:() => import('../views/Menu')
  //     }, {
  //       path:'modify',
  //       name:'密码修改',
  //       component:() => import('../views/Modify')
  //     }
  //   ]
  {
    path:'',
    redirect:'/front'
  },
  {
    path:'/login',
    name:'登录',
    component: () => import('../views/Login')
  }, {
    path:'/register',
    name:'注册',
    component: () => import('../views/Register')
  }, {
    path:'*',
    name:'404',
    component: () => import('../views/404')
  }, {
    path: '/front',
    name: '企业官网',
    component: () => import('../views/front/FrontPage')
  }

]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})
// 注意：刷新页面会导致页面路由重置
export const setRoutes = () => {
  const storeMenus = localStorage.getItem("menus");
  if (storeMenus) {
    // 拼装动态路由
    const manageRoute = { path: '', name: 'Manage', component: () => import('../views/Manage.vue'), redirect: "/front", children: [] }
    const menus = JSON.parse(storeMenus)
    menus.forEach(item => {
      if (item.path) {  // 当且仅当path不为空的时候才去设置路由
        let itemMenu = { path: item.path.replace("/", ""), name: item.name, component: () => import('../views/' + item.pagePath + '.vue')}
        manageRoute.children.push(itemMenu)
      } else if(item.children.length) {
        item.children.forEach(item => {
          if (item.path) {
            let itemMenu = { path: item.path.replace("/", ""), name: item.name, component: () => import('../views/' + item.pagePath + '.vue')}
            manageRoute.children.push(itemMenu)
          }
        })
      }
    })

    // 获取当前的路由对象名称数组
    const currentRouteNames = router.getRoutes().map(v => v.name)
    if (!currentRouteNames.includes('Manage')) {
      // 动态添加到现在的路由对象中去
      router.addRoute(manageRoute)
    }
  }
}

// 重置我就再set一次路由
setRoutes()


router.beforeEach((to, from, next) =>{
  window.document.title = to.name
  store.state.currentPathName = to.name
  next();
})

export default router
