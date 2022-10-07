<template>
  <div>
    <div style="margin: 10px 0">
      <el-input style="width: 200px" placeholder="请输入名称" suffix-icon="el-icon-search" v-model="username"></el-input>
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
      <el-upload :action="'http://' + serverIp + ':9090/pet/import'" :show-file-list="false" accept="xlsx" :on-success="handleExcelImportSuccess" style="display: inline-block">
        <el-button type="primary" class="ml-5">导入 <i class="el-icon-bottom"></i></el-button>
      </el-upload>
      <el-button type="primary" @click="exp" class="ml-5">导出 <i class="el-icon-top"></i></el-button>
    </div>

    <el-table :data="tableData" border stripe :header-cell-class-name="'headerBg'"  @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="id" label="ID" width="80" v-if="false"></el-table-column>
        <el-table-column prop="name" label="宠物名"></el-table-column>
        <el-table-column prop="weight" label="体重/公斤"></el-table-column>
        <el-table-column prop="height" label="身高/公分"></el-table-column>
<!--        <el-table-column prop="birthday" label="出生时间"></el-table-column>-->
        <el-table-column prop="type" label="类型"></el-table-column>
      <el-table-column label="操作"  width="350" align="center">
        <template slot-scope="scope">
          <el-button type="success" @click="handleEdit(scope.row)">编辑 <i class="el-icon-edit"></i></el-button>
            <el-button type="primary" @click="seeDoctor(scope.row)" v-if="user.role === 'ROLE_USER'">预约就诊 </el-button>
<!--            <el-button type="primary" @click="seeDiagnosis(scope.row)">查看病例</el-button>-->
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
      <el-form label-width="80px" size="small">
          <el-form-item label="宠物名">
              <el-input v-model="form.name" style="width: 80%"></el-input>
          </el-form-item>
          <el-form-item label="体重/公斤">
              <el-input v-model="form.weight" style="width: 80%"></el-input>
          </el-form-item>
          <el-form-item label="身高/公分">
              <el-input v-model="form.height" style="width: 80%"></el-input>
          </el-form-item>
<!--          <el-form-item label="出生时间">-->
<!--              <el-date-picker v-model="form.birthday" value-format="yyyy-MM-dd" format="yyyy-MM-dd" type="date" style="width: 80%" clearable></el-date-picker>-->
<!--          </el-form-item>-->
          <el-form-item label="类型">
              <!--                <el-input v-model="form.type" style="width: 80%"></el-input>-->
              <el-radio v-model="form.type" label="猫科">猫科</el-radio>
              <el-radio v-model="form.type" label="犬科">犬科</el-radio>
          </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="save">确 定</el-button>
      </div>
    </el-dialog>

      <el-dialog title="提示" :visible.sync="dialogAddAppointment" width="30%">
          <el-form :model="appointmentInfo" label-width="120px">
              <el-form-item label="电话">
                  <el-input v-model="appointmentInfo.phone" style="width: 80%"></el-input>
              </el-form-item>
              <el-form-item label="地址">
                  <el-input v-model="appointmentInfo.address" style="width: 80%"></el-input>
              </el-form-item>
              <el-form-item label="内容">
                  <el-input v-model="appointmentInfo.applInfo" style="width: 80%" type="textarea"></el-input>
              </el-form-item>
              <el-form-item label="预约时间">
                  <el-date-picker v-model="appointmentInfo.applTime"  type="datetime" style="width: 80%" clearable></el-date-picker>
              </el-form-item>
          </el-form>
          <template #footer>
          <span class="dialog-footer">
            <el-button @click="dialogAddAppointment = false">取 消</el-button>
            <el-button type="primary" @click="addAppointment">确 定</el-button>
          </span>
          </template>
      </el-dialog>

      <el-dialog title="提示" :visible.sync="dialogDiagnosis" width="70%">

          <div style="margin: 10px 0">
              <el-input style="width: 200px" placeholder="请输入诊疗建议" suffix-icon="el-icon-search" v-model="diagnosisAdvice"></el-input>
              <el-button class="ml-5" type="primary" @click="seeDiagnosis">搜索</el-button>
