<template>
  <div>
    <div style="margin: 10px 0">
      <el-input style="width: 200px" placeholder="请输入诊疗建议搜索" suffix-icon="el-icon-search" v-model="diagnosisAdvice"></el-input>
      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
      <el-button type="warning" @click="reset">重置</el-button>
    </div>

    <div style="margin: 10px 0">
<!--      <el-button type="primary" @click="handleAdd">新增 <i class="el-icon-circle-plus-outline"></i></el-button>-->
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
<!--      <el-upload :action="'http://' + serverIp + ':9090/diagnosis/import'" :show-file-list="false" accept="xlsx" :on-success="handleExcelImportSuccess" style="display: inline-block">-->
<!--        <el-button type="primary" class="ml-5">导入 <i class="el-icon-bottom"></i></el-button>-->
<!--      </el-upload>-->
<!--      <el-button type="primary" @click="exp" class="ml-5">导出 <i class="el-icon-top"></i></el-button>-->
    </div>

    <el-table :data="tableData" border stripe :header-cell-class-name="'headerBg'"  @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55"></el-table-column>
        <el-table-column prop="petId" label="宠物ID" width="80" v-if="false"></el-table-column>
        <el-table-column prop="id" label="ID" v-if="false" width="80"></el-table-column>
        <el-table-column prop="userId" label="用户ID" width="80" v-if="false"></el-table-column>
        <el-table-column prop="doctorId" label="医生ID" width="80" v-if="false"></el-table-column>
        <el-table-column prop="name" label="宠物名"></el-table-column>
        <el-table-column prop="nickname" label="医生名"></el-table-column>
<!--        <el-table-column prop="doctorName" label="医生名"></el-table-column>-->
        <el-table-column prop="info" label="诊疗建议"></el-table-column>
        <el-table-column prop="type" label="类型"></el-table-column>
        <el-table-column prop="status" label="状态"></el-table-column>
        <el-table-column prop="createTime" label="创建时间"></el-table-column>
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
              <el-form-item label="宠物名">
                  <el-input v-model="form.name" style="width: 50%"></el-input>
              </el-form-item>
              <el-form-item label="用户名">
                  <el-input v-model="form.nickname" style="width: 50%"></el-input>
              </el-form-item>
              <el-form-item label="诊疗建议">
                  <el-input v-model="form.info" style="width: 50%"></el-input>
              </el-form-item>
              <el-form-item label="类型">
                  <el-radio v-model="form.type" label="正常就医">正常就医</el-radio>
                  <el-radio v-model="form.type" label="注射疫苗">注射疫苗</el-radio>
                  <el-radio v-model="form.type" label="驱虫">驱虫</el-radio>
              </el-form-item>
              <el-form-item label="状态">
                  <el-radio v-model="form.status" label="正常">正常</el-radio>
                  <el-radio v-model="form.status" label="较重">较重</el-radio>
                  <el-radio v-model="form.status" label="严重">严重</el-radio>
                  <el-radio v-model="form.status" label="死亡">死亡</el-radio>
              </el-form-item>
              <el-form-item label="创建时间">
                  <el-date-picker v-model="form.createTime"  type="datetime" style="width: 50%" clearable></el-date-picker>
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
import {serverIp} from "../../public/config";
import E from 'wangeditor';

let editor;

export default {
  name: "Diagnosis",
  data() {
    return {
      serverIp: serverIp,
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 5,
      title: "",
        diagnosisAdvice:"",
      email: "",
      address: "",
      form: {},
      dialogFormVisible: false,
      multipleSelection: [],
      roles: [],
        teachers:[],
        test:{},
        userId:"",
        user:{}
    }
  },
  created() {
    this.load()
  },
  methods: {
    load() {
      this.request.get("/diagnosis/diagnosis_page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
            diagnosisAdvice: this.diagnosisAdvice,
        }
      }).then(res => {
        // console.log(res.data.records)
        this.tableData = res.data.records
        this.total = res.data.total
           this.user = localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}
      })

      this.request.get("/role").then(res => {
        this.roles = res.data
      })
        this.request.get("/user/role/ROLE_USER").then(res => {
            this.teachers = res.data
            // console.log(this.user)
        })
    },
    save() {
      this.request.post("/diagnosis", this.form).then(res => {
        if (res.code === '200') {
          this.$message.success("保存成功")
          this.dialogFormVisible = false
          this.load()
        } else {
          this.$message.error("保存失败")
        }
      })
    },
    handleAdd() {
      this.dialogFormVisible = true
      this.form = {}

        this.$nextTick(() => {
            // 关联弹窗里面的div，new一个 editor对象
            if (!editor) {
                editor = new E('#div1')

                // 配置 server 接口地址
                // editor.config.uploadImgServer = 'http://' + window.server.filesUploadUrl + ':9090/files/editor/upload'
                // editor.config.uploadFileName = "file"  // 设置上传参数名称
                editor.create()
            }

            editor.txt.html("")

        })
    },
    handleEdit(row) {
      this.form = JSON.parse(JSON.stringify(row))
      this.dialogFormVisible = true
    },
    del(id) {
      this.request.delete("/diagnosis/" + id).then(res => {
        if (res.code === '200') {
          this.$message.success("删除成功")
          this.load()
        } else {
          this.$message.error("删除失败")
        }
      })
    },
    handleSelectionChange(val) {
      this.multipleSelection = val
        console.log(this.multipleSelection)
    },
    delBatch() {
        let ids = this.multipleSelection.map(v => v.id)  // [{}, {}, {}] => [1,2,3]
        this.request.post("/diagnosis/del/batch", ids).then(res => {
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
        this.diagnosisAdvice = ""
      this.load()
    },
    handleSizeChange(pageSize) {
      // console.log(pageSize)
      this.pageSize = pageSize
      this.load()
    },
    handleCurrentChange(pageNum) {
      // console.log(pageNum)
      this.pageNum = pageNum
      this.load()
    },
    exp() {
      window.open(`http://${serverIp}:9090/diagnosis/export`)
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
