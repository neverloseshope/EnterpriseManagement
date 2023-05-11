<template>
  <div>
    <el-row style="margin-bottom: 25px">
      <el-col :span="8">
        <el-card
          style="
            background-color: #409eff;
            width: 419px;
            height: 150px;
            border-radius: 3%;
          "
        >
          <h2 style="margin: 0">权限管理</h2>
          <div style="margin: 0; margin-top: 5px; color: black">
            Faster and easier
          </div>
          <i
            class="el-icon-edit"
            style="
              position: relative;
              right: -350px;
              top: -20px;
              font-size: 30px;
            "
          ></i>
          <el-button
            type="primary"
            plain
            style="
              opacity: 0.5;
              position: relative;
              bottom: -19px;
              left: -20px;
              width: 429px;
            "
            @click="toData1"
            >&nbsp;&nbsp;&nbsp;<i
              class="el-icon-position"
              style="font-size: 15px"
            ></i>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</el-button
          >
        </el-card>
      </el-col>
      <el-col :span="8">
        <el-card
          style="
            background-color: #67c23a;
            width: 419px;
            height: 150px;
            border-radius: 3%;
          "
        >
          <h2 style="margin: 0">数据报表</h2>
          <div style="margin: 0; margin-top: 5px; color: black">
            Faster and easier
          </div>
          <i
            class="el-icon-s-data"
            style="
              position: relative;
              right: -350px;
              top: -20px;
              font-size: 30px;
            "
          ></i>
          <el-button
            type="success"
            plain
            style="
              opacity: 0.5;
              position: relative;
              bottom: -19px;
              left: -20px;
              width: 429px;
            "
            @click="toData2"
            >&nbsp;&nbsp;&nbsp;<i
              class="el-icon-position"
              style="font-size: 15px"
            ></i>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</el-button
          >
        </el-card>
      </el-col>
      <el-col :span="8">
        <el-card
          style="
            background-color: #e6a23c;
            width: 419px;
            height: 150px;
            border-radius: 3%;
          "
        >
          <h2 style="margin: 0">文件管理</h2>
          <div style="margin: 0; margin-top: 5px; color: black">
            Faster and easier
          </div>
          <i
            class="el-icon-collection"
            style="
              position: relative;
              right: -350px;
              top: -20px;
              font-size: 30px;
            "
          ></i>
          <el-button
            type="warning"
            @click="toData3"
            plain
            style="
              opacity: 0.5;
              position: relative;
              bottom: -19px;
              left: -20px;
              width: 429px;
            "
            >&nbsp;&nbsp;&nbsp;<i
              class="el-icon-position"
              style="font-size: 15px"
            ></i>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</el-button
          >
        </el-card>
      </el-col>
    </el-row>
    <el-row>
      <el-col :span="8">
        <el-card
          style="
            background-color: #f56c6c;
            width: 419px;
            height: 149px;
            border-radius: 3%;
          "
        >
          <h2 style="margin: 0">企业简聊</h2>
          <div style="margin: 0; margin-top: 5px; color: black">
            Faster and easier
          </div>
          <i
            class="el-icon-chat-dot-round"
            style="
              position: relative;
              right: -350px;
              top: -20px;
              font-size: 30px;
            "
          ></i>
          <el-button
            type="danger"
            plain
            style="
              opacity: 0.5;
              position: relative;
              bottom: -20px;
              left: -20px;
              width: 429px;
            "
            @click="toData4"
            >&nbsp;&nbsp;&nbsp;<i
              class="el-icon-position"
              style="font-size: 15px"
            ></i>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</el-button
          >
        </el-card>
      </el-col>
      <el-col :span="8">
        <el-card
          style="
            background-color: blue;
            width: 419px;
            height: 149px;
            border-radius: 3%;
          "
        >
          <h2 style="margin: 0">公司地址</h2>
          <div style="margin: 0; margin-top: 5px; color: black">
            Faster and easier
          </div>
          <i
            class="el-icon-map-location"
            style="
              position: relative;
              right: -350px;
              top: -20px;
              font-size: 30px;
            "
          ></i>
          <el-button
            type="primary"
            plain
            style="
              opacity: 0.5;
              position: relative;
              bottom: -19px;
              left: -20px;
              width: 429px;
            "
            @click="toData5"
            >&nbsp;&nbsp;&nbsp;<i
              class="el-icon-position"
              style="font-size: 15px"
            ></i>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</el-button
          >
        </el-card>
      </el-col>
      <el-col :span="8">
        <el-card
          style="
            background-color: #303133;
            width: 419px;
            height: 149px;
            border-radius: 3%;
          "
        >
          <h2 style="margin: 0; color: black">系统设置</h2>
          <div style="margin: 0; margin-top: 5px; color: black">
            Faster and easier
          </div>
          <i
            class="el-icon-s-tools"
            style="
              color: black;
              position: relative;
              right: -350px;
              top: -20px;
              font-size: 30px;
            "
          ></i>
          <el-button
            type="info"
            @click="toData6"
            plain
            style="
              opacity: 0.5;
              position: relative;
              bottom: -19px;
              left: -20px;
              width: 429px;
            "
            >&nbsp;&nbsp;&nbsp;<i
              class="el-icon-position"
              style="font-size: 15px"
            ></i>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</el-button
          >
        </el-card>
      </el-col>
    </el-row>
    <el-dialog
      title=""
      :visible.sync="dialogFormVisible"
      width="64%"
      style="padding: 0; margin: 0; height: 724px; overflow-y: hidden"
    >
      <div style="position: relative; top: -60px">
        <el-row>
          <el-col :span="4">
            <el-card
              style="
                width: 180px;
                height: 603px;
                color: #333;
                background-color: #303133;
                opacity: 0.9;
                position: relative;
                left: -26px;
                top: -1px;
              "
            >
              <!--              <img v-if="user1.avatarUrl" :src="user1.avatarUrl"  class="avatar" width="40px" height="40px"-->
              <!--                   style="padding: 0px;position: relative;top: -16px;left: -7px">-->
              <span
                style="
                  color: #133ecb;
                  font-size: 18px;
                  position: relative;
                  padding: 5px 0;
                  right: -10px;
                  left: -5px;
                  top: -15px;
                "
                ><el-input
                  style="width: 150px"
                  placeholder="请输入名称"
                  suffix-icon="el-icon-search"
                ></el-input>
              </span>
              <div
                style="
                  padding-bottom: 10px;
                  position: relative;
                  top: -15px;
                  left: -13px;
                  margin-bottom: 3px;
                  border-bottom: 2px solid rgba(1, 1, 1, 0.63);
                  width: 220px;
                  color: #0d40e7;
                  font-weight: bolder;
                "
              >
                <span style="font-size: 12px"></span>
              </div>
              <div
                style="
                  padding: 1px 0;
                  background-color: #ebeef5;
                  margin: 0;
                  opacity: 1;
                  width: 200px;
                  position: relative;
                  left: -15px;
                  top: -18px;
                "
                v-for="user in users"
                :key="user.username"
                @click="chatUser = user.username"
              >
                <img
                  v-if="user1.avatarUrl"
                  :src="user1.avatarUrl"
                  class="avatar"
                  width="50px"
                  height="50px"
                  alt=""
                  style="
                    border: 1px solid white;
                    position: relative;
                    top: 0px;
                    left: 0px;
                    margin: 0;
                  "
                />
                <span
                  style="
                    color: rgba(1, 1, 1, 0.63);
                    position: relative;
                    top: -30px;
                    right: -10px;
                  "
                  >{{ user.username }}</span
                >
                <div style="border-bottom: 1px solid black"></div>
                <!--                <i class="el-icon-chat-dot-round" style="margin-left: 10px;position: relative;-->
                <!--                top: -32px;-->
                <!--                 font-size: 16px; cursor: pointer;color: #0b31ee"-->
                <!--                   @click="chatUser = user.username"></i>-->
                <!--                <span style="color: #09de0d;font-size: 12px; margin-left: 5px" v-if="user.username === chatUser"></span>-->
              </div>
            </el-card>
          </el-col>
          <el-col :span="20">
            <div
              style="
                width: 800px;
                margin: 0 auto;
                background-color: white;
                border-radius: 5px;
                box-shadow: 0 0 10px #ccc;
              "
            >
              <div
                style="text-align: center; line-height: 50px; font-size: 20px"
              >
                {{ chatUser }}
                <el-button style="opacity: 0.1"> </el-button>
              </div>
              <div
                style="
                  height: 350px;
                  overflow: auto;
                  border-top: 1px solid #ccc;
                  background-color: #e4e7ed;
                "
                v-html="content"
              ></div>
              <div style="height: 200px">
                <textarea
                  v-model="text"
                  style="
                    overflow-y: hidden;
                    height: 160px;
                    width: 755px;
                    padding: 20px;
                    border: none;
                    border-top: 1px solid #ccc;
                    border-bottom: 1px solid #ccc;
                    outline: none;
                    font-size: 25px;
                  "
                  class="el-textarea_inner"
                >
                </textarea>
                <div style="text-align: right; padding-right: 10px">
                  <el-upload
                    action="http://localhost:9090/file/upload"
                    :show-file-list="false"
                    :on-success="handleFileUploadSuccess"
                    style="display: inline-block"
                  >
                    <el-button
                      type="primary"
                      size="mini"
                      plain
                      style="
                        position: relative;
                        top: -42px;
                        left: -1px;
                        font-size: 18px;
                      "
                    >
                      上传文件
                    </el-button>
                  </el-upload>
                  <el-button
                    type="success"
                    size="mini"
                    @click="send"
                    plain
                    style="
                      position: relative;
                      top: -43px;
                      right: -1px;
                      font-size: 18px;
                    "
                  >
                    发送</el-button
                  >
                  <el-button
                    type="danger"
                    size="mini"
                    @click="dialogFormVisible = false"
                    plain
                    style="
                      position: relative;
                      top: -43px;
                      right: -1px;
                      font-size: 18px;
                    "
                  >
                    关闭</el-button
                  >
                </div>
              </div>
            </div>
          </el-col>
        </el-row>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import request from "@/utils/request";