<!--              <el-button type="warning" @click="reset">重置</el-button>-->
          </div>

          <el-table :data="diagnosisData" border stripe :header-cell-class-name="'headerBg'"  @selection-change="handleSelectionChange">
              <el-table-column type="selection" width="55"></el-table-column>
<!--              <el-table-column prop="id" label="ID" width="80"></el-table-column>-->
              <el-table-column prop="name" label="宠物名"></el-table-column>
              <el-table-column prop="nickname" label="用户名"></el-table-column>
              <el-table-column prop="doctorName" label="医生名"></el-table-column>
              <el-table-column prop="info" label="诊疗建议"></el-table-column>
              <el-table-column prop="type" label="类型"></el-table-column>
              <el-table-column prop="status" label="状态"></el-table-column>
              <el-table-column prop="createTime" label="创建时间"></el-table-column>
          </el-table>
          <template #footer>
          <span class="dialog-footer">
            <el-button @click="dialogDiagnosis = false">取 消</el-button>
<!--            <el-button type="primary" @click="lookPetDiagnosis">确 定</el-button>-->
          </span>
          </template>
      </el-dialog>
  </div>
</template>

<script>
import {serverIp} from "../../public/config";

export default {
  name: "Pet",
  data() {
    return {
      serverIp: serverIp,
      tableData: [],
        diagnosisData:[],
      total: 0,
        diagnosisTotal:0,
      pageNum: 1,
      pageSize: 5,
      username: "",
        diagnosisAdvice:"",
      email: "",
      address: "",
      form: {},
        appointmentInfo:{},
      dialogFormVisible: false,
        dialogAddAppointment:false,
        dialogDiagnosis: false,
        diagnosisInfo:{},
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
      this.request.get("/pet/page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          username: this.username,
          email: this.email,
          address: this.address,
        }
      }).then(res => {

        this.tableData = res.data.records
        this.total = res.data.total
          this.user = localStorage.getItem("user") ? JSON.parse(localStorage.getItem("user")) : {}
      })

      this.request.get("/role").then(res => {
        this.roles = res.data
      })
    },
      seeDiagnosis(row){
        this.diagnosisInfo = JSON.parse(JSON.stringify(row))
          this.diagnosisInfo.id = row.id
          this.dialogDiagnosis = true

          this.request.get("/diagnosis/diagnosis_page", {
              params: {
                  pageNum: this.pageNum,
                  pageSize: this.pageSize,
                  diagnosisAdvice: this.diagnosisAdvice,
              }
          }).then(res => {
              this.diagnosisData = res.data.records
              this.diagnosisTotal = res.data.total

          })

      },
      lookPetDiagnosis(){

      },
      seeDoctor(row){
        // debugger
          this.appointmentInfo = JSON.parse(JSON.stringify(row))
          this.appointmentInfo.id = row.id
          this.dialogAddAppointment = true
      },
      addAppointment(){
          this.request.post("/appointment", this.appointmentInfo).then(res => {
              console.log(res)
              if (res.code === '200') {
                  this.$message({
                      type: "success",
                      message: "新增成功"
                  })
              } else {
                  this.$message({
                      type: "error",
                      message: res.msg
                  })
              }
              this.load() // 刷新表格的数据
              this.dialogAddAppointment = false  // 关闭弹窗
          })
      },
    save() {
      this.request.post("/pet", this.form).then(res => {
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
    },
    handleEdit(row) {
      this.form = JSON.parse(JSON.stringify(row))
      this.dialogFormVisible = true
    },
    del(id) {
      this.request.delete("/pet/" + id).then(res => {
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
      this.request.post("/pet/del/batch", ids).then(res => {
        if (res.code === '200') {
          this.$message.success("批量删除成功")
          this.load()
        } else {
          this.$message.error("批量删除失败")
        }
      })
    },
    reset() {
      this.username = ""
      this.email = ""
      this.address = ""
        this.diagnosisAdvice = ""
      // this.seeDiagnosis()
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
      window.open(`http://${serverIp}:9090/pet/export`)
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
