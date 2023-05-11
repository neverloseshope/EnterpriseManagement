<template>
  <div>
    <div style="margin: 10px 0">
      <el-input style="width: 200px" placeholder="请输入名称" suffix-icon="el-icon-search" v-model="name"></el-input>
      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
      <el-button type="warning" @click="reset">重置</el-button>
    </div>

    <div style="margin: 10px 0">
      <el-button type="primary" @click="handleAdd"> 创建审核单 <i class="el-icon-circle-plus-outline"></i></el-button>
      <el-popconfirm
          class="ml-5"
          confirm-button-text='确定'
          cancel-button-text='我再想想'
          icon="el-icon-info"
          icon-color="red"
          title="您确定批量删除这些数据吗？"
          @confirm="delBatch"
      >
        <el-button type="danger" slot="reference" v-if="user.role === 'ROLE_ADMIN'">批量删除 <i class="el-icon-remove-outline"></i></el-button>
      </el-popconfirm>
    </div>

    <el-table :data="tableData" border stripe :header-cell-class-name="'headerBg'"  @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="id" label="ID" width="80"></el-table-column>
      <el-table-column prop="name" label="工作说明" width="140"></el-table-column>
      <el-table-column prop="user" label="所属人" width="140">
         <template slot-scope="scope">
          <div v-for="item in users" :key="item.username">
            <p v-if="scope.row.user === item.id">{{item.nickname}}</p>
          </div>
        </template>
      </el-table-column>
      <el-table-column  label="图片" width="220">
        <template slot-scope="scope">
          <el-image style="width: 130px;height: 100px;position: relative;right: -40px" :src="scope.row.img"></el-image>
        </template>
      </el-table-column>
      <el-table-column prop="time" label="提交审核时间" width="130"></el-table-column>
      <el-table-column prop="state" label="审核状态" width="100" style="text-align: center"></el-table-column>
      <el-table-column label="审核" v-if="user.role == 1" width="205">
        <template v-slot="scope">
          <el-button type="success" @click="changeState(scope.row, '审核通过')" :disabled="scope.row.state !== '待审核'">审核通过</el-button>
          <el-button type="danger" @click="changeState(scope.row, '审核不通过')" :disabled="scope.row.state !== '待审核'">审核不通过</el-button>
        </template>
      </el-table-column>
      <el-table-column label="操作"  v-if="user === user.id || user.role === 1" width="205" align="center">
        <template slot-scope="scope">
          <el-button type="success" @click="handleEdit(scope.row)">编辑 <i class="el-icon-edit"></i></el-button>
          <el-popconfirm
              class="ml-5"
              confirm-button-text='确定'
              cancel-button-text='我再想想'
              icon="el-icon-info"
              icon-color="red"
              title="您确定删除吗？"
              @confirm="del(scope.row.id)"
          >
            <el-button type="danger" slot="reference">删除 <i class="el-icon-remove-outline"></i></el-button>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>
    <div style="padding: 10px 0">
      <el-pagination
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
          :current-page="pageNum"
          :page-sizes="[2, 4, 6, 8]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total">
      </el-pagination>
    </div>

    <el-dialog title="信息" :visible.sync="dialogFormVisible" width="30%" >
      <el-form label-width="80px" size="small">
        <el-form-item label="工作说明">
          <el-input v-model="form.name" autocomplete="off" prefix-icon="el-icon-user"></el-input>
        </el-form-item>
        <el-form-item label="图片">
          <el-upload action="http://localhost:9090/file/upload" ref="img"
                     :on-preview="handlePreview"
                     :on-remove="handleRemove"
                     :show-file-list="true"
                     :on-success="handleFileUploadSuccess"
                     style="display: inline-block">
            <el-button type="primary" size="small" class="ml-5">点击上传 <i class="el-icon-upload"></i>
            </el-button>
            <div slot="tip" class="el-upload__tip">只能上传jpg/png/jpeg文件，且不超过500kb</div>
          </el-upload>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
export default {
  name: "Goods",
  data() {
    return {
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 4,
      name: "",
      form: {},
      dialogFormVisible: false,
      multipleSelection: [],
      users: [],
      user: localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}
    }
  },
  created() {
    this.load()
  },
  methods: {
    changeState(row, state) {
      this.form = JSON.parse(JSON.stringify(row))
      this.form.state = state;
      this.save();
    },
    handleRemove(file, fileList) {
      console.log(file, fileList);
    },
    handlePreview(file) {
      console.log(file);
    },
    load() {
      this.request.get("/goods/page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          name: this.name,
        }
      }).then(res => {
        console.log(res)
        this.tableData = res.data.records;
        this.total = res.data.total
      })

      this.request.get("/user/all").then(res => {
        this.users = res.data;
      })
    },
    save(){
      this.request.post("/goods/save",this.form).then(res => {
        if (res.data) {
          this.$message.success("保存成功")
          this.dialogFormVisible = false
          this.load()
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    del(id){
      this.request.delete("/goods/" + id).then(res =>{
        if (res.data) {
          this.$message.success("删除成功")
          this.pageNum = 1
          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    handleSelectionChange(val){
      console.log(val)
      this.multipleSelection = val
    },
    handleFileUploadSuccess(res){
      this.form.img = res;
      console.log(res)
      this.$message.success("上传成功")
    },
    delBatch(){
      let ids = this.multipleSelection.map(v => v.id)  // [{}, {}, {}] => [1,2,3]
      this.request.post("/goods/del/batch",ids)  // 这里使用delete会报错
          .then(res => {
            if (res.data) {
              this.$message.success("批量删除成功")
              this.pageNum = 1
              this.load()
            } else {
              this.$message.error("批量删除失败")
            }
          })
    },
    reset() {
      this.name = ""
      this.load()
    },
    handleAdd() {
      this.dialogFormVisible = true
      this.form = {}
    },
    handleEdit(row){
      this.form = JSON.parse(JSON.stringify(row))  //可以解决编辑未确认就改变的问题
      this.dialogFormVisible = true
    },
    handleSizeChange(pageSize) {
      console.log(pageSize)
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      console.log(pageNum)
      this.pageNum = pageNum
      this.load()
    }
  }
}
</script>
<style>
.headerBg {
  background: #eee!important;
}
</style>
