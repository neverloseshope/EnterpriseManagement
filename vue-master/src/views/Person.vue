<template>
  <el-card style="width: 500px;padding: 20px;box-shadow: 5px 5px #EBEEF5" >
    <el-form label-width="80px" size="small" >
      <el-form-item label="头像">
        <el-upload
            class="avatar-uploader"
            action="http://localhost:9090/file/upload"
            :show-file-list="false"
            :on-success="handleAvatarSuccess"
        >
          <img v-if="form.avatarUrl" :src="form.avatarUrl" title="点击更改" class="avatar" width="200px" style="padding: 10px;border: 5px solid brown">
          <i v-else class="el-icon-plus avatar-uploader-icon" style="padding: 10px;border: 5px solid brown"></i>
        </el-upload>
      </el-form-item>
      <el-form-item label="用户名">
        <el-input v-model="form.username" autocomplete="off" prefix-icon="el-icon-user" disabled></el-input>
      </el-form-item>
      <el-form-item label="昵称">
        <el-input v-model="form.nickname" autocomplete="off" prefix-icon="el-icon-user"></el-input>
      </el-form-item>
      <el-form-item label="邮箱">
        <el-input v-model="form.email" autocomplete="off" prefix-icon="el-icon-message"></el-input>
      </el-form-item>
      <el-form-item label="电话">
        <el-input v-model="form.phone" autocomplete="off" prefix-icon="el-icon-phone"></el-input>
      </el-form-item>
      <el-form-item label="地址">
        <el-input type="textarea" v-model="form.address" autocomplete="off" prefix-icon="el-icon-position"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="save">确定</el-button>
      </el-form-item>
    </el-form>
  </el-card>
</template>

<script>
export default {
  name: "Person",
  data(){
    return {
      form: {},
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}
    }
  },
  created() {
    this.request.get("/user/"+ this.user.username).then(res =>{
      if (res.code === '200'){
        this.form = res.data
        console.log(this.form);
      }
    })
  },
  methods:{
    handleAvatarSuccess(res) {
      let user = JSON.parse(localStorage.getItem("user"))
      user.avatarUrl = res
      this.form.avatarUrl = res
      localStorage.setItem("user",JSON.stringify(user))
      this.save()
      this.$router.go(0)
    },
    save(){
      this.request.post("/user/save",this.form).then(res => {
        if (res.data) {
          this.$message.success("保存成功")
        } else {
          this.$message.error("保存失败")
        }
      })
    }
  }
}
</script>

<style scoped>
.avatar-uploader {
  text-align: center;
  padding-bottom: 10px;
}
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 138px;
  height: 138px;
  line-height: 138px;
  text-align: center;
}
.avatar {
  width: 138px;
  height: 138px;
  display: block;
}
</style>