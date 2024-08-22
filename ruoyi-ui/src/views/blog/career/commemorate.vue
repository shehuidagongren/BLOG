<template>
    <div>
        <h2>里程碑</h2>
        <el-timeline style="margin:auto 50px;">
            <el-timeline-item timestamp="步骤一" placement="top">
                <el-card>
                    <h4>课程管理</h4>
                   
                </el-card>
            </el-timeline-item>
            <el-timeline-item timestamp="步骤二" placement="top">
                <el-card>
                    <h4>学生成绩管理</h4>
                </el-card>
            </el-timeline-item>
            <el-timeline-item timestamp="步骤三" placement="top">
                <el-card>
                    <h4>生成课程分析报告</h4>
                </el-card>
            </el-timeline-item>
        </el-timeline>
    </div>
</template>

<script>
export default {
    name: "commemorate",
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
<style>

</style>