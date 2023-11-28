<template>
  <div class="app-container">
    <el-form v-show="showSearch" ref="queryForm" :inline="true" :model="queryParams" label-width="98px">
      <el-form-item label="电影名" prop="title">
        <el-input v-model="queryParams.title" clearable placeholder="请输入电影名" size="small"
          @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="导演" prop="name">
        <el-input v-model="queryParams.name" clearable placeholder="请输入导演" size="small"
          @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item>
        <el-button icon="el-icon-search" size="mini" type="primary" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button v-hasPermi="['biz:films:add']" icon="el-icon-plus" plain size="mini" type="primary"
          @click="handleAdd">新增
        </el-button>
        <el-button type="info" plain icon="el-icon-upload2" size="mini" @click="handleImport"
          v-hasPermi="['biz:films:import']">导入</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="filmsList" @selection-change="handleSelectionChange">
      <el-table-column align="center" label="ID" prop="id" />
      <el-table-column align="center" label="电影名" prop="title" />
      <el-table-column align="center" label="导演" prop="name" />
      <el-table-column align="center" label="片长(分钟)" prop="mobile" />
      <el-table-column align="center" label="类型" prop="address" />
      <!-- <el-table-column align="center" label="简介" prop="content"/>
      <el-table-column label="视频" align="center" prop="imgs" >
        <template slot-scope="scope">
          <video :src="scope.row.imgs" style="width: 100px;height: 100px;"></video>
        </template>
      </el-table-column> -->
      <el-table-column label="封面图" align="center" prop="field5">
        <template slot-scope="scope">
          <el-image style="width: 60px; height: 60px" :src="scope.row.field5" />
        </template>
      </el-table-column>
      <el-table-column align="center" label="状态" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.电影状态" :value="scope.row.status" />
        </template>
      </el-table-column>
      <el-table-column align="center" label="上映时间" prop="date1" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.date1, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column align="center" label="平均评分" prop="num">
        <template slot-scope="{row}">
          {{ row.num ? row.num : 0 }}
        </template>
      </el-table-column>
      <el-table-column align="center" label="国家" prop="field2" />
      <el-table-column align="center" label="语言" prop="field3" />

      <el-table-column align="center" class-name="small-padding fixed-width" label="操作">
        <template slot-scope="scope">
          <el-button v-hasPermi="['biz:films:edit']" icon="el-icon-edit" size="mini" type="text"
            @click="handleUpdate(scope.row)">修改
          </el-button>
          <el-button v-hasPermi="['biz:films:remove']" icon="el-icon-delete" size="mini" type="text"
            @click="handleDelete(scope.row)">删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total > 0" :limit.sync="queryParams.pageSize" :page.sync="queryParams.pageNum" :total="total"
      @pagination="getList" />

    <!-- 添加或修改电影管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" append-to-body width="50%">
      <el-form ref="form" :model="form" :rules="rules" label-width="90px">
        <el-form-item label="电影名" prop="title">
          <el-input v-model="form.title" placeholder="请输入电影名" />
        </el-form-item>
        <el-form-item label="导演" prop="name">
          <el-input v-model="form.name" placeholder="请输入导演" />
        </el-form-item>
        <el-form-item label="片长(分钟)" prop="mobile">
          <el-input-number v-model="form.mobile" placeholder="请输入片长(分钟)" />
        </el-form-item>
        <el-form-item label="类型" prop="address">
          <el-select v-model="form.address" placeholder="请选择类型">
            <el-option v-for="dict in collectAddress" :key="dict.id" :label="dict.title" :value="dict.title"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="简介">
          <el-input v-model="form.content" placeholder="请输入内容" type="textarea" />
        </el-form-item>
        <el-form-item label="上传视频">
          <FileUpload v-model="form.imgs" />
        </el-form-item>
        <el-form-item label="封面图">
          <imageUpload v-model="form.field5" />
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-select v-model="form.status" placeholder="请选择状态">
            <el-option v-for="dict in dict.type.电影状态" :key="dict.value" :label="dict.label"
              :value="dict.value"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="上映时间" prop="date1">
          <el-date-picker v-model="form.date1" clearable placeholder="选择上映时间" size="small" type="date"
            value-format="yyyy-MM-dd">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="国家" prop="field2">
          <el-input v-model="form.field2" placeholder="请输入国家" />
        </el-form-item>
        <el-form-item label="语言" prop="field3">
          <el-input v-model="form.field3" placeholder="请输入语言" />
        </el-form-item>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
    <el-dialog :title="upload.title" :visible.sync="upload.open" width="400px" append-to-body>
      <el-upload ref="upload" :limit="1" accept=".xlsx, .xls" :headers="upload.headers"
        :action="upload.url + '?updateSupport=' + upload.updateSupport" :disabled="upload.isUploading"
        :on-progress="handleFileUploadProgress" :on-success="handleFileSuccess" :auto-upload="false" drag>
        <i class="el-icon-upload"></i>
        <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
        <div class="el-upload__tip text-center" slot="tip">
          <div class="el-upload__tip" slot="tip">
            <el-checkbox v-model="upload.updateSupport" /> 是否更新已经存在的数据
          </div>
          <span>仅允许导入xls、xlsx格式文件。</span>
          <el-link type="primary" :underline="false" style="font-size:12px;vertical-align: baseline;"
            @click="importTemplate">下载模板</el-link>
        </div>
      </el-upload>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitFileForm">确 定</el-button>
        <el-button @click="upload.open = false">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listFilms, getFilms, delFilms, addFilms, updateFilms, importTemplate, exportFilms } from "@/api/biz/films";
