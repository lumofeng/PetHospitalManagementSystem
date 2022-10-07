<template>
  <div>
    <div style="margin: 10px 0">
      <el-input style="width: 200px" placeholder="请输入类型" suffix-icon="el-icon-search" v-model="type"></el-input>
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
          v-if="user.role === 'ROLE_DOCTOR'"
      >
        <el-button type="danger" slot="reference">批量删除 <i class="el-icon-remove-outline"></i></el-button>
      </el-popconfirm>
<!--      <el-upload :action="'http://' + serverIp + ':9090/standard/import'" :show-file-list="false" accept="xlsx" :on-success="handleExcelImportSuccess" style="display: inline-block">-->
<!--        <el-button type="primary" class="ml-5">导入 <i class="el-icon-bottom"></i></el-button>-->
<!--      </el-upload>-->
<!--      <el-button type="primary" @click="exp" class="ml-5">导出 <i class="el-icon-top"></i></el-button>-->
    </div>

    <el-table :data="tableData" border stripe :header-cell-class-name="'headerBg'"  @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55"></el-table-column>
      <el-table-column prop="id" label="ID" width="80" v-if="false"></el-table-column>
        <el-table-column prop="ageMin" label="开始年龄/年"></el-table-column>
        <el-table-column prop="ageMax" label="结束年龄/年"></el-table-column>
        <el-table-column prop="tempMin" label="体温最小/度"></el-table-column>
        <el-table-column prop="tempMax" label="体温最大/度"></el-table-column>
        <el-table-column prop="weightMin" label="体重最小/公斤"></el-table-column>
        <el-table-column prop="weightMax" label="体重最大/公斤"></el-table-column>
        <el-table-column prop="heightMin" label="身高最小/公分"></el-table-column>
        <el-table-column prop="heightMax" label="身高最大/公分"></el-table-column>
        <el-table-column prop="appetiteMin" label="饭量最小/克"></el-table-column>
        <el-table-column prop="appetiteMax" label="饭量最大/克"></el-table-column>
        <el-table-column prop="status" label="状态"></el-table-column>
<!--        <el-table-column prop="birthday" label="出生时间"></el-table-column>-->
        <el-table-column prop="type" label="类型"></el-table-column>
      <el-table-column label="操作"  width="200" align="center"  v-if="user.role === 'ROLE_DOCTOR'">
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
      <el-form label-width="80px" size="small">
          <el-form-item label="开始年龄/年">
              <el-input v-model="form.ageMin" style="width: 80%"></el-input>
          </el-form-item>
          <el-form-item label="结束年龄/年">
              <el-input v-model="form.ageMax" style="width: 80%"></el-input>
          </el-form-item>
          <el-form-item label="体温最小/度">
              <el-input v-model="form.tempMin" style="width: 80%"></el-input>
          </el-form-item>
          <el-form-item label="体温最大/度">
              <el-input v-model="form.tempMax" style="width: 80%"></el-input>
          </el-form-item>
          <el-form-item label="体重最小/公斤">
              <el-input v-model="form.weightMin" style="width: 80%"></el-input>
          </el-form-item>
          <el-form-item label="体重最大/公斤">
              <el-input v-model="form.weightMax" style="width: 80%"></el-input>
          </el-form-item>
          <el-form-item label="身高最小/公分">
              <el-input v-model="form.heightMin" style="width: 80%"></el-input>
          </el-form-item>
          <el-form-item label="身高最大/公分">
              <el-input v-model="form.heightMax" style="width: 80%"></el-input>
          </el-form-item>
          <el-form-item label="饭量最小/克">
              <el-input v-model="form.appetiteMin" style="width: 80%"></el-input>
          </el-form-item>
          <el-form-item label="饭量最大/克">
              <el-input v-model="form.appetiteMax" style="width: 80%"></el-input>
          </el-form-item>
          <el-form-item label="类型">
              <el-radio v-model="form.type" label="猫科">猫科</el-radio>
              <el-radio v-model="form.type" label="犬科">犬科</el-radio>
          </el-form-item>
<!--          <el-form-item label="出生时间">-->
<!--              <el-date-picker v-model="form.birthday" value-format="yyyy-MM-dd" format="yyyy-MM-dd" type="date" style="width: 80%" clearable></el-date-picker>-->
<!--          </el-form-item>-->
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
  </div>
</template>

<script>
import {serverIp} from "../../public/config";

export default {
  name: "Standard",
  data() {
    return {
      serverIp: serverIp,
      tableData: [],
      total: 0,
      pageNum: 1,
      pageSize: 5,
      type: "",
      email: "",
      address: "",
      form: {},
      dialogFormVisible: false,
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
      this.request.get("/standard/page", {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          type: this.type,
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
    save() {
      this.request.post("/standard", this.form).then(res => {
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
      this.request.delete("/standard/" + id).then(res => {
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
      this.request.post("/standard/del/batch", ids).then(res => {
        if (res.code === '200') {
          this.$message.success("批量删除成功")
          this.load()
        } else {
          this.$message.error("批量删除失败")
        }
      })
    },
    reset() {
      this.type = ""
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
      window.open(`http://${serverIp}:9090/standard/export`)
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
