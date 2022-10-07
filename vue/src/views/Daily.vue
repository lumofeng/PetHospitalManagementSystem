<template>
  <div>
    <div style="margin: 10px 0">
      <el-input style="width: 200px" placeholder="请输入名称" suffix-icon="el-icon-search" v-model="title"></el-input>
<!--      <el-input style="width: 200px" placeholder="请输入邮箱" suffix-icon="el-icon-message" class="ml-5" v-model="email"></el-input>-->
<!--      <el-input style="width: 200px" placeholder="请输入地址" suffix-icon="el-icon-position" class="ml-5" v-model="address"></el-input>-->
      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
      <el-button type="warning" @click="reset">重置</el-button>
    </div>

    <div style="margin: 10px 0">
      <el-button type="primary" @click="handleAdd">新增 <i class="el-icon-circle-plus-outline"></i></el-button>
      <el-popconfirm
          class="ml-5"
          confirm-button-text='确定'
          cancel-button-text='我再想想'
          icon="el-icon-info"
          icon-color="red"
          title="您确定批量删除这些数据吗？"
          @confirm="delBatch"
      >
        <el-button type="danger" slot="reference">批量删除 <i class="el-icon-remove-outline"></i></el-button>
      </el-popconfirm>
<!--      <el-upload :action="'http://' + serverIp + ':9090/daily/import'" :show-file-list="false" accept="xlsx" :on-success="handleExcelImportSuccess" style="display: inline-block">-->
<!--        <el-button type="primary" class="ml-5">导入 <i class="el-icon-bottom"></i></el-button>-->
<!--      </el-upload>-->
<!--      <el-button type="primary" @click="exp" class="ml-5">导出 <i class="el-icon-top"></i></el-button>-->
    </div>

    <el-table :data="tableData" border stripe :header-cell-class-name="'headerBg'"  @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="id" label="日志ID" v-if="false" width="80"></el-table-column>
<!--      <el-table-column prop="pid" label="petID" width="80"></el-table-column>-->
      <el-table-column prop="name" label="宠物名称" width="80"></el-table-column>
        <el-table-column prop="weight" label="体重/公斤"></el-table-column>
        <el-table-column prop="height" label="身高/公分"></el-table-column>
        <el-table-column prop="temperature" label="体温/度"></el-table-column>
        <el-table-column prop="appetite" label="饭量/克"></el-table-column>
        <el-table-column prop="status" label="状态"></el-table-column>
      <el-table-column label="操作"  width="200" align="center">
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
          :page-sizes="[2, 5, 10, 20]"
          :page-size="pageSize"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total">
      </el-pagination>
    </div>

    <el-dialog title="用户信息" :visible.sync="dialogFormVisible" width="30%" >
      <el-form :model="form" label-width="80px" size="small">
          <el-form-item label="宠物">
              <el-select clearable v-model="form.petId" placeholder="请选择宠物" style="width: 80%">
                  <el-option v-for="item in petList" :key="item.id" :label="item.name" :value="item.id"></el-option>
                  <el-option hidden v-for="item in petList" :key="item.id" :label="item.id" :value="item.id"></el-option>
              </el-select>
          </el-form-item>
          <el-form-item label="体重/公斤">
              <el-input v-model="form.weight" style="width: 80%"></el-input>
          </el-form-item>
          <el-form-item label="身高/公分">
              <el-input v-model="form.height" style="width: 80%"></el-input>
          </el-form-item>
          <el-form-item label="体温/度">
              <el-input v-model="form.temperature" style="width: 80%"></el-input>
          </el-form-item>
          <el-form-item label="饭量/克">
              <el-input v-model="form.appetite" style="width: 80%"></el-input>
          </el-form-item>
          <el-form-item label="状态">
              <el-radio v-model="form.status" label="正常">正常</el-radio>
              <el-radio v-model="form.status" label="异常">异常</el-radio>
              <el-radio v-model="form.status" label="生病">生病</el-radio>
          </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>