import { listClassification } from '@/api/biz/classification';
import { getToken } from "@/utils/auth";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";

export default {
  name: "Films",
  dicts: ['电影状态'],
  data() {
    return {
      collectAddress: [],//电影类型
      // 遮罩层
      loading: true,
      // 导出遮罩层
      exportLoading: false,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 电影管理表格数据
      filmsList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 用户导入参数
      upload: {
        // 是否显示弹出层（用户导入）
        open: false,
        // 弹出层标题（用户导入）
        title: "",
        // 是否禁用上传
        isUploading: false,
        // 是否更新已经存在的用户数据
        updateSupport: 0,
        // 设置上传的请求头部
        headers: { Authorization: "Bearer " + getToken() },
        // 上传的地址
        url: process.env.VUE_APP_BASE_API + "/biz/films/importData"
      },
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        title: null,
        name: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {}
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 导入按钮操作 */
    handleImport() {
      this.upload.title = "电影导入";
      this.upload.open = true;
    },
    /** 下载模板操作 */
    importTemplate() {
      importTemplate().then(response => {
        this.download(response.msg);
      });
    },
    // 文件上传中处理
    handleFileUploadProgress(event, file, fileList) {
      this.upload.isUploading = true;
    },
    // 文件上传成功处理
    handleFileSuccess(response, file, fileList) {
      this.upload.open = false;
      this.upload.isUploading = false;
      this.$refs.upload.clearFiles();
      this.$alert(response.msg, "导入结果", { dangerouslyUseHTMLString: true });
      this.getList();
    },
    // 提交上传文件
    submitFileForm() {
      this.$refs.upload.submit();
    },
    /** 查询电影管理列表 */
    getList() {
      this.loading = true;
      listFilms(this.queryParams).then(response => {
        this.filmsList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        title: null,
        name: null,
        mobile: null,
        address: null,
        content: null,
        imgs: null,
        num: null,
        status: null,
        date1: null,
        field1: null,
        field2: null,
        field3: null,
        field5: null,
        field6: null,
        field7: null,
        field8: null,
        field9: null,
        delFlag: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 获取电影类型 */
    getListClassification() {
      listClassification({}).then(res => {
        this.collectAddress = res.rows;
      })
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加电影管理";
      this.getListClassification();
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      this.getListClassification();
      getFilms(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改电影管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateFilms(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addFilms(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除？').then(function () {
        return delFilms(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$modal.confirm('是否确认导出所有电影管理数据项？').then(() => {
        this.exportLoading = true;
        return exportFilms(queryParams);
      }).then(response => {
        this.download(response.msg);
        this.exportLoading = false;
      }).catch(() => {
      });
    }
  }
};
</script>
