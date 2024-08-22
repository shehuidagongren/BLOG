<template>
  <div class="app-container">
    <el-card style="width: 15%;background: rgba(255, 255, 255, 0.6); position: fixed;right: 2%; ">
      <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
        <el-row>
          <el-form-item label="工具名称" prop="toolName">
            <el-input v-model="queryParams.toolName" placeholder="请输入工具名称" clearable
              @keyup.enter.native="handleQuery" />
          </el-form-item>
        </el-row>
        <el-row>
          <el-form-item>
            <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
            <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
          </el-form-item>
        </el-row>
      </el-form>
    </el-card>

    <!-- 工具卡片 -->

         <!-- <div style="width: 75%;"> -->
                <!-- 工具分类列表 -->
                 <el-card class="main-content" style="background: rgba(0,0, 0, 0.2);width: 75%;border-color:rgba(255,255, 255, 0.2) ; ">
                   <div v-for="(tools, type) in groupedToolboxList" :key="type" :id="`section-${type}`" class="tool-category">
                     <h3 class="tool-name">{{ getToolTypeLabel(type) }}</h3>
                     <el-card style="background: rgba(0, 0, 0, 0.2);">
                       <div class="toolbox-container">
                         <el-card v-for="(tool, index) in tools" :key="index" class="tool-card" shadow="hover" style=";border-color:rgba(255,255, 255, 0) ;">
                           <template>
                             <a :href="tool.linkUrl" target="_blank">
                               <div>
                                 <ImagePreview :src="tool.imageUrl" width="40%" :alt="tool.description" style="width: 100%;" class="no-preview" />
                               </div>
                             </a>
                           </template>
                           <p class="tool-name">{{ tool.toolName }}</p>
                         </el-card>
                       </div>
                     </el-card>
                   </div>
                 </el-card>

                    <!-- 进度条 -->
                     <div class="progress-bar">
                       <ul>
                         <li v-for="(type, index) in Object.keys(groupedToolboxList)" :key="index" @click="scrollToSection(type)">
                           {{ getToolTypeLabel(type) }}
                         </li>
                       </ul>
                     </div>

  </div>
</template>

<script>
import { listToolbox, getToolbox } from "@/api/blog/home/toolCabinet";

export default {
  name: "Toolbox",
  dicts: ['blog_tool_type'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 总条数
      total: 0,
      // 显示搜索条件
      showSearch: true,
      // 工具管理表格数据
      toolboxList: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        toolName: null,
        type: null,
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
  computed: {
    groupedToolboxList() {
      // 按工具类型分组工具列表
      return this.toolboxList.reduce((grouped, tool) => {
        if (!grouped[tool.type]) {
          grouped[tool.type] = [];
        }
        grouped[tool.type].push(tool);
        return grouped;
      }, {});
    }
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
 /** 获取工具类型的标签 */
    getToolTypeLabel(type) {
      const dictItem = this.dict.type.blog_tool_type.find(dict => dict.value === type);
      return dictItem ? dictItem.label : "未知类型";
    },
    /** 滚动到指定类型的部分 */
        scrollToSection(type) {
          const section = document.getElementById(`section-${type}`);
          if (section) {
            section.scrollIntoView({ behavior: "smooth" });
          }
        },
  }
};
</script>

<style scoped>
.no-preview {
  pointer-events: none; /* 禁用点击事件 */
}

.toolbox-container {
  display: flex;
  flex-wrap: wrap; /* 当内容过多时换行 */
  justify-content: flex-start; /* 内容居左对齐 */
  align-items: flex-start; /* 内容居顶对齐 */
}

.tool-card {
  background: rgba(255, 255, 255, 0);
  cursor: pointer;
  width: 100px;
  height: 140px;
  border: none;
  margin: 10px; /* 增加卡片之间的间距 */
}

.tool-name {
  color: #fff;
  text-align: center;
}

.tool-category {
  margin-bottom: 20px;
}

/* 进度条样式 */
.progress-bar {
  position: fixed;
  right: 7%;
  bottom: 25%;
  width: 10%;
}

.progress-bar ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.progress-bar li {
  cursor: pointer;
  padding: 10px 0;
  text-align: center;
  background-color: rgba(255, 255, 255, 0.7);
  margin-bottom: 5px;
  border-radius: 5px;
  transition: background-color 0.3s;
}

.progress-bar li:hover {
  background-color: rgba(100, 149, 237, 0.7); /* 改变悬停时的背景颜色 */
}
</style>
