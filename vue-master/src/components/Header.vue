<template>
  <div style="line-height: 60px; display: flex">
    <div style="flex: 1;">
      <span :class="collapseBtnClass" style="cursor: pointer; font-size: 18px" @click="collapse"></span>

      <el-breadcrumb separator="/" style="display: inline-block; margin-left: 10px">
        <el-breadcrumb-item :to="'/home'">首页</el-breadcrumb-item>
        <el-breadcrumb-item>{{currentPathName}}</el-breadcrumb-item>
      </el-breadcrumb>
    </div>
    <el-dropdown style="width: 100px; cursor: pointer">
      <div style="display: inline-block">
        <img :src="user.avatarUrl" alt=""
             @click="open"  style="width: 40px;height: 40px; border-radius: 50%; position: relative; top: 10px; right: 30px">
        <span style="color: black;position: relative;left: -20px" @click="open">{{ user.nickname }}</span><i  @click="open" class="el-icon-caret-bottom" style="font-size: 18px;position:relative;left: -17px" ></i>
      </div>
    </el-dropdown>
    <el-dialog  :visible.sync="openDialog" width="31%" height="50%" style="opacity: 0.5;background-color: #C0C4CC">
      <div>
        <el-image :src="user.avatarUrl"  style="width: 140px;height: 140px;
        border-radius: 50%;border: 5px solid brown;
        position: relative;right: -155px " title="个人头像">
        </el-image>
      </div>
      <div>
        <el-button @click="openDialog = false" style="font-size: 30px;position: relative;right: -115px" type="primary" plain>
          <i class="el-icon-lock"> </i>
          <router-link to="/modify" style="text-decoration: none;color:black">
            密 码 修 改
          </router-link>
        </el-button>
      </div>
      <div>
        <el-button @click="openDialog = false" style="font-size: 30px;position: relative;right: -115px" type="primary" plain>
          <i class="el-icon-user-solid"> </i>
          <router-link to="/person" style="text-decoration: none;color:black">
            个 人 信 息
          </router-link>
        </el-button>
      </div>
      <div>
        <el-button @click="openDialog = false" style="width:120px;font-size: 30px;position: relative;right: -161px" type="danger" plain>
          <span @click="logout" style="text-decoration: none;color:black" to>
            退出
            <i class="el-icon-circle-close"></i>
          </span>
        </el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "Header",
  props: {
    collapseBtnClass: String,
    collapse: Function,
  },
  computed:{
    currentPathName(){
      return this.$store.state.currentPathName;
    }
  },
  data() {
    return {
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {},
      openDialog:false
    }
  },
  methods:{
    logout() {
      this.$router.replace("/front")
      localStorage.removeItem("user")
      localStorage.removeItem("menus")
      this.$message.success("退出成功")
    },
    open(){
      this.openDialog = true;
    }
  }
}
</script>

<style scoped>

</style>

