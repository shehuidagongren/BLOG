<template>
  <el-main class="mainPage">
      <div class="leftcard">

                <el-card >
                    <h2>支持与合作</h2>
                    <h3>联系方式</h3>
                    <ul>
                      <li>
                        QQ邮箱：2293902648@qq.com
                      </li>
                      <li>
                        QQ：2293902648
                      </li>
                    </ul>
                </el-card>

       </div>
      <div  class="rightcard">
          <el-card >
              <h4>看看别人的博客</h4>
          </el-card>
          <el-card >
              <h4>今日上线的网站</h4>
          </el-card>
      </div>

  </el-main>

</template>

<script>
export default {
    name: "cooperation",
    data() {
        return {
        }
    },
    methods: {

    },
    mounted() {

    }
}

</script>

<style scoped>
/* 主要布局 */
.mainPage{
    padding: 20px;
    margin-left:10%;

}

/* 左布局 */
.leftcard{
    float: left;
    width: 70%;
    margin:3% ;
}

.leftcard .el-card{
    width: 100%;
    margin-bottom: 50px;
    float: block;
}

/* 右布局 */
.rightcard{
    float: right;
    position: relative;
    margin-right:5% ;
    margin-top:3% ;
    width: 15%;
}

.rightcard .el-card{
    width: 100%;
    margin-bottom: 50px;
    float: block;
}


/* 主要区域 */
p {
    margin: 8px;
}

</style>
