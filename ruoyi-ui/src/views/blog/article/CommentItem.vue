<template>

<el-card  class="comment" >
  <div class="comment-content">
    <p><strong>{{ comment.userName || '匿名用户' }}</strong></p>
    <p>{{ comment.content }}</strong></p>

    <span @click="replyToComment(comment)" ><small>{{ dateStr(comment.createdAt) }}</small><i class="iconfont el-icon-s-comment" style="margin-left: 10%;" ></i>回复</span>
  </div>

  <!-- 子评论 -->
  <div class="comment-children" v-if="comment.children && comment.children.length">
    <CommentItem
      v-for="child in comment.children"
      :key="child.commentId"
      :comment="child"
      @reply="replyToComment(child)"
    />
  </div>
</el-card >
</template>

<script>
export default {
  name: "CommentItem",
  props: {
    comment: {
      type: Object,
      required: true
    }
  },
  methods: {
    dateStr(date) {
        var time = new Date().getTime(); // 获取当前时间的时间戳
        var dateTimestamp = new Date(date).getTime(); // 将评论创建时间转换为时间戳
        var timeDifference = (time - dateTimestamp) / 1000; // 计算时间差，单位为秒

        if (timeDifference < 60 * 10) { // 十分钟内
          return '刚刚';
        } else if (timeDifference < 60 * 60 && timeDifference >= 60 * 10) {
          // 超过十分钟少于1小时
          var minutes = Math.floor(timeDifference / 60);
          return minutes + "分钟前";
        } else if (timeDifference < 60 * 60 * 24 && timeDifference >= 60 * 60) {
          // 超过1小时少于24小时
          var hours = Math.floor(timeDifference / 60 / 60);
          return hours + "小时前";
        } else if (timeDifference < 60 * 60 * 24 * 30 && timeDifference >= 60 * 60 * 24) {
          // 超过1天少于30天内
          var days = Math.floor(timeDifference / 60 / 60 / 24);
          return days + "天前";
        } else {
          // 超过30天
          var formattedDate = new Date(dateTimestamp).toLocaleDateString(); // 格式化日期
          return formattedDate;
        }
      },
    replyToComment(comment) {
        this.$emit('reply', comment); // 传递当前评论对象
      },
    // reply() {
    //   this.$emit('reply', this.comment);
    // }
  }
};
</script>

<style>
.comment {
  margin-bottom: 10px;
  width: 100%;
  background: rgba(255, 255, 255, 0.5);
}

.comment-content {
  padding: 10px;
    background: rgba(255, 255, 255, 0.5);
  border-radius: 4px;
}

.comment-children {
  padding-left: 20px;
  margin-top: 10px;
}
</style>
