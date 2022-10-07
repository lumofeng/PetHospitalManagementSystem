<template>
  <div>
    <div style="margin: 10px 0">
      <el-input style="width: 200px" placeholder="请输入标题" suffix-icon="el-icon-search" v-model="title"></el-input>
<!--      <el-input style="width: 200px" placeholder="请输入邮箱" suffix-icon="el-icon-message" class="ml-5" v-model="email"></el-input>-->
<!--      <el-input style="width: 200px" placeholder="请输入地址" suffix-icon="el-icon-position" class="ml-5" v-model="address"></el-input>-->
      <el-button class="ml-5" type="primary" @click="load">搜索</el-button>
      <el-button type="warning" @click="reset">重置</el-button>
    </div>

    <div style="margin: 10px 0">
      <el-button type="primary" @click="handleAdd" v-if="user.role === 'ROLE_DOCTOR'">新增 <i class="el-icon-circle-plus-outline"></i></el-button>
      <el-popconfirm
          class="ml-5"
          confirm-button-text='确定'
          cancel-button-text='我再想想'
          icon="el-icon-info"
          icon-color="red"
          title="您确定批量删除这些数据吗？"
          @confirm="delBatch"
          v-if="user.role === 'ROLE_DOCTOR'">
        <el-button type="danger" slot="reference">批量删除 <i class="el-icon-remove-outline"></i></el-button>
      </el-popconfirm>
<!--      <el-upload :action="'http://' + serverIp + ':9090/notice/import'" :show-file-list="false" accept="xlsx" :on-success="handleExcelImportSuccess" style="display: inline-block">-->
<!--        <el-button type="primary" class="ml-5">导入 <i class="el-icon-bottom"></i></el-button>-->
<!--      </el-upload>-->
<!--      <el-button type="primary" @click="exp" class="ml-5">导出 <i class="el-icon-top"></i></el-button>-->
    </div>

    <el-table :data="tableData" border stripe :header-cell-class-name="'headerBg'"  @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="id" label="ID" width="80" v-if="false"></el-table-column>
        <el-table-column prop="title" label="标题"></el-table-column>
        <el-table-column prop="author" label="作者"></el-table-column>
        <el-table-column prop="viewCount" label="查看次数"></el-table-column>
        <el-table-column prop="createTime" label="时间"></el-table-column>
      <el-table-column label="操作" align="center">
        <template slot-scope="scope">
          <el-button type="success" @click="handleEdit(scope.row)" v-if="user.role === 'ROLE_DOCTOR'" >编辑 <i class="el-icon-edit"></i></el-button>
            <el-button type="primary" @click="details(scope.row)">详情 </el-button>
          <el-popconfirm
              class="ml-5"
              confirm-button-text='确定'
              cancel-button-text='我再想想'
              icon="el-icon-info"
              icon-color="red"
              title="您确定删除吗？"
              @confirm="del(scope.row.id)"
          >
            <el-button type="danger" slot="reference" v-if="user.role === 'ROLE_DOCTOR'">删除 <i class="el-icon-remove-outline"></i></el-button>
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

    <el-dialog title="用户信息" :visible.sync="dialogFormVisible" width="50%" >
      <el-form :model="form" label-width="80px" size="small">
          <el-form-item label="标题">
              <el-input v-model="form.title" style="width: 50%"></el-input>
          </el-form-item>
<!--          <el-form-item label="内容">-->
<!--              <el-input v-model="form.content" style="width: 50%"></el-input>-->
<!--          </el-form-item>-->
          <div id="div1"></div>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>

      <el-dialog title="详细内容" :visible.sync="vis" width="50%">
<!--          <el-card>-->
<!--              <div v-html="detail.title" style="min-height: 50%"></div>-->
<!--          </el-card>-->

          <el-card>
              <div v-html="detail.content" style="min-height: 50%"></div>
          </el-card>
      </el-dialog>
  </div>
</template>

<script>
import {serverIp} from "../../public/config";
import E from 'wangeditor';

let editor;

export default {
  name: "Notice",
  data() {
    return {
      serverIp: serverIp,
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 5,
      title: "",
      email: "",
      address: "",
      form: {},
      dialogFormVisible: false,
        vis: false,
      multipleSelection: [],
      roles: [],
        detail: {},
        user:{}
    }
  },
  created() {
    this.load()
  },
  methods: {
    load() {
      this.request.get("/notice/page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          title: this.title,
          email: this.email,
          address: this.address,
        }
      }).then(res => {
          this.loading = false
        this.tableData = res.data.records
        this.total = res.data.total
          this.user = localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}
      })

      this.request.get("/role").then(res => {
        this.roles = res.data
          console.log(this.roles)
      })
    },
    save() {
        this.form.content = editor.txt.html()  // 获取 编辑器里面的值，然后赋予到实体当中
        if (this.form.id){
            this.request.post("/notice", this.form).then(res => {
                if (res.code === '200') {
                    this.$message.success("保存成功")
                    this.dialogFormVisible = false
                    this.load()
                } else {
                    this.$message.error("保存失败")
                }
            })
        } else{
            this.request.post("/notice", this.form).then(res => {
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
      details(row) {
          this.detail = row
          this.request.post("/notice/addViewCount", this.detail).then(res => {
              // console.log(res)
              if (res.code === '200') {
                  this.$message({
                      type: "success",
                      message: "查询成功"
                  })
              } else {
                  this.$message({
                      type: "error",
                      message: res.msg
                  })
              }
              this.load() // 刷新表格的数据
          })
          this.vis = true
      },
    handleEdit(row) {
      this.form = JSON.parse(JSON.stringify(row))
      this.dialogFormVisible = true
        this.$nextTick(() => {
            // 关联弹窗里面的div，new一个 editor对象
            // 关联弹窗里面的div，new一个 editor对象
            if (!editor) {
                editor = new E('#div1')

                // 配置 server 接口地址
                editor.config.uploadImgServer = 'http://localhost:9090/files/editor/upload'
                editor.config.uploadFileName = "file"  // 设置上传参数名称
                editor.create()
            }

            editor.txt.html(row.content)
        })
    },
    del(id) {
      this.request.delete("/notice/" + id).then(res => {
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
        debugger
      let ids = this.multipleSelection.map(v => v.id)  // [{}, {}, {}] => [1,2,3]
      this.request.post("/notice/del/batch", ids).then(res => {
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
      window.open(`http://${serverIp}:9090/notice/export`)
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
