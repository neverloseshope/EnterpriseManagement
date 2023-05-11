<template>
  <div class="home" style="height: 100%">
    <el-container style="height: 100%; ">
      <el-aside :width="sideWidth+'px'" style="background-color: rgb(238, 241, 246); height: 100%; overflow: hidden; box-shadow: 2px 0 6px rgb(0 21 41 / 35%) ">
        <Aside :isCollapse="isCollapse" :logoTextShow="logoTextShow" :menus="user.menus" />
      </el-aside>

      <el-container>
        <el-header style="border-bottom: 1px solid #ccc; ">
          <Header :collapseBtnClass="collapseBtnClass" :collapse="collapse" />
        </el-header>
        <el-main>
          <!--        表示当前页面的子路由会在 <router-view /> 里面展示-->
          <router-view/>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
// import request from "@/utils/request";
import Aside from "@/components/Aside";
import Header from "@/components/Header";

export default {
  name: 'Manage',
  data() {
    return {
      collapseBtnClass: 'el-icon-s-fold',
      isCollapse: false,
      sideWidth: 200,
      logoTextShow: true,
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}
    }
  },
  components: {
    Aside,
    Header
  },
  methods:{
    collapse() {  // 点击收缩按钮触发
      this.isCollapse = !this.isCollapse
      if (this.isCollapse) {  // 收缩
        this.sideWidth = 49
        this.collapseBtnClass = 'el-icon-s-unfold'
        this.logoTextShow = false
      } else {   // 展开
        this.sideWidth = 200
        this.collapseBtnClass = 'el-icon-s-fold'
        this.logoTextShow = true
      }
    }
  }
}
</script>