<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="工具名称" prop="toolName">
        <el-input
          v-model="queryParams.toolName"
          placeholder="请输入工具名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="工具类型" prop="type">
        <el-select v-model="queryParams.type" placeholder="请选择工具类型" clearable>
          <el-option
            v-for="dict in dict.type.blog_tool_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="用户id" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入用户id"
          clearable
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
          v-hasPermi="['blog:toolbox:add']"
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
          v-hasPermi="['blog:toolbox:edit']"
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
          v-hasPermi="['blog:toolbox:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['blog:toolbox:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="toolboxList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <el-table-column label="唯一ID" align="center" prop="id"width="100" />
      <el-table-column label="工具图片" align="center" prop="imageUrl" width="100">
        <template slot-scope="scope">
          <image-preview :src="scope.row.imageUrl" :width="50" :height="50" />
        </template>
      </el-table-column>
      <el-table-column label="工具名称" align="center" prop="toolName"  width="100"/>
      <!-- <el-table-column label="工具链接" align="center" prop="linkUrl" /> -->
    <el-table-column label="工具描述" align="center" prop="description" />
      <el-table-column label="工具类型" align="center" prop="type" width="100">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.blog_tool_type" :value="scope.row.type"/>
        </template>
      </el-table-column>
      <el-table-column label="工具顺序" align="center" prop="orderIndex" width="100"/>
      <el-table-column label="用户id" align="center" prop="userId" width="100"/>
      <el-table-column label="创建时间" align="center" prop="createdAt" width="120">
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
            v-hasPermi="['blog:toolbox:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['blog:toolbox:remove']"
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

    <!-- 添加或修改工具管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="60%" append-to-body :close-on-click-modal="false">
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-row>
          <el-col :span="8">
            <el-form-item label="封面图片" prop="imageUrl">
              <image-upload v-model="form.imageUrl" />
            </el-form-item>
          </el-col>
          <el-col :span="16">
            <el-row>
              <el-form-item label="工具名称" prop="toolName">
                <el-input v-model="form.toolName" placeholder="请输入工具名称" />
              </el-form-item>
            </el-row>
            <el-row>
              <el-form-item label="工具描述" prop="description">
                <el-input v-model="form.description" placeholder="请输入工具描述" />
              </el-form-item>
            </el-row>
            <el-row>
              <el-form-item label="工具链接" prop="linkUrl">
                <el-input v-model="form.linkUrl" placeholder="请输入工具链接" />
              </el-form-item>
            </el-row>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="8">
            <el-form-item label="工具类型" prop="type">
              <el-select v-model="form.type" placeholder="请选择工具类型">
                <el-option
                  v-for="dict in dict.type.blog_tool_type"
                  :key="dict.value"
                  :label="dict.label"
                  :value="parseInt(dict.value)"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="工具顺序" prop="orderIndex">
              <el-input-number v-model="form.orderIndex" controls-position="right" :min="0"
                :max="100"></el-input-number>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="用户id" prop="userId">
              <el-input v-model="form.userId" placeholder="请输入用户id" />
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
import { listToolbox, getToolbox, delToolbox, addToolbox, updateToolbox } from "@/api/blog/home/toolCabinet";

export default {
  name: "Toolbox",
  dicts: ['blog_tool_type'],
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
      // 工具管理表格数据
      toolboxList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        toolName: null,
        type: null,
        userId: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        toolName: [
          { required: true, message: "工具名称不能为空", trigger: "blur" }
        ],
        linkUrl: [
          { required: true, message: "工具链接不能为空", trigger: "blur" }
        ],
        type: [
          { required: true, message: "工具类型不能为空", trigger: "change" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询工具管理列表 */
    getList() {
      this.loading = true;
      listToolbox(this.queryParams).then(response => {
        this.toolboxList = response.rows;
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
        toolName: null,
        description: null,
        imageUrl: null,
        linkUrl: null,
        type: null,
        orderIndex: null,
        userId: null,
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
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加工具管理";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getToolbox(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改工具管理";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateToolbox(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addToolbox(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除工具管理编号为"' + ids + '"的数据项？').then(function() {
        return delToolbox(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('blog/toolbox/export', {
        ...this.queryParams
      }, `toolbox_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
