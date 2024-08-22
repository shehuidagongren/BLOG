<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="文章标题" prop="articleTitle">
        <el-input v-model="queryParams.articleTitle" placeholder="请输入文章标题" clearable
          @keyup.enter.native="handleQuery" />
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
      <el-form-item label="点赞次数" prop="articleLikes">
        <el-input v-model="queryParams.articleLikes" placeholder="请输入文章点赞次数" clearable
          @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="展示次数" prop="articleViews">
        <el-input v-model="queryParams.articleViews" placeholder="请输入文章展示次数" clearable
          @keyup.enter.native="handleQuery" />
      </el-form-item>


      <el-form-item label="允许评论" prop="allowComments">
        <el-select v-model="queryParams.allowComments" placeholder="请选择允许评论" clearable>
          <el-option v-for="dict in dict.type.blog_allow_comments" :key="dict.value" :label="dict.label"
            :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="文章状态" prop="articleStatus">
        <el-select v-model="queryParams.articleStatus" placeholder="请选择文章状态" clearable>
          <el-option v-for="dict in dict.type.blog_article_status" :key="dict.value" :label="dict.label"
            :value="dict.value" />
        </el-select>
      </el-form-item>
      <el-form-item label="文章创建时间" prop="articleCreatedAt">
        <el-date-picker clearable v-model="queryParams.articleCreatedAt" type="date" value-format="yyyy-MM-dd"
          placeholder="请选择文章创建时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd"
          v-hasPermi="['blog:articles:add']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="success" plain icon="el-icon-edit" size="mini" :disabled="single" @click="handleUpdate"
          v-hasPermi="['blog:articles:edit']">修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete"
          v-hasPermi="['blog:articles:remove']">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport"
          v-hasPermi="['blog:articles:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="articlesList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID" align="center" prop="id" width="60" />
      <el-table-column label="文章标题" align="center" prop="articleTitle" width="140" />
      <el-table-column label="作者编号" align="center" prop="articleAuthorId" width="80" />
      <el-table-column label="作者昵称" align="center" prop="articleAuthorName" width="100" />

      <el-table-column label="封面图片" align="center" prop="coverImage" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.coverImage" :width="50" :height="50" />
        </template>
      </el-table-column>
      <el-table-column label="文章类型" align="center" prop="articleType" width="190">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.blog_article_type" :value="scope.row.articleType" />
        </template>
      </el-table-column>
      <el-table-column label="文章标签" align="center" prop="articleTag" width="80">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.blog_article_tag" :value="scope.row.articleTag" />
        </template>
      </el-table-column>
      <el-table-column label="文章方向" align="center" prop="articleDirection" width="80">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.blog_article_direction" :value="scope.row.articleDirection" />
        </template>
      </el-table-column>
      <el-table-column label="允许评论" align="center" prop="allowComments" width="120">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.blog_allow_comments" :value="scope.row.allowComments" />
        </template>
      </el-table-column>
      <el-table-column label="文章状态" align="center" prop="articleStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.blog_article_status" :value="scope.row.articleStatus" />
        </template>
      </el-table-column>
      <el-table-column label="点赞次数" align="center" prop="articleLikes" width="100" />
      <el-table-column label="展示次数" align="center" prop="articleViews" width="100" />
      <el-table-column label="文章创建时间" align="center" prop="articleCreatedAt" width="140">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.articleCreatedAt, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="文章更新时间" align="center" prop="articleUpdatedAt" width="140">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.articleUpdatedAt, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-edit" @click="handleUpdate(scope.row)"
            v-hasPermi="['blog:articles:edit']">修改</el-button>
          <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.row)"
            v-hasPermi="['blog:articles:remove']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize"
      @pagination="getList" />

    <!-- 添加或修改文章对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="70%" append-to-body :close-on-click-modal="false">
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">

        <el-row>
                  <el-col :span="12">
                    <el-form-item label="文章标题" prop="articleTitle">
                      <el-input v-model="form.articleTitle" placeholder="请输入文章标题" />
                    </el-form-item>
                  </el-col>
                  <el-col :span="12">
                    <el-form-item label="原文链接" prop="sourceLink">
                      <el-input v-model="form.sourceLink" placeholder="请输入存储原文链接" />
                    </el-form-item>
                  </el-col>
                </el-row>

        <el-form-item label="文章内容">
          <editor v-model="form.articleContent" :min-height="192" />
        </el-form-item>
        <el-row>
          <el-col :span="12">
            <el-form-item label="作者编号" prop="articleAuthorId">
              <el-input v-model="form.articleAuthorId" placeholder="请输入文章作者编号" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="作者昵称" prop="articleAuthorId">
              <el-input v-model="form.articleAuthorName" placeholder="请输入文章作者编号" />
            </el-form-item>
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
        <el-row>
          <el-col :span="12">
            <el-row>
              <el-form-item label="搜索标题" prop="seoTitle">
                <el-input v-model="form.seoTitle" placeholder="请输入搜索擎优化用的标题" />
              </el-form-item>
            </el-row>
            <el-row>
              <el-form-item label="搜索描述" prop="seoDescription">
                <el-input v-model="form.seoDescription" placeholder="请输入搜索引擎优化用的描述" />
              </el-form-item>
            </el-row>
            <el-row>
              <el-form-item label="允许评论" prop="allowComments">
                <el-select v-model="form.allowComments" placeholder="请选择允许评论">
                  <el-option v-for="dict in dict.type.blog_allow_comments" :key="dict.value" :label="dict.label"
                    :value="parseInt(dict.value)"></el-option>
                </el-select>
              </el-form-item>
            </el-row>


          </el-col>
          <el-col :span="12">
            <el-form-item label="封面图片" prop="coverImage">
              <image-upload v-model="form.coverImage" />
            </el-form-item>

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
    listArticles,
    getArticles,
    delArticles,
    addArticles,
    updateArticles
  } from "@/api/blog/article/articles";

  export default {
    name: "Articles",
    dicts: ['blog_article_tag', 'blog_allow_comments', 'blog_article_direction', 'blog_del_flag', 'blog_article_type',
      'blog_article_status'
    ],
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
        // 文章表格数据
        articlesList: [],
        // 弹出层标题
        title: "",
        // 是否显示弹出层
        open: false,
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          articleTitle: null,
          articleType: null,
          articleTag: null,
          articleDirection: null,
          articleLikes: null,
          articleViews: null,
          seoTitle: null,
          seoDescription: null,
          allowComments: null,
          articleStatus: null,
          articleCreatedAt: null,
        },
        // 表单参数
        form: {},
        // 表单校验
        rules: {
          articleTitle: [{
            required: true,
            message: "文章标题不能为空",
            trigger: "blur"
          }],
          articleContent: [{
            required: true,
            message: "文章内容不能为空",
            trigger: "blur"
          }],
          articleAuthorId: [{
            required: true,
            message: "文章作者编号不能为空",
            trigger: "blur"
          }],
        }
      };
    },
    created() {
      this.getList();
    },
    methods: {
      /** 查询文章列表 */
      getList() {
        this.loading = true;
        listArticles(this.queryParams).then(response => {
          this.articlesList = response.rows;
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
          articleTitle: null,
          articleContent: null,
          articleAuthorId: null,
          articleType: null,
          articleTag: null,
          articleDirection: null,
          articleComments: null,
          articleLikes: null,
          articleViews: null,
          seoTitle: null,
          seoDescription: null,
          coverImage: null,
          sourceLink: null,
          allowComments: null,
          articleStatus: null,
          delFlag: null,
          articleCreatedAt: null,
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
        this.title = "添加文章";
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset();
        const id = row.id || this.ids
        getArticles(id).then(response => {
          this.form = response.data;
          this.open = true;
          this.title = "修改文章";
        });
      },
      /** 提交按钮 */
      submitForm() {
        this.$refs["form"].validate(valid => {
          if (valid) {
            if (this.form.id != null) {
              updateArticles(this.form).then(response => {
                this.$modal.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              });
            } else {
              addArticles(this.form).then(response => {
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
        this.$modal.confirm('是否确认删除文章编号为"' + ids + '"的数据项？').then(function() {
          return delArticles(ids);
        }).then(() => {
          this.getList();
          this.$modal.msgSuccess("删除成功");
        }).catch(() => {});
      },
      /** 导出按钮操作 */
      handleExport() {
        this.download('blog/articles/export', {
          ...this.queryParams
        }, `articles_${new Date().getTime()}.xlsx`)
      }
    }
  };
</script>
