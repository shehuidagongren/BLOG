<template>
  <div>
    <div v-if="loading">加载中...</div>
    <div v-else>
      <div v-if="articleId">
        <el-card style="width: 100%;background: rgba(255, 255, 255, 0.8);">
          <el-row>
            <el-col :span="6">
              <template>
                <div>
                  <ImagePreview :src="form.coverImage" width="90%" height="90%" />
                </div>
              </template>
            </el-col>
            <el-col :span="18">
              <el-row style="font-size: 60px;font-weight: bold;">
                {{form.articleTitle}}
              </el-row>

              <el-row style="font-size: 30px;">
                作者：{{form.articleAuthorId}}
              </el-row>
              <el-row style="font-size: 20px; background-color:  skyblue;">
                文章转载于：<a :href="form.sourceLink" target="_blank">{{ form.sourceLink }}</a>
              </el-row>
              <el-row style="margin-top: 20px;">
                <el-col :span="8">
                  <template>
                    <dict-tag :options="dict.type.blog_article_direction " :value="form.articleDirection" />
                  </template>
                </el-col>
                <el-col :span="8">
                  <template>
                    <dict-tag :options="dict.type.blog_article_type" :value="form.articleType" />
                  </template>
                </el-col>
                <el-col :span="8">
                  <template>
                    <dict-tag :options="dict.type.blog_article_tag" :value="form.articleTag" />
                  </template>
                </el-col>
              </el-row>

            </el-col>
          </el-row>
          <div v-html="form.articleContent"></div>

          <el-row style="bottom: 0px;font-size: 20px;">
            <el-col :span="8">
              创建时间：{{form.articleCreatedAt}}
            </el-col>
            <el-col :span="8">
              <img src="@/assets/blogIcon/view.svg" width="20px" height="20px" alt="浏览量">
              {{form.articleViews}}
            </el-col>
            <el-col :span="8">
              <img src="@/assets/blogIcon/like.svg" width="20px" height="20px" alt="点赞量">
              {{form.articleLikes}}
            </el-col>
          </el-row>
        </el-card>

        <el-card style="width: 100%;background: rgba(255, 255, 255, 0.1); margin-top: 10px;">
          <!-- 共享的评论输入框 -->
          <el-card style="width: 100%;background: rgba(255, 255, 255, 0.5);">
            <p>汇聚{{total}}条评论</p>
          </el-card>

          <!-- 评论列表 -->
          <el-card v-if="comments.length" style="width: 100%;background: rgba(255, 255, 255, 0.5);">
            <CommentItem v-for="comment in comments" :key="comment.commentId" :comment="comment"
              @reply="setReplyingTo" />
          </el-card>


          <el-card class="shared-comment-box" v-show="toolOpen">
            <div class="input-container">
              <!-- 评论表单 -->
              <el-form :model="newComment" :rules="rules" ref="commentForm">
                <!-- 评论内容输入框 -->
                  <el-form-item   prop="content">
                    <el-input
                      type="textarea"
                      :autosize="{ minRows: 1, maxRows: 5 }"
                      v-model="newComment.content"
                        :placeholder="replyingTo ? `回复 ${replyingTo}` : '请输入评论'"
                    ></el-input>
                  </el-form-item>
                <el-row>
                <el-col :span="8">
                  <!-- 用户名称输入框 -->
                  <el-form-item prop="userName">
                    <el-input v-model="newComment.userName" placeholder="请输入您的姓名" class="comment-input"></el-input>
                  </el-form-item>
                </el-col>
                <el-col :span="8">
                  <!-- 用户邮箱输入框 -->
                  <el-form-item prop="userEmail">
                    <el-input v-model="newComment.userEmail" placeholder="请输入您的邮箱" class="comment-input"></el-input>
                  </el-form-item>
                </el-col>
                <el-col :span="8">
                      <el-button size="medium" @click="sendComment" type="primary" :disabled="!isCommentValid"
                        style="min-width: 100px; width: 30%; height: 40px;margin-left: 10%; margin-top: 10px;">
                        发表评论
                      </el-button>
                      <el-button size="medium" @click="toolfalse" type="warning"
                        style="min-width: 100px; width: 30%; height: 40px; margin-top: 10px;">
                        关闭
                      </el-button>
                </el-col>
                </el-row>
              </el-form>
            </div>
          </el-card>
        </el-card>
      </div>
    </div>
    <div v-else>
      <p>文章ID未找到，请检查URL参数。</p>
    </div>
    <el-card class="tool">
      <el-button size="medium" @click="tool" type="primary">
        发表评论
      </el-button>
    </el-card>
  </div>

</template>

