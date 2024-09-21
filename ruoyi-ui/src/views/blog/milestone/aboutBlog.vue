<template >
    <el-main class="mainPage">
        <div class="leftcard">
            <el-card >
                <h2>开发缘由</h2>
                <h3>记录生活</h3>
                <ol>
                  <li>
                    个人表达: 博客是一个展示个人想法、经验和观点的平台。
                  </li>
                  <li>
                    个人成长: 写作可以促进自我反思和个人成长。
                  </li>
                  <li>
                    记录生活: 记录日常生活和旅行经历，与朋友和家人分享。
                  </li>
                  <li>
                    娱乐: 为读者提供娱乐内容，如幽默、漫画或故事。
                  </li>
                  <li>
                    新闻和时事: 提供新闻报道、评论和对时事的个人见解。
                  </li>
                </ol>
                <h3>提升自己</h3>
                <ol>
                  <li>
                    建立权威: 在特定领域建立专业形象和权威性。。
                  </li>
                  <li>
                    记录学习: 记录自己的学习过程和心得，便于日后回顾和复习。
                  </li>
                  <li>
                    技术实践: 作为学习和实践新技术（如编程、Web开发）的一种方式。
                  </li>
                  <li>
                    数据收集: 收集用户反馈和数据，用于改进产品或服务。
                  </li>
                </ol>
                <h3>职业发展</h3>
                <ol>
                  <li>
                    职业发展: 展示专业技能和项目经验，增加职业机会或吸引潜在客户。
                  </li>
                  <li>
                    营销和广告: 推广产品、服务或个人品牌。
                  </li>
                  <li>
                    商业目的: 作为商业活动的一部分，比如电子商务或付费内容。
                  </li>
                  <li>
                    自由职业: 作为自由职业者展示工作和吸引客户的方式。
                  </li>
                </ol>
                <h3>社交学习</h3>
                <ol>
                  <li>
                    知识分享: 分享专业或个人兴趣领域的知识，帮助他人学习和成长
                  </li>
                  <li>
                    创意输出: 作为一种创意写作或艺术表达的方式。
                  </li>
                  <li>
                    社区建设: 创建一个社区，让有共同兴趣的人聚集在一起交流和讨论。
                  </li>
                  <li>
                    教育和指导: 提供教程、指南和建议，帮助他人解决问题。
                  </li>
                  <li>
                    社交网络: 扩大社交网络，与行业内的其他人建立联系。
                  </li>
                  <li>
                    技术展示: 展示最新的Web技术和设计趋势。
                  </li>
                </ol>
            </el-card>
              <el-card>
                <h2>网站用途</h2>
                <ol>
                  <li>
                    夯实基础，不断尝试，提升自己，自我挑战。                       -----2024/8/12
                  </li>

                </ol>
            </el-card>
            <el-card>
                <h2>开发周期</h2>
                <ol>
                  <li>
                    于2023年11月2日创建文件夹,形成大致布局与大致框架；
                  </li>
                  <li>
                    于2024年7月28日再次拾起代码,并加入了主流框架-若依框架，让整个项目有了完整的框架
                  </li>
                </ol>


                <h4></h4>
            </el-card>
              <el-card>
                <h2>知识整理</h2>
            </el-card>

            <el-card>
                <h2>感谢</h2>
                <ul>
                  <li>
                    <a href="http://120.79.202.7/" title="若依框架" target="_blank">若依框架V3.8.8</a>
                  </li>
                  <li>
                    <a href="http://xiongsihao.com/" title="博主博客" target="_blank">博主xiongsihao</a>
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
    name: "aboutBlog",
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
    margin-left: 10%;

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