let socket;
export default {
  name: "Home",
  data() {
    return {
      dialogFormVisible: false,
      // user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}
      circleUrl:
        "https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png",
      user: {},
      isCollapse: false,
      users: [],  
      chatUser: "",
      text: "",
      messages: [],
      content: "",
      user1: localStorage.getItem("user")
        ? JSON.parse(localStorage.getItem("user"))
        : {},
      person: {},
    };
  },
  created() {
    this.init();
    for (let i = 0; i < this.users.length; i++) {
      this.request.get("/user/" + this.users[i].username).then((res) => {
        if (res.code === "200") {
          this.users[i].avatarUrl = res.data.avatarUrl;
          console.log(this.users + "1111111111111111111111");
        }
      });
    }
  },
  methods: {
    handleFileUploadSuccess() {},
    toData1() {
      if (this.user.role == 1) {
        this.$router.push("/role");
      } else {
        this.$message({ type: "warning", message: "抱歉！您没有访问此功能的权限"});
      }
    },
    toData2() {
      if (this.user.role == 1 || this.user.role == 5) {
        this.$router.push("/data");
      } else {
        this.$message({ type: "warning", message: "抱歉！您没有访问此功能的权限"});
      }
    },
    toData3() {
      this.$router.push("/file");
    },
    toData4() {
      this.dialogFormVisible = true;
    },
    toData5() {
      this.$router.push("/china");
    },
    toData6() {
      if (this.user.role == 1) {
        this.$router.push("/menu");
      } else {
        this.$message({ type: "warning", message: "抱歉！您没有访问此功能的权限"});
      }
    },
    send() {
      if (!this.chatUser) {
        this.$message({ type: "warning", message: "请选择聊天对象" });
        return;
      }
      if (!this.text) {
        this.$message({ type: "warning", message: "请输入内容" });
      } else {
        if (typeof WebSocket == "undefined") {
          console.log("您的浏览器不支持WebSocket");
        } else {
          console.log("您的浏览器支持WebSocket");
          // 组装待发送的消息 json
          // {"from": "zhang", "to": "admin", "text": "聊天文本"}
          let message = {
            from: this.user.username,
            to: this.chatUser,
            text: this.text,
          };
          socket.send(JSON.stringify(message)); // 将组装好的json发送给服务端，由服务端进行转发
          this.messages.push({ user: this.user.username, text: this.text });
          // 构建消息内容，本人消息
          this.createContent(null, this.user.username, this.text);
          this.text = "";
        }
      }
    },
    createContent(remoteUser, nowUser, text) {
      // 这个方法是用来将 json的聊天消息数据转换成 html的。
      let html;
      // 当前用户消息
      if (nowUser) {
        // nowUser 表示是否显示当前用户发送的聊天消息，绿色气泡
        html =
          '<div class="el-row" style="padding: 5px 0">\n' +
          '  <div class="el-col el-col-22" style="text-align: right; padding-right: 10px">\n' +
          '    <div class="tip left">' +
          text +
          "</div>\n" +
          "  </div>\n" +
          '  <div class="el-col el-col-2">\n' +
          '  <span class="el-avatar el-avatar--circle" style="height: 40px; width: 40px; line-height: 40px;">\n' +
          '    <img src="https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png" style="object-fit: cover;">\n' +
          "  </span>\n" +
          "  </div>\n" +
          "</div>";
      } else if (remoteUser) {
        // remoteUser表示远程用户聊天消息，蓝色的气泡
        html =
          '<div class="el-row" style="padding: 5px 0">\n' +
          '  <div class="el-col el-col-2" style="text-align: right">\n' +
          '  <span class="el-avatar el-avatar--circle" style="height: 40px; width: 40px; line-height: 40px;">\n' +
          '    <img src="https://cube.elemecdn.com/3/7c/3ea6beec64369c2642b92c6726f1epng.png" style="object-fit: cover;">\n' +
          "  </span>\n" +
          "  </div>\n" +
          '  <div class="el-col el-col-22" style="text-align: left; padding-left: 10px">\n' +
          '    <div class="tip right">' +
          text +
          "</div>\n" +
          "  </div>\n" +
          "</div>";
      }
      console.log(html);
      this.content += html;
    },
    init() {
      this.user = localStorage.getItem("user")
        ? JSON.parse(localStorage.getItem("user"))
        : {};
      let username = this.user.username;
      let _this = this;
      if (typeof WebSocket == "undefined") {
        console.log("您的浏览器不支持WebSocket");
      } else {
        console.log("您的浏览器支持WebSocket");
        let socketUrl = "ws://localhost:9090/imserver/" + username;
        if (socket != null) {
          socket.close();
          socket = null;
        }
        // 开启一个websocket服务
        socket = new WebSocket(socketUrl);
        //打开事件
        socket.onopen = function () {
          console.log("websocket已打开");
        };
        //  浏览器端收消息，获得从服务端发送过来的文本消息
        socket.onmessage = function (msg) {
          console.log("收到数据====" + msg.data);
          let data = JSON.parse(msg.data); // 对收到的json数据进行解析， 类似这样的： {"users": [{"username": "zhang"},{ "username": "admin"}]}
          if (data.users) {
            // 获取在线人员信息

            _this.users = data.users.filter(
              (user) => user.username !== username
            );
            // 获取当前连接的所有用户信息，并且排除自身，自己不会出现在自己的聊天列表里
          } else {
            // 如果服务器端发送过来的json数据 不包含 users 这个key，那么发送过来的就是聊天文本json数据
            //  // {"from": "zhang", "text": "hello"}
            if (data.from === _this.chatUser) {
              _this.messages.push(data);
              // 构建消息内容
              _this.createContent(data.from, null, data.text);
            }
          }
        };
        //关闭事件
        socket.onclose = function () {
          console.log("websocket已关闭");
        };
        //发生了错误事件
        socket.onerror = function () {
          console.log("websocket发生了错误");
        };
      }
    },
  },
};
</script>

<style >
.tip {
  color: white;
  text-align: center;
  border-radius: 10px;
  font-family: sans-serif;
  padding: 10px;
  width: auto;
  display: inline-block !important;
  display: inline;
}
.right {
  background-color: deepskyblue;
}
.left {
  background-color: forestgreen;
}
.el-textarea_inner {
  resize: none;
}
</style>