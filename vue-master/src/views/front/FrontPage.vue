<template >
    <div id="container" style="overflow-y: hidden">
      <el-backtop :bottom="60" right="80" style="font-size: 35px"></el-backtop>
      <section id="img1" class="img">
        <span style="text-align: center;position: relative;right: -305px;top: -50px">Sparks Fly
          <div style="font-size: 25px">
            <el-button type="primary"  plain circle style="width: 60px;height: 60px" @click="$router.push('/login')">
              <i class="el-icon-s-custom" style="font-size: 34px"></i>
            </el-button>

          </div>
        </span>
        <div style="position: relative;bottom: -190px;left: -680px">
          <span style="font-size: 27px">公司简介</span>
          <div style="border-bottom: 6px solid white;width: 300px">
          </div>
          <div style="font-size: 10px">
            <br>
            我们的愿景：成为技术人交流和成长的家园 <br>
            中国开发者社区(Chinese Software Developer Network) 创立于1999年，致力于成为IT技术人交流和成长的家园 <br>
            截至2020年11月，CSDN拥有超过3100万注册会员，Alexa全球网站综合排名第26位<br>
            社区技术文章累计超过3600万篇，新媒体公众号粉丝总量2000万，合作上千家科技公司 <br>
          </div>
        </div>
      </section>
      <section id="content1">
        <span style="font-size: 50px;color: brown">
          本网站立足于中华人民共和国，致力于为全球中小企业提供网络服务
<!--           <el-button type="primary"  style="font-size: 30px;">购物中心</el-button>-->
           <router-link to="/login" style="text-decoration: none;font-size: 20px;
           position: relative;
           right: -1400px;
           bottom: -180px;">       管管方处理中心
           </router-link>
        </span>
      </section>
      <section id="img2" class="img"><span style="font-size: 55px;position: relative;left: -450px;bottom: -320px">
      招纳贤士</span>
      </section>
      <section id="content2">
        <div>
          <el-menu mode="horizontal" style="width: 1010px;position: relative;top: -50px;right: -470px">
            <el-menu-item>
              <img src="../../assets/job_dev.png" alt="java" width="70px" height="70px">
              <span style="position: relative;top: -25px;right: -5px">高级java研发工程师</span>
              <span style="position: relative;left: -120px;bottom: -10px">长沙&nbsp;&nbsp;|&nbsp;&nbsp;java
              </span>
            </el-menu-item>
            <el-menu-item>
              <img src="../../assets/job_dev.png" alt="java" width="70px" height="70px">
              <span style="position: relative;top: -25px;right: -5px">高级前端研发工程师</span>
              <span style="position: relative;left: -120px;bottom: -10px">长沙&nbsp;&nbsp;|&nbsp;&nbsp;web
              </span>
            </el-menu-item>
            <el-menu-item>
              <img src="../../assets/job_dev.png" alt="java" width="70px" height="70px">
              <span style="position: relative;top: -25px;right: -5px">测试开发工程师</span>
              <span style="position: relative;left: -90px;bottom: -10px">长沙&nbsp;&nbsp;|&nbsp;&nbsp;python
              </span>
            </el-menu-item>
            <el-menu-item>
              <img src="../../assets/job_ui.png" alt="java" width="70px" height="70px">
              <span style="position: relative;top: -20px;right: -5px">UI设计师</span>
              <span style="position: relative;left: -50px;bottom: -10px">长沙&nbsp;&nbsp;|&nbsp;&nbsp;UI</span>
            </el-menu-item>
          </el-menu>
        </div>
        <div>
          <el-menu mode="horizontal" style="position: relative;bottom: -50px;left: -539px;width: 1010px">
            <el-menu-item>
              <img src="../../assets/job_ui.png" alt="java" width="70px" height="70px">
              <span style="position: relative;top: -25px;right: -5px">高级UE研发工程师</span>
              <span style="position: relative;left: -110px;bottom: -10px">北京&nbsp;&nbsp;|&nbsp;&nbsp;UE
              </span>
            </el-menu-item>
            <el-menu-item style="position: relative;right: -15px">
              <img src="../../assets/job_ed.png" alt="java" width="70px" height="70px">
              <span style="position: relative;top: -25px;right: -5px">记者编辑</span>
              <span style="position: relative;left: -50px;bottom: -10px">北京&nbsp;&nbsp;|&nbsp;&nbsp;编辑
              </span>
            </el-menu-item>
            <el-menu-item style="position: relative;right: -85px">
              <img src="../../assets/job_ed.png" alt="java" width="70px" height="70px">
              <span style="position: relative;top: -25px;right: -5px">高级策划编辑</span>
              <span style="position: relative;left: -80px;bottom: -10px">北京&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;编辑
              </span>
            </el-menu-item>
            <el-menu-item style="position: relative;right: -115px">
              <img src="../../assets/job_pro.png" alt="java" width="70px" height="70px">
              <span style="position: relative;top: -25px;right: -5px">项目经理</span>
              <span style="position: relative;left: -50px;bottom: -10px">北京&nbsp;&nbsp;|&nbsp;&nbsp;项目
              </span>
            </el-menu-item>
          </el-menu>
        </div>
      </section>
      <section id="img3" class="img">
        <span style="font-size: 55px;position: relative;left: -450px;bottom: -320px">
      联系方式</span>
      </section>
      <section id="footer">
        <div style="font-size: 20px">
          <img src="../../assets/rectangle@2x.jpg" alt="" width="900" height="400"
               style="position: relative;top: -115px;">
          <h2 style="color: black;position: relative;top: -105px">地址</h2>
          <hr style="position: relative;top: -95px">
          <p style="color: black;position: relative;top: -80px">
            北京市朝阳区酒仙桥路101号恒通商务园B8B二层
          </p>
          <h2 style="color: black;position: relative;top: -50px">法务</h2>
          <hr style="position: relative;top: -40px">
          <p style="color: black;position: relative;top: -25px">
            2729627149@qq.com
          </p>
          <h2 style="color: black;position: relative;top: 0px;bottom: -5px">商务合作</h2>
          <hr style="position: relative;bottom: -15px">
          <p style="color: black;position: relative;bottom: -29px">
            13564257841
          </p>
        </div>
      </section>
    </div>
</template>

<script>
export default {
  name: "FrontPage",
  data() {
    return {
      activeIndex2 : '1'
    }
  },
  methods :{
    handleSelect(key, keyPath){
      console.log(key, keyPath);
    }
  }
}
</script>

<style scoped>
*{
  padding: 0;
  margin: 0;
}
::-webkit-scrollbar{
  display: none;
}
#container{
  width: 100vw;
  height: auto;
}
section{
  height: 100vh;
  background-color: #c4cbcf;
  color: #fff;
  font-size: 20vh;
  display: flex;
  justify-content: center;
  align-items: center;
}
.img{
  background-size: auto;
  background-position: center;
  overflow: hidden;
  background-attachment: fixed;
  background-repeat: no-repeat;
  max-width: 100%;
  user-select: none;
  cursor: default;
}
#img1{
  background-image: url("../../assets/1.jpeg");
}
#img2{
  background-image: url("../../assets/2.jpg");
}
#img3{
  background-image: url("../../assets/3.jpg");
}
#content1{
  background-color: #f9f4dc;
  height: 500px;
}
#content2{
  background-color: #F2F6FC;
  height: 217px;
}
#footer{
  background-color: #F2F6FC;
}
</style>