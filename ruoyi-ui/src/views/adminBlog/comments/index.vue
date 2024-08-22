<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="文章ID" prop="articleId">
        <el-input
          v-model="queryParams.articleId"
          placeholder="请输入评论所属文章的ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文章类型" prop="articleType">
        <el-select v-model="queryParams.articleType" placeholder="请选择文章类型" clearable>
          <el-option
            v-for="dict in dict.type.blog_article_class"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="用户昵称" prop="userName">
        <el-input
          v-model="queryParams.userName"
          placeholder="请输入用户昵称，当user_id为NULL时使用"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="用户邮箱" prop="userEmail">
        <el-input
          v-model="queryParams.userEmail"
          placeholder="请输入用户邮箱，用于匿名用户"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="被回复评论ID" prop="parentCommentId">
        <el-input
          v-model="queryParams.parentCommentId"
          placeholder="请输入被回复的评论ID，如果是顶级评论则为NULL"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="评论状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择评论状态" clearable>
          <el-option
            v-for="dict in dict.type.blog_comments_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
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
          v-hasPermi="['blog:comments:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['blog:comments:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['blog:comments:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['blog:comments:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="commentsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="评论ID" align="center" prop="commentId" />
      <el-table-column label="文章ID" align="center" prop="articleId" />
      <el-table-column label="博客类型" align="center" prop="articleType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.blog_article_class" :value="scope.row.articleType"/>
        </template>
      </el-table-column>
      <el-table-column label="用户ID" align="center" prop="userId" />
      <el-table-column label="用户昵称" align="center" prop="userName" />
      <el-table-column label="用户邮箱" align="center" prop="userEmail" />
      <el-table-column label="被回复评论ID" align="center" prop="parentCommentId" />
      <el-table-column label="评论内容" align="center" prop="content" />
      <el-table-column label="评论状态" align="center" prop="status">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.blog_comments_status" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="评创时间" align="center" prop="createdAt" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createdAt, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['blog:comments:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['blog:comments:remove']"
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

    <!-- 添加或修改文章评论对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="70%" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="文章ID" prop="articleId">
              <el-input v-model="form.articleId" placeholder="请输入评论所属文章的ID" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="用户ID" prop="userId">
              <el-input v-model="form.userId" placeholder="请输入发表评论的用户ID，可以为NULL表示匿名用户" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="用户昵称" prop="userName">
              <el-input v-model="form.userName" placeholder="请输入用户昵称，当user_id为NULL时使用" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="用户邮箱" prop="userEmail">
              <el-input v-model="form.userEmail" placeholder="请输入用户邮箱，用于匿名用户" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="文章类型" prop="articleType">
              <el-select v-model="form.articleType" placeholder="请选择文章类型">
                <el-option
                  v-for="dict in dict.type.blog_article_class"
                  :key="dict.value"
                  :label="dict.label"
                  :value="parseInt(dict.value)"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="评论状态" prop="status">
              <el-select v-model="form.status" placeholder="请选择评论状态">
                <el-option
                  v-for="dict in dict.type.blog_comments_status"
                  :key="dict.value"
                  :label="dict.label"
                  :value="dict.value"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="被回复评论ID" prop="parentCommentId">
          <el-input v-model="form.parentCommentId" placeholder="请输入被回复的评论ID，如果是顶级评论则为NULL" />
        </el-form-item>
        <el-form-item label="评论内容">
          <editor v-model="form.content" :min-height="192"/>
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
import { listComments, getComments, delComments, addComments, updateComments } from "@/api/blog/common/comments";

export default {
  name: "Comments",
  dicts: ['blog_comments_status', 'blog_article_class'],
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
      // 文章评论表格数据
      commentsList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        articleId: null,
        articleType: null,
        userName: null,
        userEmail: null,
        parentCommentId: null,
        content: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        articleId: [
          { required: true, message: "评论所属文章的ID不能为空", trigger: "blur" }
        ],
        content: [
          { required: true, message: "评论内容不能为空", trigger: "blur" }
        ],
        status: [
          { required: true, message: "评论状态不能为空", trigger: "change" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询文章评论列表 */
    getList() {
      this.loading = true;
      listComments(this.queryParams).then(response => {
        this.commentsList = response.rows;
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
        commentId: null,
        articleId: null,
        articleType: null,
        userId: null,
        userName: null,
        userEmail: null,
        parentCommentId: null,
        content: null,
        status: null,
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
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.commentId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加文章评论";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const commentId = row.commentId || this.ids
      getComments(commentId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改文章评论";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.commentId != null) {
            updateComments(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addComments(this.form).then(response => {
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
      const commentIds = row.commentId || this.ids;
      this.$modal.confirm('是否确认删除文章评论编号为"' + commentIds + '"的数据项？').then(function() {
        return delComments(commentIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('blog/comments/export', {
        ...this.queryParams
      }, `comments_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
