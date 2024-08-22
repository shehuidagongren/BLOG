<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="文章标题" prop="title">
        <el-input v-model="queryParams.title" placeholder="请输入收藏的博客或文章标题" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="博客作者" prop="author">
        <el-input v-model="queryParams.author" placeholder="请输入博客或文章的作者" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="文章类型" prop="articleType">
        <el-select v-model="queryParams.articleType" placeholder="请选择文章类型" clearable>
          <el-option v-for="dict in dict.type.blog_article_type" :key="dict.value" :label="dict.label"
            :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="文章标签" prop="articleTag">
        <el-select v-model="queryParams.articleTag" placeholder="请选择文章标签" clearable>
          <el-option v-for="dict in dict.type.blog_article_tag" :key="dict.value" :label="dict.label"
            :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="文章方向" prop="articleDirection">
        <el-select v-model="queryParams.articleDirection" placeholder="请选择文章方向" clearable>
          <el-option v-for="dict in dict.type.blog_article_direction" :key="dict.value" :label="dict.label"
            :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="文章状态" prop="articleStatus">
        <el-select v-model="queryParams.articleStatus" placeholder="请选择文章状态" clearable>
          <el-option v-for="dict in dict.type.blog_article_status" :key="dict.value" :label="dict.label"
            :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd"
          v-hasPermi="['blog:favorites:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate"
          v-hasPermi="['blog:favorites:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete"
          v-hasPermi="['blog:favorites:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport"
          v-hasPermi="['blog:favorites:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="favoritesList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="序号" align="center" prop="id" />
      <el-table-column label="文章标题" align="center" prop="title" />
      <el-table-column label="文章描述" align="center" prop="description" />
      <el-table-column label="文章URL" align="center" prop="url" />
      <el-table-column label="文章作者" align="center" prop="author" />
      <el-table-column label="笔记" align="center" prop="notes" />
      <el-table-column label="文章类型" align="center" prop="articleType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.blog_article_type" :value="scope.row.articleType" />
        </template>
      </el-table-column>
      <el-table-column label="文章标签" align="center" prop="articleTag">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.blog_article_tag" :value="scope.row.articleTag" />
        </template>
      </el-table-column>
      <el-table-column label="文章方向" align="center" prop="articleDirection">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.blog_article_direction" :value="scope.row.articleDirection" />
        </template>
      </el-table-column>
      <el-table-column label="文章状态" align="center" prop="articleStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.blog_article_status" :value="scope.row.articleStatus" />
        </template>
      </el-table-column>
      <el-table-column label="收藏日期" align="center" prop="favoriteDate" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.favoriteDate, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="更新时间" align="center" prop="articleUpdatedAt" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.articleUpdatedAt, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)"
            v-hasPermi="['blog:favorites:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)"
            v-hasPermi="['blog:favorites:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize"
      @pagination="getList" />

    <!-- 添加或修改博客收藏对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="70%" append-to-body :close-on-click-modal="false">
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="文章标题" prop="title">
              <el-input v-model="form.title" placeholder="请输入收藏的博客或文章标题" />
            </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="文章作者" prop="author">
                <el-input v-model="form.author" placeholder="请输入博客或文章的作者" />
              </el-form-item>
            </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="文章URL" prop="url">
              <el-input v-model="form.url" placeholder="请输入博客或文章的URL链接" />
            </el-form-item>
            </el-col>
            <el-col :span="12">

            </el-col>
        </el-row>

        <el-row>
          <el-col :span="12">
            <el-form-item label="文章类型" prop="articleType">
              <el-select v-model="form.articleType" placeholder="请选择文章类型">
                <el-option v-for="dict in dict.type.blog_article_type" :key="dict.value" :label="dict.label"
                  :value="parseInt(dict.value)"></el-option>
              </el-select>
            </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="文章标签" prop="articleTag">
                <el-select v-model="form.articleTag" placeholder="请选择文章标签">
                  <el-option v-for="dict in dict.type.blog_article_tag" :key="dict.value" :label="dict.label"
                    :value="parseInt(dict.value)"></el-option>
                </el-select>
              </el-form-item>
            </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="文章方向" prop="articleDirection">
              <el-select v-model="form.articleDirection" placeholder="请选择文章方向">
                <el-option v-for="dict in dict.type.blog_article_direction" :key="dict.value" :label="dict.label"
                  :value="parseInt(dict.value)"></el-option>
              </el-select>
            </el-form-item>
            </el-col>
            <el-col :span="12">
              <el-form-item label="文章状态" prop="articleStatus">
                <el-select v-model="form.articleStatus" placeholder="请选择文章状态">
                  <el-option v-for="dict in dict.type.blog_article_status" :key="dict.value" :label="dict.label"
                    :value="parseInt(dict.value)"></el-option>
                </el-select>
              </el-form-item>
            </el-col>
        </el-row>

        <el-form-item label="文章描述" prop="description">
          <el-input v-model="form.description" type="textarea" placeholder="请输入内容" />
        </el-form-item>

        <el-form-item label="笔记" prop="notes">
          <el-input v-model="form.notes" type="textarea" placeholder="请输入内容" />
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
  import {
    listFavorites,
    getFavorites,
    delFavorites,
    addFavorites,
    updateFavorites
  } from "@/api/blog/article/collectArticles";

  export default {
    name: "Favorites",
    dicts: ['blog_article_tag', 'blog_article_direction',  'blog_article_type', 'blog_article_status'],
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
        // 博客收藏表格数据
        favoritesList: [],
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        open: false,
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          title: null,
          author: null,
          articleType: null,
          articleTag: null,
          articleDirection: null,
          articleStatus: null,
          favoriteDate: null,
          articleUpdatedAt: null
        },
        // 表单参数
        form: {},
        // 表单校验
        rules: {
          title: [{
            required: true,
            message: "收藏的博客或文章标题不能为空",
            trigger: "blur"
          }],
          url: [{
            required: true,
            message: "博客或文章的URL链接不能为空",
            trigger: "blur"
          }],
        }
      };
    },
    created() {
      this.getList();
    },
    methods: {
      /** 查询博客收藏列表 */
      getList() {
        this.loading = true;
        listFavorites(this.queryParams).then(response => {
          this.favoritesList = response.rows;
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
          description: null,
          url: null,
          author: null,
          notes: null,
          articleType: null,
          articleTag: null,
          articleDirection: null,
          articleStatus: null,
          delFlag: null,
          favoriteDate: null,
          articleUpdatedAt: null
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
      /** 新增按钮操作 */
      handleAdd() {
        this.reset();
        this.open = true;
        this.title = "添加博客收藏";
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset();
        const id = row.id || this.ids
        getFavorites(id).then(response => {
          this.form = response.data;
          this.open = true;
          this.title = "修改博客收藏";
        });
      },
      /** 提交按钮 */
      submitForm() {
        this.$refs["form"].validate(valid => {
          if (valid) {
            if (this.form.id != null) {
              updateFavorites(this.form).then(response => {
                this.$modal.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              });
            } else {
              addFavorites(this.form).then(response => {
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
        this.$modal.confirm('是否确认删除博客收藏编号为"' + ids + '"的数据项？').then(function() {
          return delFavorites(ids);
        }).then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        }).catch(() => {});
      },
      /** 导出按钮操作 */
      handleExport() {
        this.download('blog/favorites/export', {
          ...this.queryParams
        }, `favorites_${new Date().getTime()}.xlsx`)
      }
    }
  };
</script>
