<template  >
  <el-container  >
    <el-main >
            <el-card shadow=naver >
               <div style="padding: 14px;">
                <div class="bottom clearfix">
                <el-button type="text" class="button" ><router-link to="/homeHome" ><span class="welcome">WELCOME</span></router-link></el-button>
                <el-button type="text" class="button"><router-link to="/homeHome"> <span class="name">山有木兮木有枝</span></router-link></el-button>

                </div>

            </div>
            </el-card>
            <div class="el-login-footer">
      <p>ICP备案/许可证号：<a href="https://beian.miit.gov.cn/" target="_blank">滇ICP备2023010996号-2</a></p>
      <p><a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=53233102000065" >
        <img src="../../assets/icons/备案编号图标.png" style=""/>滇公网安备53233102000065号</a></p>
      <p> Copyright © 2024 shanyoumuxi</p>
    </div>
        <el-carousel   class="el-carousel" :height="screenheight" trigger="click" :interval="3000">
      <el-carousel-item v-for="item in 4" :key="item">
        <h3>{{ item }}</h3>
      </el-carousel-item>
    </el-carousel>

    </el-main>
  </el-container>
</template>



<script>

export default {
  name: 'welcome',
  data() {
        return {
            screenheight: document.documentElement.clientHeight + 'px'
            // fileList:[{id: 1,src: require('本地图片地址')},{id: 2,src: require('本地图片地址')}]
        }
    },
  mounted(){
        window.onresize = () => {
            return (()=>{
                this.screenheight = document.documentElement.clientHeight + 'px'
            })
        }
    },
   methods: {
   }
}
</script>

<style scoped>
.el-main{
    position: relative;
    top: 0;
    left: 0;
    right: 0;
    margin: 0;
    padding: 0;
    height: 100%;
    width: 100%;
}
.el-main .el-card{
    z-index: 10;
    position: fixed;
    top:50%;
    left:50%;
    transform: translate(-50%,-50%);
    background-color: #000;
    background: transparent;
    border: #000 0px;


}
.el-button{
    margin: auto;
    width: 100%;

}

.welcome{
    font-size: 200px;
}

.name{
    font-size:50px ;
    text-align: center;
}


.el-container{
    z-index: 1;
 position: fixed;
    top: 0;
    left: 0;
    right: 0;

    margin: 0;
    padding: 0;
    height: 100%;
}

  .el-carousel__item h3 {
    color: #c0b5b3;
    font-size: 18px;
    opacity: 0.3;

  }


  .el-carousel__item:nth-child(2n) {
    background-color: #1dfc0e;
  }

  .el-carousel__item:nth-child(2n+1) {
    background-color: rgb(97, 169, 240);
  }
  .el-carousel{
    width: 100%
  }

  .el-login-footer {
    z-index: 10;
    height: 100px;
    position: fixed;
    bottom: 0px;
    width: 100%;
    text-align: center;
    color: #000;
    font-family: Arial;
    font-size: 12px;
    letter-spacing: 1px;
  }
</style>


</style>
