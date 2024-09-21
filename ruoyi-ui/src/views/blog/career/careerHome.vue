<template >
    <el-main class="mainPage">
        <div class="leftcard">
            <el-card >
                <h4>生涯首页</h4>
            </el-card>
            <el-card>
                <h4>博客数据</h4>
                <h4>数量</h4>
                <h4>饼图分类数量</h4>
                <h4></h4>
            </el-card>
            
            <el-card>
                <h4>博客模块拓展过程</h4>
            </el-card>
            

        </div>
        <div  class="rightcard">
            <el-card >
                <h4>最新跑马灯</h4>
            </el-card>
            <el-card >
                <h4>常用博客类跑马灯</h4>
            </el-card>
        </div>
    </el-main>
</template>


<script>
export default {
    name: "careeHome",
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