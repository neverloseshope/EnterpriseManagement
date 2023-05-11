<template>
  <div class="wrapper" >
    <div style="height: 0px;opacity: 0.5;" >
      <h2 style="color: #E6A23C;position:relative;right: -70px;bottom: -8px;background-color: black;width: 196px;height: 42px;line-height: 42px">企业员工管理系统</h2>
      <img src="../assets/zr.jpeg" alt="" width="57" style="position: relative;top: -35px;right:-13px;opacity: 0.8" >
    </div>
    <div style="margin: 200px auto; background-color: black;opacity:0.5;width: 350px; height: 300px; padding: 20px; border-radius: 10px">
      <div style="opacity:1;margin: 20px 0; text-align: center; font-size: 24px;color: #9713cb;font-weight: bolder"><b>Login</b></div>
      <el-form :model="user" :rules="rules" ref="userForm" >
        <el-form-item prop="username">
          <el-input size="medium" style="margin: 10px 0" prefix-icon="el-icon-user" v-model="user.username"></el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input size="medium" style="margin: 10px 0" prefix-icon="el-icon-lock" show-password v-model="user.password"></el-input>
        </el-form-item>
        <el-form-item style="margin: 10px 0; text-align: right">
          <el-button type="warning" plain size="small"  autocomplete="off" @click="$router.replace('/register')">前往注册</el-button>
          <el-button type="primary" plain size="small"  autocomplete="off" @click="login">登录</el-button>
        </el-form-item>
        <div>
          <router-link to="/front" style="text-decoration: none;color: blue">
            返回官网
          </router-link>
        </div>
      </el-form>
    </div>
  </div>
</template>

<script>
import {setRoutes} from "@/router";
export default {
  name: "Login",
  data() {
    return {
      user: {},
      rules: {
        username: [
          { required: true, message: '请输入用户名', trigger: 'blur' },
          { min: 3, max: 10, message: '长度在 3 到 10 个字符', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '请输入密码', trigger: 'blur' },
          { min: 6, max: 20, message: '长度在 6 到 20 个字符', trigger: 'blur' }
        ],
      }
    }
  },
  methods: {
    login() {
      this.$refs['userForm'].validate((valid) => {
        if (valid) {  // 表单校验合法
          this.request.post("/user/login", this.user).then(res => {
            if(res.code === '200') {
              localStorage.setItem("user", JSON.stringify(res.data))  // 存储用户信息到浏览器
              localStorage.setItem("menus", JSON.stringify(res.data.menus))
              // 动态设置当前用户的路由
              setRoutes()
              this.$router.replace("/home")
              this.$message.success("登录成功")
            } else {
              this.$message.error(res.msg)
            }
          })
        }
      });
    }
  }
}
</script>

<style>
.wrapper {
  height: 100vh;
  /*background-image: linear-gradient(to bottom right, #FC466B , #3F5EFB);*/
  overflow: hidden;
  background-image: url("../assets/zr3.jpg");
  background-size: 100%;
}
</style>