<!--编辑弹窗-->
      <el-dialog title="用户信息" :visible.sync="dialogEditVisible" width="30%" >
          <el-form :model="form" label-width="80px" size="small">
              <el-form-item label="宠物名称">
                  <el-input v-model="form.name" style="width: 80%"></el-input>
              </el-form-item>
              <el-form-item label="体重">
                  <el-input v-model="form.weight" style="width: 80%"></el-input>
              </el-form-item>
              <el-form-item label="身高">
                  <el-input v-model="form.height" style="width: 80%"></el-input>
              </el-form-item>
              <el-form-item label="体温">
                  <el-input v-model="form.temperature" style="width: 80%"></el-input>
              </el-form-item>
              <el-form-item label="饭量">
                  <el-input v-model="form.appetite" style="width: 80%"></el-input>
              </el-form-item>
              <el-form-item label="状态">
                  <el-radio v-model="form.status" label="正常">正常</el-radio>
                  <el-radio v-model="form.status" label="异常">异常</el-radio>
                  <el-radio v-model="form.status" label="生病">生病</el-radio>
              </el-form-item>
          </el-form>
          <div slot="footer" class="dialog-footer">
              <el-button @click="dialogEditVisible = false">取 消</el-button>
              <el-button type="primary" @click="save">确 定</el-button>
          </div>
      </el-dialog>
  </div>
</template>

<script>
import {serverIp} from "../../public/config";

export default {
  name: "Daily",
  data() {
    return {
      serverIp: serverIp,
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 20,
      title: "",
      email: "",
      address: "",
      form: {},
        petList:[],
      dialogFormVisible: false,
        dialogEditVisible: false,
      multipleSelection: [],
      roles: [],
        user:{}
    }
  },
  created() {
    this.load()
  },
  methods: {
    load() {
      this.request.get("/daily/page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          name: this.title,
        }
      }).then(res => {

        this.tableData = res.data.records
          // console.log(this.tableData)
        this.total = res.data.total
          this.user = localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}

      })

      this.request.get("/role").then(res => {
        this.roles = res.data
          // console.log("测试+")
          // console.log(this.roles)
      })
    },
    save() {
      if(this.form.id){
          this.request.post("/daily", this.form).then(res => {
              if (res.code === '200') {
                  this.$message.success("保存成功")
                  this.dialogEditVisible = false
                  this.load()
              } else {
                  this.$message.error("保存失败")
              }
          })
      }else{
          this.request.post("/daily/add", this.form).then(res => {
              if (res.code === '200') {
                  this.$message.success("保存成功")
                  this.dialogFormVisible = false
                  this.load()
              } else {
                  this.$message.error("保存失败")
              }
          })
      }
    },
    handleAdd() {
        this.request.get("/pet/page", {
            params: {
                pageNum: this.pageNum,
                pageSize: this.pageSize,
                name: this.title,
            }
        }).then(res => {
            console.log(res.data.records)
            this.petList = res.data.records

        })
      this.dialogFormVisible = true
      this.form = {}
    },
    handleEdit(row) {
      this.form = JSON.parse(JSON.stringify(row))
      this.dialogEditVisible = true
    },
    del(id) {
      this.request.delete("/daily/" + id).then(res => {
        if (res.code === '200') {
          this.$message.success("删除成功")
          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    handleSelectionChange(val) {
      console.log(val)
      this.multipleSelection = val
    },
    delBatch() {
      let ids = this.multipleSelection.map(v => v.id)  // [{}, {}, {}] => [1,2,3]
      this.request.post("/daily/del/batch", ids).then(res => {
        if (res.code === '200') {
          this.$message.success("批量删除成功")
          this.load()
        } else {
          this.$message.error("批量删除失败")
        }
      })
    },
    reset() {
      this.title = ""
      this.email = ""
      this.address = ""
      this.load()
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
    },
    exp() {
      window.open(`http://${serverIp}:9090/daily/export`)
    },
    handleExcelImportSuccess() {
      this.$message.success("导入成功")
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
