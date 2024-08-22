<template>
  <el-main class="mainPage">
    <div class="leftcard">
      <el-card>
        <h2>寄语</h2>
        <h3>明天</h3>
        <h3>今天</h3>
        <h3>昨天</h3>
        <el-card>
          <audio  controls="true" height="100" width="100%"  name="原点  --西单女孩" loop="true">
            <source src="@/assets/audio/yuandian.mp3"  type="audio/mpeg">
          </audio>
        </el-card>
      </el-card>
      <el-card>
        <h2>更新维护历程</h2>
        V1.0.0 项目正式上线运营             -------2023/10/17

      </el-card>

      <el-card>
        <h2>里程碑</h2>
        <ol>
          <li>
            创建项目                    -------2023/11/2
          </li>
          <li>
            完成个人博客功能                    -------2023/08/12
          </li>

          <li>
            网站上线测试                    -------2024/10/01
          </li>
          <li>
            网站正式运行                  -------2023/10/17
          </li>
        </ol>
      </el-card>


    </div>
    <div class="rightcard">
      <el-card>
        <h4>看看别人的博客</h4>
      </el-card>
      <el-card>
        <h4>今日上线的网站</h4>
      </el-card>
    </div>
  </el-main>
</template>

<script>
  export default {
    name: "updateBlog",
    data() {
      return {}
    },
    methods: {

    },
    mounted() {

    }
  }
</script>
<style scoped>
  /* 主要布局 */
  .mainPage {
    padding: 20px;

  }

  /* 左布局 */
  .leftcard {
    float: left;
    width: 70%;
    margin: 3%;
  }

  .leftcard .el-card {
    width: 100%;
    margin-bottom: 50px;
    float: block;
  }

  /* 右布局 */
  .rightcard {
    float: right;
    position: relative;
    margin-right: 5%;
    margin-top: 3%;
    width: 15%;
  }

  .rightcard .el-card {
    width: 100%;
    margin-bottom: 50px;
    float: block;
  }


  /* 主要区域 */
  p {
    margin: 8px;
  }
</style>
