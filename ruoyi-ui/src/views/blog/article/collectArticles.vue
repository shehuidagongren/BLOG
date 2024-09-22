<template>
  <div class="app-container">
    <el-card style="width: 15%;background: rgba(255, 255, 255, 0.6); position: fixed;right: 2%; ">
      <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
        <el-row>
          <el-form-item label="文章标题" prop="title">
            <el-input v-model="queryParams.title" placeholder="请输入收藏的博客或文章标题" clearable @keyup.enter.native="handleQuery" />
          </el-form-item>
        </el-row>
        <el-row>
          <el-form-item label="博客作者" prop="author">
            <el-input v-model="queryParams.author" placeholder="请输入博客或文章的作者" clearable @keyup.enter.native="handleQuery" />
          </el-form-item>
        </el-row>
        <el-row>
          <el-form-item label="文章类型" prop="articleType">
                  <el-select v-model="queryParams.articleType" placeholder="请选择文章类型" clearable>
                    <el-option v-for="dict in dict.type.blog_article_type" :key="dict.value" :label="dict.label"
                      :value="dict.value" />
                  </el-select>
                </el-form-item>
        </el-row>
        <el-row>
          <el-form-item label="文章标签" prop="articleTag">
            <el-select v-model="queryParams.articleTag" placeholder="请选择文章标签" clearable>
              <el-option v-for="dict in dict.type.blog_article_tag" :key="dict.value" :label="dict.label"
                :value="dict.value" />
            </el-select>
          </el-form-item>
        </el-row>
        <el-row>
          <el-form-item label="文章方向" prop="articleDirection">
            <el-select v-model="queryParams.articleDirection" placeholder="请选择文章方向" clearable>
              <el-option v-for="dict in dict.type.blog_article_direction" :key="dict.value" :label="dict.label"
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

    <el-card  v-loading="loading" style="width: 75%;background: rgba(255, 255, 255, 0);">
      <router-link v-for="(article, index) in favoritesList" :key="index" :to="{ name: 'favoriteParticular',
       query: {  articleId: article.id  }}">
        <el-card style="background: rgba(255, 255, 255, 0.5); margin-bottom: 10px; cursor: pointer; " shadow="hover">
          <el-row>
              <el-row style="font-size: 40px;font-weight: bold;">
                {{article.title}}
              </el-row>
              <el-row style="font-size: 18px;font-weight: bold;">
                <el-col :span="8">
                  <img src="@/assets/blogIcon/author.svg" width="20px" height="20px" alt="作者">
                  文章作者：{{article.author}}
                </el-col>
                <el-col :span="16">
                  <img src="@/assets/blogIcon/author.svg" width="20px" height="20px" alt="作者">
                  文章URL:{{article.url}}
                </el-col>
              </el-row>

              <el-row style="font-size: 30px;">
                <el-col :span="8">
                  <template>
                    <dict-tag :options="dict.type.blog_article_direction " :value="article.articleDirection" />
                  </template>
                </el-col>
                <el-col :span="8">
                  <template>
                    <dict-tag :options="dict.type.blog_article_type" :value="article.articleType" />
                  </template>
                </el-col>
                <el-col :span="8">
                  <template>
                    <dict-tag :options="dict.type.blog_article_tag" :value="article.articleTag" />
                  </template>
                </el-col>
              </el-row>
              <p v-html="article.description" style="height: 60px;">
              </p>

          </el-row>
        </el-card>
      </router-link>

      <el-card>
        <pagination v-show="total>0" :total="total" :page.sync="queryParams.pageNum" :limit.sync="queryParams.pageSize"
          @pagination="getList" />
      </el-card>
    </el-card>


  </div>
</template>

<script>
  import {
    listFavorites
    // ,
    // getFavorites,
    // updateFavorites
  } from "@/api/blog/article/collectArticles";

  export default {
    name: "Articles",
    dicts: ['blog_article_tag', 'blog_article_direction', 'blog_article_type',
    ],
    data() {
      return {
        // 遮罩层
        loading: true,
        // 显示搜索条件
        showSearch: true,
        // 总条数
        total: 0,
        // 文章表格数据
        favoritesList: [],
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          title: null,
          author: null,
          articleType: null,
          articleTag: null,
          articleDirection: null,
        },
        // 表单参数
        form: {},
        // 表单校验
      };
    },
    created() {
      this.getList();
    },
    methods: {
      /** 查询文章列表 */

      getList() {
      this.loading = true;
      listFavorites(this.queryParams).then(response => {
        try {
          this.favoritesList = response.rows;
          this.total = response.total;
        } catch (error) {
          console.error('Error processing response:', error);
          // 处理错误，例如显示错误消息
        }
      }).catch(error => {
        console.error('Error fetching articles:', error);
        // 处理请求错误，例如显示错误消息
      }).finally(() => {
        this.loading = false;
      });
    },
      // 取消按钮
      cancel() {
        this.reset();
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
    }
  };
</script>

<style scoped>
.app-container{
  margin-left: 10%;
}
</style>
