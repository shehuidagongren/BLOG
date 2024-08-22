<template >
    <el-main class="mainPage">
        <div class="leftcard">
            <el-card >
                <h4>回顾</h4>
            </el-card>
            <el-card>
                <h4>csdn</h4>
            </el-card>
            <el-card>
                <h4>来源2</h4>
            </el-card>
            <el-card>
                <h4>来源3</h4>
            </el-card>
            <el-card>
                <h4>写篇博客</h4>
            </el-card>
            

        </div>
        <div  class="rightcard">
            <el-card >
                <h4>新鲜事</h4>
            </el-card>
            <el-card >
                <h4>最近文章</h4>
            </el-card>
            <el-card >
                <h4>昨日文章</h4>
            </el-card>
            <el-card >
                <h4>上周今日</h4>
            </el-card>
            <el-card >
                <h4>上月今日</h4>
            </el-card>
            <el-card >
                <h4>去年今日</h4>
            </el-card>

        </div>
    </el-main>
</template>

<script>
export default {
    name: "dailyArticle",
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