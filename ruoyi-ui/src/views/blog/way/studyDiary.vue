<template >
    <el-main class="mainPage">
        <div class="leftcard">
            <el-card >
                <h4>寄语</h4>
            </el-card>
            <el-card>
                <h4>历程</h4>
            </el-card>
          
            

        </div>
        <div  class="rightcard">
            <el-card >
                <h4>有道每一一句</h4>
            </el-card>
            <el-card >
                <h4>每日一句</h4>
            </el-card>
            <el-card >
                <h4>每日一句</h4>
            </el-card>
            <el-card >
                <h4>每日一句</h4>
            </el-card>
            <el-card >
                <h4>每日一句</h4>
            </el-card>


        </div>
    </el-main>
</template>

<script>
export default {
    name: "studyDiary",
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