<script>
  import {
    getArticles
  } from "@/api/blog/article/articles"; // 只导入需要的API函数
  import {
    listComments,
    addComments,
    updateComments
  } from "@/api/blog/common/comments";

  import CommentItem from './CommentItem.vue';
  export default {
    name: "articleParticular",
    dicts: ['blog_article_tag', 'blog_article_direction', 'blog_article_type', 'blog_article_status'],
    data() {
      return {
        loading: true,
        // 总数
        total: 0,
        queryParams: {
          pageNum: 1,
          pageSize: 10000,
          articleId: null,
          articleType: null,
        },
        // 博客表单
        form: {},

        toolOpen: false,
        replyingTo: null, // Track who is being replied to
        comments: [], // 存储从数据库获取的评论数据
        newComment: {
          userId: null, // 用户ID，如果是登录用户则非null
          userName: '', // 用户名
          userEmail: '', // 用户邮箱
          content: '', // 评论内容
          parentCommentId: null, // 被回复的评论ID
        },
        rules: {
          content: [{
            required: true,
            message: '请输入您的评论',
            trigger: 'blur'
          }],
          userName: [{
            required: true,
            message: '请输入您的姓名',
            trigger: 'blur'
          }],
          userEmail: [{
              required: true,
              message: '请输入您的邮箱',
              trigger: 'blur'
            },
            {
              type: 'email',
              message: '请输入有效的邮箱地址',
              trigger: 'blur'
            }
          ]
        },

      }
    },
    computed: {
      // 计算属性用于从路由查询参数中获取articleId
      articleId() {
        return this.$route.query.articleId;
      },
      isCommentValid() {
        return this.newComment.userName.trim() !== '' && this.newComment.content.trim() !== '' && this.newComment
          .userEmail.trim() !== '';
      }
    },
    components: {
      CommentItem,
    },
    created() {
      // 组件创建时，检查是否有articleId参数，并调用API获取文章数据
      if (this.articleId) {
        this.fetchArticleData(this.articleId);
        this.queryParams.articleId = this.articleId;
        this.queryParams.articleType = 1;
        this.getList();
      } else {
        console.error("缺少必要的文章ID参数");
        this.loading = false;
      }
    },
    methods: {
      fetchArticleData(articleId) {
        // 使用getArticles API函数获取文章数据
        getArticles(articleId).then(response => {
          this.form = response.data;
          this.loading = false;
        }).catch(error => {
          console.error("获取文章数据失败:", error);
          this.loading = false;
        });
      },
      // 评论模块
      getList() {
        this.loading = true;
        listComments(this.queryParams).then(response => {
           const comments = response.rows;
          this.comments = this.buildCommentTree(comments);
          console.log(this.comments);
          this.total = response.total;
          this.loading = false;
        });
      },
      buildCommentTree(comments, parentId = null) {
        return comments
          .filter(comment => comment.parentCommentId === parentId)
          .map(comment => ({
            ...comment,
            children: this.buildCommentTree(comments, comment.commentId),
          }));
      },

      sendComment() {
        this.$refs.commentForm.validate((valid) => {
          if (valid) {
            this.newComment.articleType = 1;
            this.newComment.articleId = this.form.id;
            this.newComment.status = 2;
            addComments(this.newComment).then(response => {
              // 重置输入框
              this.newComment.content = '';
              this.newComment.parentCommentId = null;
              this.replyingTo = null;
              // 刷新评论列表
              listComments(this.queryParams).then(response => {
                const comments = response.rows;
                this.comments = this.buildCommentTree(comments);
                this.total = response.total;
              });
              this.toolfalse();
            });
          } else {
            this.$message({
              showClose: true,
              type: 'warning',
              message: '用户名和评论内容不能为空'
            });
            return;
          }
        });
      },
      setReplyingTo(comment) {
        this.replyingTo = comment.userName; // 显示正在回复的用户名
        this.newComment.parentCommentId = comment.commentId; // 设置被回复的评论ID
        // this.$refs.commentInput.focus(); // 聚焦到输入框
      },
      tool() {
        if (this.toolOpen) {
          this.toolOpen = false;
          this.newComment.parentCommentId = null;
          this.newComment.content = '';
          this.replyingTo = null;
        } else {
          this.toolOpen = true;
        }
      },
      toolfalse() {
        this.newComment.parentCommentId = null;
        this.newComment.content = '';
        this.replyingTo = null;
        this.toolOpen = false;
      }
    }
  };
</script>

<style scoped>
  /* 你的样式 */

  .shared-comment-box {
    position: fixed;
    bottom: 20%;
    width: 70%;
    background-color: white;
    padding: 10px;
    box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.1);
  }

  .input-container {
    /* display: flex; */
    align-items: center;
  }

  .comment-input {
    flex: 1;
    margin-right: 10px;
    border: 1px solid #ccc;
    padding: 10px;
    border-radius: 4px;
  }

  .tool {
    background: rgba(255, 255, 255, 0.7);
    position: fixed;
    left: 10%;
    bottom: 27%;
  }
</style>
