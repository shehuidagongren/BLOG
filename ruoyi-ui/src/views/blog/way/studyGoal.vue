<template>
  <div class="app-container">
    <el-card style="width: 15%;background: rgba(255, 255, 255, 0.6); position: fixed;right: 2%; ">
      <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
        <el-row>
          <el-form-item label="目标名称" prop="goalName">
            <el-input v-model="queryParams.goalName" placeholder="请输入目标名称" clearable
              @keyup.enter.native="handleQuery" />
          </el-form-item>
        </el-row>
        <el-row>
          <el-form-item label="目标状态" prop="status">
            <el-select v-model="queryParams.status" placeholder="请选择目标状态" clearable>
              <el-option v-for="dict in dict.type.blog_goal_status" :key="dict.value" :label="dict.label"
                :value="dict.value" />
            </el-select>
          </el-form-item>
        </el-row>
        <el-row>
          <el-form-item label="目标类型" prop="goalType">
            <el-select v-model="queryParams.goalType" placeholder="请选择目标类型" clearable>
              <el-option v-for="dict in dict.type.blog_article_type" :key="dict.value" :label="dict.label"
                :value="dict.value" />
            </el-select>
          </el-form-item>
        </el-row>
        <el-row>
          <el-form-item label="目标标签" prop="goalTag">
            <el-select v-model="queryParams.goalTag" placeholder="请选择目标标签" clearable>
              <el-option v-for="dict in dict.type.blog_article_tag" :key="dict.value" :label="dict.label"
                :value="dict.value" />
            </el-select>
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

    <el-card style="width: 75%;background: rgba(255, 255, 255, 0.2);">
      <!-- <el-card
        style="background: rgba(255, 255, 255, 0.5); margin-bottom: 10px; cursor: pointer; width: 100%;height: 70px; "
        shadow="hover">
        <p style="text-align: center; font-size: 40px;margin-top: -10px;">学习目标</p>
      </el-card> -->
      <el-card v-for="(goal, index) in goalList" :key="index"
        style="background: rgba(255, 255, 255, 0.5); margin-bottom: 10px; cursor: pointer; width: 100%;height: 120px; "
        shadow="hover">
        <el-row>
          <el-col :span="6">
            <template>
              <div>
                <ImagePreview :src="goal.imageUrl" width="40%"   />
              </div>
            </template>
          </el-col>
          <el-col :span="18">
            <el-row>
              <el-col :span="6">
                标题：{{goal.goalName}}
              </el-col>
              <el-col :span="6">
                <template>
                  <dict-tag :options="dict.type.blog_article_type" :value="goal.goalType" />
                </template>
              </el-col>
              <el-col :span="6">
                <template>
                  <dict-tag :options="dict.type.blog_article_tag" :value="goal.goalTag" />
                </template>
              </el-col>
              <el-col :span="6">
                <template>
                  <dict-tag :options="dict.type.blog_goal_status" :value="goal.status" />
                </template>
              </el-col>
            </el-row>
            <el-row>
                描述：{{goal.description}}
            </el-row>
            <el-row>
              <el-col :span="18">
                前置条件：{{goal.precondition}}
              </el-col>
                <el-col :span="6">
                  <a :href="goal.websiteUrl" target="_blank"><el-tag >链接直达 -></el-tag></a>
                </el-col>
            </el-row>
            <el-row>
              <el-col :span="12">
                收藏时间：{{goal.createdAt}}
              </el-col>
              <el-col :span="12">
                实现时间：<span>{{ goal.comeTrueData ? goal.comeTrueData : '尚未实现' }}</span>
              </el-col>
            </el-row>
           </el-col>

<!--          <el-row>
            {{goal.articleId}}
          </el-row> -->
        </el-row>
      </el-card>
    </el-card>


  </div>
</template>

<script>
  import {
    listGoal,
    getGoal
  } from "@/api/blog/way/studyGoal";

  export default {
    name: "studyGoal",
    dicts: ['blog_article_tag', 'blog_goal_status', 'blog_article_type'],
    data() {
      return {
        // 遮罩层
        loading: true,
        // 显示搜索条件
        showSearch: true,
        // 总条数
        total: 0,
        // 学习目标表格数据
        goalList: [],


        // 收藏时间时间范围
        daterangeComeTrueData: [],
        // 收藏时间时间范围
        daterangeCreatedAt: [],
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 100,
          goalName: null,
          status: null,
          goalType: null,
          goalTag: null,
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
        listGoal(this.queryParams).then(response => {
          this.goalList = response.rows;
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
        this.daterangeComeTrueData = [];
        this.daterangeCreatedAt = [];
        this.resetForm("queryForm");
        this.handleQuery();
      },
    }
  };
</script>

<style scoped>
.app-container {
  margin-left: 10%;
}
</style>