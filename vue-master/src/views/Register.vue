<template>
  <div class="wrapper">
    <div style="height: 0px;opacity: 0.5;" >
      <h2 style="color: #E6A23C;position:relative;right: -70px;bottom: -8px;background-color: black;width: 196px;height: 42px;line-height: 42px">企业员工管理系统</h2>
      <img src="../assets/zr.jpeg" alt="" width="57" style="position: relative;top: -35px;right:-13px;opacity: 0.8" >
    </div>
    <div style="margin: 100px auto; background-color: black;opacity: 0.5; width: 350px; height: 400px; padding: 20px; border-radius: 10px">
      <div style="margin: 20px 0; text-align: center; font-size: 24px;color: #9713cb;"><b>Register</b></div>
      <el-form :model="user" :rules="rules" ref="userForm">
        <el-form-item prop="username">
          <el-input placeholder="请输入账号" size="medium" style="opacity:0.5;margin: 5px 0" prefix-icon="el-icon-user" v-model="user.username"></el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input placeholder="请输入密码" size="medium" style="opacity:0.5;margin: 5px 0" prefix-icon="el-icon-lock" show-password v-model="user.password"></el-input>
        </el-form-item>
        <el-form-item prop="confirmPassword">
          <el-input placeholder="请确认密码" size="medium" style="opacity:0.5;margin: 5px 0" prefix-icon="el-icon-lock" show-password v-model="user.confirmPassword"></el-input>
        </el-form-item>
        <el-form-item style="margin: 5px 0; text-align: right">
          <el-button type="primary" plain size="small"  autocomplete="off" @click="register">注册</el-button>
          <el-button type="warning" plain size="small"  autocomplete="off" @click="$router.push('/login')">返回登录</el-button>
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
        confirmPassword: [
          { required: true, message: '请确认密码', trigger: 'blur' },
          { min: 6, max: 20, message: '长度在 6 到 20 个字符', trigger: 'blur' }
        ],
      }
    }
  },
  methods: {
    register() {
      this.$refs['userForm'].validate((valid) => {
        if (valid) {  // 表单校验合法
          if (this.user.password !== this.user.confirmPassword) {
            this.$message.error("两次输入的密码不一致")
            return false
          }
          this.request.post("/user/register", this.user).then(res => {
            if(res.code === '200') {
              this.$message.success("注册成功,请返回登录")
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
