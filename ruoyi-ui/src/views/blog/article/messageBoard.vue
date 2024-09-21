<template>
  <div>
 
 
      <div  >
        <el-card style="width: 100%;background: rgba(255, 255, 255, 0.4);">
           <p>遇见即是缘分</p>
           <p>不妨留下足迹</p>
        </el-card>


        <el-card style="width: 100%;background: rgba(255, 255, 255, 0.1); margin-top: 10px;">
          <!-- 共享的评论输入框 -->
          <el-card style="width: 100%;background: rgba(255, 255, 255, 0.3);">
            <p>汇聚{{total}}条留言</p>
          </el-card>

          <!-- 评论列表 -->
          <el-card v-if="comments.length" style="width: 100%;background: rgba(255, 255, 255, 0.1);">
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
 
    <el-card class="tool">
          <el-button size="medium" @click="tool" type="primary">
            发表评论
          </el-button>
        </el-card>
  </div>
 
</template>

<script>
 
  import {
    listComments,
    addComments,
    updateComments
  } from "@/api/blog/common/comments";

  import CommentItem from './CommentItem.vue';
  export default {
    name: "favoriteParticular",
    dicts: ['blog_article_tag', 'blog_article_direction', 'blog_article_type'],
    data() {
      return {
        loading: true,
        form: {},
        total: 0,
        queryParams: {
          pageNum: 1,
          pageSize: 10000,
          articleId: null,
          articleType: null,
        },
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
      };
    },
    computed: {
   
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
        this.queryParams.articleId = 0;
        this.queryParams.articleType = 0;
        this.getList();
 
    },
    methods: { 
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
            this.newComment.articleType = 0;
            this.newComment.articleId = 0;
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
        this.tool();
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

<style>
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
