<template>
    <div class="app-container">
        <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="98px">
                                                                                                                                            <el-form-item label="分数" prop="movieRatingSource">
                            <el-input
                                    v-model="queryParams.movieRatingSource"
                                    placeholder="请输入分数"
                                    clearable
                                    size="small"
                                    @keyup.enter.native="handleQuery"
                            />
                        </el-form-item>
                                                                                                                                                    <el-form-item label="电影id" prop="filmsId">
                            <el-input
                                    v-model="queryParams.filmsId"
                                    placeholder="请输入电影id"
                                    clearable
                                    size="small"
                                    @keyup.enter.native="handleQuery"
                            />
                        </el-form-item>
                                                                                                                                                    <el-form-item label="用户Id" prop="userId">
                            <el-input
                                    v-model="queryParams.userId"
                                    placeholder="请输入用户Id"
                                    clearable
                                    size="small"
                                    @keyup.enter.native="handleQuery"
                            />
                        </el-form-item>
                                                                                                                                                                                                                                                                    <el-form-item label="备注" prop="remarks">
                            <el-input
                                    v-model="queryParams.remarks"
                                    placeholder="请输入备注"
                                    clearable
                                    size="small"
                                    @keyup.enter.native="handleQuery"
                            />
                        </el-form-item>
                                                            <el-form-item>
                <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
                <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
            </el-form-item>
        </el-form>

        <el-row :gutter="10" class="mb8">
            <el-col :span="1.5">
                <el-button
                        type="primary"
                        plain
                        icon="el-icon-plus"
                        size="mini"
                        @click="handleAdd"
                        v-hasPermi="['biz:rating:add']"
                >新增</el-button>
            </el-col>
            <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
        </el-row>

        <el-table v-loading="loading" :data="ratingList" @selection-change="handleSelectionChange">
                                                                                <el-table-column label="电影评分" align="center" prop="movieRatingId" />
                                                                                                <el-table-column label="分数" align="center" prop="movieRatingSource" />
                                                                                                <el-table-column label="电影id" align="center" prop="filmsId" />
                                                                                                <el-table-column label="用户Id" align="center" prop="userId" />
                                                                                                                                                                                                                                                                                                                                                <el-table-column label="备注" align="center" prop="remarks" />
                                        <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
                <template slot-scope="scope">
                    <el-button
                            size="mini"
                            type="text"
                            icon="el-icon-edit"
                            @click="handleUpdate(scope.row)"
                            v-hasPermi="['biz:rating:edit']"
                    >修改</el-button>
                    <el-button
                            size="mini"
                            type="text"
                            icon="el-icon-delete"
                            @click="handleDelete(scope.row)"
                            v-hasPermi="['biz:rating:remove']"
                    >删除</el-button>
                </template>
            </el-table-column>
        </el-table>

        <pagination
                v-show="total>0"
                :total="total"
                :page.sync="queryParams.pageNum"
                :limit.sync="queryParams.pageSize"
                @pagination="getList"
        />

        <!-- 添加或修改电影评分对话框 -->
        <el-dialog :title="title" :visible.sync="open" width="50%" append-to-body>
            <el-form ref="form" :model="form" :rules="rules" label-width="90px">
                                                                                                                                                                                                                    <el-form-item label="分数" prop="movieRatingSource">
                                    <el-input v-model="form.movieRatingSource" placeholder="请输入分数" />
                                </el-form-item>
                                                                                                                                                                                                                                                        <el-form-item label="电影id" prop="filmsId">
                                    <el-input v-model="form.filmsId" placeholder="请输入电影id" />
                                </el-form-item>
                                                                                                                                                                                                                                                        <el-form-item label="用户Id" prop="userId">
                                    <el-input v-model="form.userId" placeholder="请输入用户Id" />
                                </el-form-item>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        <el-form-item label="备注" prop="remarks">
                                    <el-input v-model="form.remarks" placeholder="请输入备注" />
                                </el-form-item>
                                                                                                                    </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button type="primary" @click="submitForm">确 定</el-button>
                <el-button @click="cancel">取 消</el-button>
            </div>
        </el-dialog>
    </div>
</template>

<script>
    import { listRating, getRating, delRating, addRating, updateRating, exportRating } from "@/api/biz/rating";

    export default {
        name: "Rating",
                data() {
            return {
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
                // 电影评分表格数据
                    ratingList: [],
                                // 弹出层标题
                title: "",
                // 是否显示弹出层
                open: false,
                                                                                                                                                                                                                                                                                                                                                                    // 查询参数
                queryParams: {
                    pageNum: 1,
                    pageSize: 10,
                                                                            movieRatingSource: null,
                                                                filmsId: null,
                                                                userId: null,
                                                                                                                                                                                remarks: null
                                    },
            // 表单参数
            form: {},
            // 表单校验
            rules: {
                                                                                                                                                movieRatingSource: [
                        { required: true, message: "分数不能为空", trigger: "blur" }
                    ],
                                                                                                                                filmsId: [
                        { required: true, message: "电影id不能为空", trigger: "blur" }
                    ],
                                                                                                                                userId: [
                        { required: true, message: "用户Id不能为空", trigger: "blur" }
                    ],
                                                                                                                                                                                                                                    }
        };
        },
        created() {
            this.getList();
        },
        methods: {
            /** 查询电影评分列表 */
            getList() {
                this.loading = true;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        listRating(this.queryParams).then(response => {
                    this.ratingList = response.rows;
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
                                                            movieRatingId: null,
                                                                                movieRatingSource: null,
                                                                                filmsId: null,
                                                                                userId: null,
                                                                                createTime: null,
                                                                                createBy: null,
                                                                                updateTime: null,
                                                                                updateBy: null,
                                                                                remarks: null
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
                this.ids = selection.map(item => item.movieRatingId)
                this.single = selection.length!==1
                this.multiple = !selection.length
            },
            /** 新增按钮操作 */
            handleAdd() {
                this.reset();
                this.open = true;
                this.title = "添加电影评分";
            },
            /** 修改按钮操作 */
            handleUpdate(row) {
                this.reset();
                const movieRatingId = row.movieRatingId || this.ids
                getRating(movieRatingId).then(response => {
                    this.form = response.data;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        this.open = true;
                    this.title = "修改电影评分";
                });
            },
            /** 提交按钮 */
            submitForm() {
                this.$refs["form"].validate(valid => {
                    if (valid) {
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        if (this.form.movieRatingId != null) {
                            updateRating(this.form).then(response => {
                                this.$modal.msgSuccess("修改成功");
                                this.open = false;
                                this.getList();
                            });
                        } else {
                            addRating(this.form).then(response => {
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
                const movieRatingIds = row.movieRatingId || this.ids;
                this.$modal.confirm('是否确认删除？').then(function() {
                    return delRating(movieRatingIds);
                }).then(() => {
                    this.getList();
                    this.$modal.msgSuccess("删除成功");
                }).catch(() => {});
            },
        /** 导出按钮操作 */
    handleExport() {
        const queryParams = this.queryParams;
        this.$modal.confirm('是否确认导出所有电影评分数据项？').then(() => {
            this.exportLoading = true;
            return exportRating(queryParams);
        }).then(response => {
            this.download(response.msg);
            this.exportLoading = false;
        }).catch(() => {});
    }
    }
    };
</script>
