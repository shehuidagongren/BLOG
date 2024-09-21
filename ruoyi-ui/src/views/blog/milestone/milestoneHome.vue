<template >
    <el-main class="mainPage">
        <div class="leftcard">
            <el-card >
                <h4>博客数据</h4>
            </el-card>
            <el-card>
                <h4>占用内存</h4>
                <h4>响应时间</h4>
                <h4>数据分析</h4>
                <h4></h4>
            </el-card>
            <el-card>
                <h4>运行时间</h4>
                <h4>博客命运</h4>
            </el-card>

            <el-card>
                <h2>网站模块拓展过程</h2>
                <h3>上线核心模块-博客</h3>
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
    name: "milestoneHome",
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
