<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="目标名称" prop="goalName">
        <el-input v-model="queryParams.goalName" placeholder="请输入目标名称" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="目标状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择目标状态" clearable>
          <el-option v-for="dict in dict.type.blog_goal_status" :key="dict.value" :label="dict.label"
            :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="目标类型" prop="goalType">
        <el-select v-model="queryParams.goalType" placeholder="请选择目标类型" clearable>
          <el-option v-for="dict in dict.type.blog_article_type" :key="dict.value" :label="dict.label"
            :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="目标标签" prop="goalTag">
        <el-select v-model="queryParams.goalTag" placeholder="请选择目标标签" clearable>
          <el-option v-for="dict in dict.type.blog_article_tag" :key="dict.value" :label="dict.label"
            :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="实现时间">
        <el-date-picker v-model="daterangeComeTrueData" style="width: 240px" value-format="yyyy-MM-dd" type="daterange"
          range-separator="-" start-placeholder="开始日期" end-placeholder="结束日期"></el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd"
          v-hasPermi="['blog:goal:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate"
          v-hasPermi="['blog:goal:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete"
          v-hasPermi="['blog:goal:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport"
          v-hasPermi="['blog:goal:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="goalList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="序号" align="center" prop="id" width="50" />
      <el-table-column label="目标图片" align="center" prop="imageUrl" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.imageUrl" :width="50" :height="50" />
        </template>
      </el-table-column>
      <el-table-column label="目标名称" align="center" prop="goalName" width="100" />
      <el-table-column label="目标描述" align="center" prop="description"  width="140" />
      <el-table-column label="目标状态" align="center" prop="status"  width="100"  >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.blog_goal_status" :value="scope.row.status"  />
        </template>
      </el-table-column>
      <el-table-column label="目标类型" align="center" prop="goalType"  width="100" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.blog_article_type" :value="scope.row.goalType" />
        </template>
      </el-table-column>
      <el-table-column label="目标标签" align="center" prop="goalTag"  width="100" >
        <template slot-scope="scope">
          <dict-tag :options="dict.type.blog_article_tag" :value="scope.row.goalTag" />
        </template>
      </el-table-column>


      <el-table-column label="博客索引" align="center" prop="articleId"  width="100" />
      <el-table-column label="展示顺序" align="center" prop="orderIndex"  width="100" />
      <el-table-column label="实现时间" align="center" prop="comeTrueData" width="100">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.comeTrueData, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="收藏时间" align="center" prop="createdAt" width="100">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createdAt, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)"
            v-hasPermi="['blog:goal:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)"
            v-hasPermi="['blog:goal:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize"
      @pagination="getList" />

    <!-- 添加或修改学习目标对话框 -->
    <el-dialog :title="title" :visible.sync="open" width=70% append-to-body :close-on-click-modal="false">
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="目标名称" prop="goalName">
              <el-input v-model="form.goalName" placeholder="请输入目标名称" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="博客索引" prop="articleId">
              <el-input v-model="form.articleId" placeholder="请输入博客索引" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="目标状态" prop="status">
              <el-select v-model="form.status" placeholder="请选择目标状态">
                <el-option v-for="dict in dict.type.blog_goal_status" :key="dict.value" :label="dict.label"
                  :value="parseInt(dict.value)"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="目标类型" prop="goalType">
              <el-select v-model="form.goalType" placeholder="请选择目标类型">
                <el-option v-for="dict in dict.type.blog_article_type" :key="dict.value" :label="dict.label"
                  :value="parseInt(dict.value)"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row>
          <el-col :span="12">
            <el-form-item label="目标标签" prop="goalTag">
              <el-select v-model="form.goalTag" placeholder="请选择目标标签">
                <el-option v-for="dict in dict.type.blog_article_tag" :key="dict.value" :label="dict.label"
                  :value="parseInt(dict.value)"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="展示顺序" prop="orderIndex">
              <el-input-number v-model="form.orderIndex" controls-position="right" :min="0"
                :max="100"></el-input-number>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="图片" prop="imageUrl">
              <image-upload v-model="form.imageUrl" />
            </el-form-item>

          </el-col>
          <el-col :span="12">
            <el-row>
              <el-form-item label="目标描述" prop="description">
                <el-input v-model="form.description" placeholder="请输入目标描述" />
              </el-form-item>
            </el-row>
            <el-row>
              <el-form-item label="网站链接" prop="websiteUrl">
                <el-input v-model="form.websiteUrl" placeholder="请输入网站链接" />
              </el-form-item>
            </el-row>
            <el-row>
              <el-form-item label="前置条件" prop="precondition">
                <el-input v-model="form.precondition" placeholder="请输入前置条件" />
              </el-form-item>
            </el-row>
          </el-col>
        </el-row>

      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import {
    listGoal,
    getGoal,
    delGoal,
    addGoal,
    updateGoal
  } from "@/api/blog/way/studyGoal";

  export default {
    name: "Goal",
    dicts: ['blog_article_tag', 'blog_goal_status', 'blog_article_type'],
    data() {
      return {
        // 遮罩层
        loading: true,
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
        // 学习目标表格数据
        goalList: [],
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        open: false,
        // 收藏时间时间范围
        daterangeComeTrueData: [],
        // 收藏时间时间范围
        daterangeCreatedAt: [],
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          goalName: null,
          status: null,
          goalType: null,
          goalTag: null,
          comeTrueData: null,
        },
        // 表单参数
        form: {},
        // 表单校验
        rules: {
          goalName: [{
            required: true,
            message: "目标名称不能为空",
            trigger: "blur"
          }],
          description: [{
            required: true,
            message: "目标描述不能为空",
            trigger: "blur"
          }],
        }
      };
    },
    created() {
      this.getList();
    },
    methods: {
      /** 查询学习目标列表 */
      getList() {
        this.loading = true;
        this.queryParams.params = {};
        if (null != this.daterangeComeTrueData && '' != this.daterangeComeTrueData) {
          this.queryParams.params["beginComeTrueData"] = this.daterangeComeTrueData[0];
          this.queryParams.params["endComeTrueData"] = this.daterangeComeTrueData[1];
        }
        if (null != this.daterangeCreatedAt && '' != this.daterangeCreatedAt) {
          this.queryParams.params["beginCreatedAt"] = this.daterangeCreatedAt[0];
          this.queryParams.params["endCreatedAt"] = this.daterangeCreatedAt[1];
        }
        listGoal(this.queryParams).then(response => {
          this.goalList = response.rows;
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
          goalName: null,
          description: null,
          status: null,
          goalType: null,
          goalTag: null,
          imageUrl: null,
          websiteUrl: null,
          precondition: null,
          articleId: null,
          orderIndex: null,
          comeTrueData: null,
          createdAt: null
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
        this.daterangeComeTrueData = [];
        this.daterangeCreatedAt = [];
        this.resetForm("queryForm");
        this.handleQuery();
      },
      // 多选框选中数据
      handleSelectionChange(selection) {
        this.ids = selection.map(item => item.id)
        this.single = selection.length !== 1
        this.multiple = !selection.length
      },
      /** 新增按钮操作 */
      handleAdd() {
        this.reset();
        this.open = true;
        this.title = "添加学习目标";
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset();
        const id = row.id || this.ids
        getGoal(id).then(response => {
          this.form = response.data;
          this.open = true;
          this.title = "修改学习目标";
        });
      },
      /** 提交按钮 */
      submitForm() {
        this.$refs["form"].validate(valid => {
          if (valid) {
            if (this.form.id != null) {
              updateGoal(this.form).then(response => {
                this.$modal.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              });
            } else {
              addGoal(this.form).then(response => {
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
        this.$modal.confirm('是否确认删除学习目标编号为"' + ids + '"的数据项？').then(function() {
          return delGoal(ids);
        }).then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        }).catch(() => {});
      },
      /** 导出按钮操作 */
      handleExport() {
        this.download('blog/goal/export', {
          ...this.queryParams
        }, `goal_${new Date().getTime()}.xlsx`)
      }
    }
  };
</script>
