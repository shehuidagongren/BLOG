<template >
    <el-main class="mainPage">
        <div class="leftcard">
            <el-card>
              <el-input placeholder="请输入文章标题" prefix-icon="el-icon-search" v-model="addFormData.articleTitle"> </el-input>
              <el-select v-model="addFormData.articleDirection" filterable placeholder="请选择文章方向" style="width: 33%;">
                <el-option
                  v-for="item in directions"
                  :key="item.id"
                  :label="item.directionName "
                  :value="item.directionName">
                </el-option>
              </el-select>
              <el-select v-model="addFormData.articleType" filterable placeholder="请选择文章分类" style="width: 34%;">
                <el-option
                  v-for="item in types"
                  :key="item.id"
                  :label="item.typeName"
                  :value="item.typeName">
                </el-option>
              </el-select>
              <el-select v-model="addFormData.articleTag" filterable placeholder="请选择文章标签" style="width: 33%;">
                <el-option
                  v-for="item in tags"
                  :key="item.id"
                  :label="item.tagName"
                  :value="item.tagName">
                </el-option>
              </el-select>
              <mavon-editor v-model="addFormData.articleContent" ref="md" @imgAdd="$imgAdd" @change="change" style="min-height: 600px" />
                    <el-row style="margin-top:40px;">
                    <el-button type="primary" round @click="saveAsDraft">保存为草稿</el-button>
                    <el-button type="info" round @click="pinformationChanges">更改信息</el-button>
                    <el-button type="success" round @click="publishArticle">发布文章</el-button>
                    <el-button type="warning" round  @click="clearContent">清除内容</el-button>
                    <el-button type="danger" round @click="initContent">初始化文章</el-button>
                </el-row>
            </el-card>
        </div>
        <div  class="rightcard">
            <el-card >
                <!-- 搜索 -->
                <h3>待开发</h3>
            </el-card>
            <el-card >
                <!-- 搜索 -->
                <h3>待开发</h3>
            </el-card>
            <el-card >
                <!-- 搜索 -->
                <h3>待开发</h3>
            </el-card>

        </div>
    </el-main>
</template>



<script>

export default {
  name: 'writeArticle',
  components: {

  },
  data () {
      return { title:"",
      content: "",
      directions:[],
      types:[],
      tags:[],
      html: "",
      configs: {},
      addFormData:{},
      message:''
      };
},
  methods : {
    getDirections(){
      api.get("/allArticle/getDirection","", (resp) => {
        for (let index = 0; index < resp.data.data.length; index++) {
          resp.data.data[index].ised = false;
        }
        this.directions = resp.data.data;
      })
    },
    getTypes(){
      api.get("/allArticle/getType","", (resp) => {
        for (let index = 0; index < resp.data.data.length; index++) {
          resp.data.data[index].ised = false;
        }
        this.types = resp.data.data;
      })
    },
    getTags(){
      api.get("/allArticle/getTag","", (resp) => {
        for (let index = 0; index < resp.data.data.length; index++) {
          resp.data.data[index].ised = false;
        }
        this.tags = resp.data.data;
      })
    },
    // 将图片上传到服务器，返回地址替换到md中
    $imgAdd(pos, $file) {
      var formdata = new FormData();
      formdata.append("file", $file);
      //将下面上传接口替换为你自己的服务器接口
      axios({
        url: "/common/upload",
        method: "post",
        data: formdata,
        headers: { "Content-Type": "multipart/form-data" }
      }).then(url => {
        this.$refs.md.$img2Url(pos, url);
      });
    },
    change(value, render) {
      // render 为 markdown 解析后的结果
      this.html = render;
    },
    saveAsDraft() {
      this.$message.success("草稿保存成功");
    },
    pinformationChanges() {
      this.$message.success("更改信息成功");
    },
    publishArticle() {
      this.addFormData.articleAuthor="测试作者";
      this.addFormData.articleComments="评论测试";
      api.post("/allArticle/addArticles", this.addFormData, (resp) => {
        if (resp.data.flag) {
          this.$message({
            type: 'success',
            message: '发布成功'
          });
          }else{
            this.$message({
            type: 'info',
            message: '放弃发布'
          });

          }
      });
      },
    clearContent(){
      this.$message.success("清除内容成功");

    },
    initContent(){
      this.$message.success("初始化成功");
    }
  },
  created(){
    this.getDirections();
    this.getTypes();
    this.getTags();

},
}
</script>

<style>

/* 主要布局 */
.mainPage{
    padding: 10px;

}

/* 左布局 */
.leftcard{
    float: left;
    width: 68%;
    margin:3% ;

}

.leftcard .el-card{
    width: 100%;
    margin-bottom: 50px;
    float: block;
    min-height: 400px;
}

/* 右布局 */
.rightcard{
    float: right;
    position: relative;
    margin-right:2% ;
    margin-top:3% ;
    width: 21%;
    min-width: 220px;
}

.rightcard .el-card{
    width: 100%;
    margin-bottom: 50px;
    float: block;
}

.searchAll{
    min-width: 100%;
        margin: 0;
    padding: 0;
}

.el-tag + .el-tag {
    margin-left: 10px;
  }



/* 主要区域 */
p {
    margin: 8px;

}




</style>
