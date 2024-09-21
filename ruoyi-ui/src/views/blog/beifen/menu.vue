<template >
  <el-container class="fathercontainer" >
    <!-- 顶部导航栏 -->
    <el-header :class="{ hidden: isNavHidden }" style="height: 80px; border-bottom: 0px solid;">
      <el-menu
        :default-active="activeIndex"
        class="el-menu-demo"
        mode="horizontal"
        background-color="#000"
        text-color="#fff"
        active-text-color="#1eb0df"
        style="width: 100%; ; border-bottom: 10px solid;"
      >
        <div class="left-menu">
          <el-menu-item index="9" class="centered-login"  @click="goToLogin">
              <!-- 使用router-link实现点击跳转到登录页面 -->
              <!-- <router-link to="/login"> -->
                后台
                <!-- </router-link> -->
            </el-menu-item>
        </div>
        <div class="centered-menu">
          <el-menu-item index="1" @click="handleSelect(1, 'starrySkyHome')"
            >欲穷千里</el-menu-item
          >
          <el-menu-item index="2" @click="handleSelect(2, 'socialContactHome')"
            >落花时节</el-menu-item
          >
          <el-menu-item index="3" @click="handleSelect(3, 'careerHome')"
            >其修远兮</el-menu-item
          >
          <el-menu-item index="4" @click="handleSelect(4, 'homeHome')"
            ><img src="@/assets/logo/myzlogo.gif" width="80px" height="80px"  alt="木有枝"></el-menu-item
          >
          <el-menu-item index="5" @click="handleSelect(5, 'articleHome')"
            >上下求索</el-menu-item
          >
          <el-menu-item index="6" @click="handleSelect(6, 'wayHome')"
            >指日可待</el-menu-item
          >
          <el-menu-item index="7" @click="handleSelect(7, 'milestoneHome')"
            >重以修能</el-menu-item
          >
        </div>
        <div class="right-menu">
          <el-menu-item index="8" class="centered-login">
              登录
            </el-menu-item>

        </div>
      </el-menu>
    </el-header>
    <!-- 左侧边栏区域 -->
    <el-container class="childrencontainer" >
      <el-aside  style="z-index: 20;">
          <el-menu
            class="aside_menu"  background-color=rgba(0,0,0,0.3)  >
           <!-- 欲穷千里 -->
            <div v-show="activeIndex == '1'"   >

              <el-menu-item class="menu_texiao" index="1"  @click="goto('laboratory')" >
                <div class="mainbox" >
        <span class="line"></span>
        <span class="line"></span>
        <span class="line"></span>
        <span class="line"></span>
        
        <span slot="title" >实验室</span>
        </div>
              </el-menu-item>
              <el-menu-item index="2" @click="goto('musicBox')" class="menu_texiao">
                <div class="mainbox">
        <span class="line"></span>
        <span class="line"></span>
        <span class="line"></span>
        <span class="line"></span>
        <span slot="title"  >音乐盒</span>
        </div>
              </el-menu-item>
              <el-menu-item index="3" @click="goto('newFunction')" class="menu_texiao">
                <div class="mainbox">
        <span class="line"></span>
        <span class="line"></span>
        <span class="line"></span>
        <span class="line"></span>
        <span slot="title"  >人工智能接口</span>
        </div>
              </el-menu-item>
              <el-menu-item index="4"  @click="goto('newFunction')" class="menu_texiao">
                <div class="mainbox">
        <span class="line"></span>
        <span class="line"></span>
        <span class="line"></span>
        <span class="line"></span>
        <span slot="title"  >导航四</span>
        </div>
              </el-menu-item>
            </div>

            <!-- 落花时节 -->
            <div v-show="activeIndex == '2'">
              <el-menu-item index="1"  @click="goto('leetcode')" class="menu_texiao">
                <span slot="title" >每日一题</span>
              </el-menu-item>
              <el-menu-item index="2"  @click="goto('questionAnswering')" class="menu_texiao">
                <span slot="title" >问题互答</span>
              </el-menu-item>
              <el-menu-item index="3" @click="goto('technologySharing')" class="menu_texiao">
                <span slot="title"  >干货分享</span>
              </el-menu-item>
              <el-menu-item index="4"  @click="goto('userManagement')" class="menu_texiao">
                <span slot="title" >用户管理</span>
              </el-menu-item>
            </div>
            <!-- 其修远兮 -->
            <div v-show="activeIndex == '3'">
              <el-menu-item index="1"  @click="goto('lifeJourney')" class="menu_texiao">
                <span slot="title" >五湖四海</span>
              </el-menu-item>
              <el-menu-item index="2"  @click="goto('photography')" class="menu_texiao">
                <span slot="title" >摄影合集</span>
              </el-menu-item>
              <el-menu-item index="3"  @click="goto('commemorate')" class="menu_texiao">
                <span slot="title" >里程碑</span>
              </el-menu-item>
              <el-menu-item index="4" @click="goto('newFunction')" class="menu_texiao">
                <span slot="title"  >导航四</span>
              </el-menu-item>
            </div>
            <!-- logo -->
            <div v-show="activeIndex == '4'">
              <el-menu-item index="1"  @click="goto('homeHome')" class="menu_texiao">
                <span slot="title" >山有木兮</span>
              </el-menu-item>
              <el-menu-item index="2" @click="goto('entertainment')" class="menu_texiao">
                <span slot="title"  >木有枝</span>
              </el-menu-item>
              <el-menu-item index="3"  @click="goto('toolCabinet')" class="menu_texiao">
                <span slot="title" >工具箱</span>
              </el-menu-item>
              <el-menu-item index="4" @click="goto('newFunction')" class="menu_texiao">
                <span slot="title"  >导航4</span>
              </el-menu-item>
            </div>
            <!-- 上下求索 -->
            <div v-show="activeIndex == '5'">
              <el-menu-item index="1"   @click="goto('dailyArticle')" class="menu_texiao">
                <span slot="title">每日一篇</span>
              </el-menu-item>
              <el-menu-item index="2"  @click="goto('allArticle')" class="menu_texiao">
                <span slot="title" >所有文章</span>
              </el-menu-item>
              <el-menu-item index="3" @click="goto('collectArticles')" class="menu_texiao">
                <span slot="title"  >收藏文章</span>
              </el-menu-item>
              <el-menu-item index="4"  @click="goto('messageBoard')" class="menu_texiao">
                <span slot="title" >留言</span>
              </el-menu-item>
            </div>
            <!-- 指日可待 -->
            <div v-show="activeIndex == '6'">
              <el-menu-item index="1"  @click="goto('studyDiary')" class="menu_texiao">
                <span slot="title" >学习日记</span>
              </el-menu-item>
              <el-menu-item index="2"  @click="goto('studyGoal')" class="menu_texiao">
                <span slot="title" >学习目标</span>
              </el-menu-item>
              <el-menu-item index="3"  @click="goto('masterTechnique')" class="menu_texiao">
                <span slot="title" >掌握技术</span>
              </el-menu-item>
              <el-menu-item index="4" @click="goto('newFunction')" class="menu_texiao">
                <span slot="title"  >导航4</span>
              </el-menu-item>
            </div>
            <!-- 重已修能 -->
            <div v-show="activeIndex == '7'">
              <el-menu-item index="1"  @click="goto('aboutBlog')" class="menu_texiao">
                <span slot="title" >关于博客</span>
              </el-menu-item>
              <el-menu-item index="2"   @click="goto('updateBlog')" class="menu_texiao">
                <span slot="title">博客更新</span>
              </el-menu-item>
              <el-menu-item index="3"  @click="goto('cooperation')" class="menu_texiao">
                <span slot="title" >支持合作</span>
              </el-menu-item>gfbvh n
              <el-menu-item index="4"  @click="goto('newFunction')" class="menu_texiao">
                <span slot="title" >导航四</span>
              </el-menu-item>
            </div>
          </el-menu>

      </el-aside>
 
      <!-- 内容主体区域 -->
      <el-main style="min-height: 100%; padding: 0;margin: 0 ;z-index: 1;">
        <!-- <live2d/> -->
          <!-- 路由占位符 -->
                   <router-view ></router-view>
      </el-main>
      <vue-particles class="particles" color="#39AFFD" :particleOpacity="0.3" :particlesNumber="100" shapeType="star" 
 :particleSize="4" linesColor="#8DD1FE" :linesWidth="1" :lineLinked="true" :lineOpacity="0.7" 
 :linesDistance="200" :moveSpeed="2" :hoverEffect="true" hoverMode="grab" :clickEffect="true" clickMode="push">
</vue-particles>
       </el-container>
      <!-- 底部区域 -->
      <el-footer style="height: 220px; ">
       <!-- 第一行 -->
       <div class="onerow">
        跑马灯
       </div>
       <!-- 第二行 -->
       <div class="tworow">
        <div>
          <img src="@/assets/avatar/adminAvatar.gif" width="32%" height="32%"  alt="木有枝">
        </div>
        <div>
        <el-row>
          联系我
        </el-row>
        <el-row>
          QQ邮箱：2293902648@qq.com
        </el-row>
        <el-row>
          QQ：2293902648
        </el-row>
        </div>
        <div>
           <img src="@/assets/logo/myzlogo.gif" width="100px" height="100px"  alt="木有枝">
        </div>
        <div>
          <p><a   @click="goto('newFunction')"  target="_blank">法律声明</a></p>
          <p><a   @click="goto('newFunction')"  target="_blank">隐私政策</a></p> 
          </div>
        <div>
      <p>网站运行时长：</p>    
      
      {{ formattedTimeDifference }} 
        </div>
       </div>
       <el-divider style="position: absolute;top:20px">岁岁平安</el-divider>
       <!-- 第三行 -->
       <div class="threerow">
      
          <p style="font-size: 14px;text-align: center">ICP备案/许可证号：<a href="https://beian.miit.gov.cn/" target="_blank">滇ICP备2023010996号-2</a>
            <el-divider direction="vertical"></el-divider><a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=53233102000065" ><img src="" style=""/>滇公网安备53233102000065号</a>
            <el-divider direction="vertical"></el-divider>Copyright © 2024 shanyoumuxi</p>

       </div>
      </el-footer>

  </el-container>
</template>

<script>
import Live2d from '@/components/Live2d/index'
  // import { listNotice } from "@/api/system/notice";
export default {
  name: 'Menu',
  components: {
      Live2d
  },
  data () {
    return {
      activeIndex: sessionStorage.getItem("activeIndex") || '4', // 假设默认选中第一个菜单项
      isNavHidden: false, // 初始状态为导航栏显示
      lastScrollTop: 0 ,// 上次滚动位置
      timeDifference: 0, // 初始时间差值为 0
      specifiedTime: new Date('2023-10-17T00:00:00').getTime(), // 指定时间
    }
  },
   created () {
    window.addEventListener('scroll', this.handleScrollheader);
  },
  destroyed () {
    window.removeEventListener('scroll', this.handleScrollheader)
  },
  computed: {
    formattedTimeDifference() {
      const msPerMinute = 60 * 1000;
      const msPerHour = msPerMinute * 60;
      const msPerDay = msPerHour * 24;
      const msPerMonth = msPerDay * 30; // 这里以30天来近似一个月
      const msPerYear = msPerDay * 365; // 这里以365天来近似一年

      const years = Math.floor(this.timeDifference / msPerYear);
      this.timeDifference %= msPerYear;

      const months = Math.floor(this.timeDifference / msPerMonth);
      this.timeDifference %= msPerMonth;

      const days = Math.floor(this.timeDifference / msPerDay);
      this.timeDifference %= msPerDay;

      const hours = Math.floor(this.timeDifference / msPerHour);
      this.timeDifference %= msPerHour;

      const minutes = Math.floor(this.timeDifference / msPerMinute);
      this.timeDifference %= msPerMinute;

      const seconds = Math.floor(this.timeDifference / 1000);

      return `${years}年 ${months}月 ${days}日 ${hours}小时 ${minutes}分钟 ${seconds}秒`;
    }
  },
  mounted() {
    this.calculateTimeDifference();
    this.timer = setInterval(() => {
      this.calculateTimeDifference();
    }, 1000); // 每秒更新时间差
  },
  beforeDestroy() {
    clearInterval(this.timer); // 组件销毁时清除定时器
  },
  methods: {
    // 隐藏与显示导航栏
    handleScrollheader () {
      const st = window.pageYOffset || document.documentElement.scrollTop
      if (st > this.lastScrollTop) {
        this.isNavHidden = true // 向下滚动，隐藏导航栏
      } else {
        this.isNavHidden = false // 向上滚动，显示导航栏
      }
      this.lastScrollTop = st
    },
    // 点击路由实现跳转功能
    handleSelect (index, goto) {
      sessionStorage.setItem("activeIndex", index)
      this.activeIndex = sessionStorage.getItem("activeIndex", index)
      if (goto) {
        this.goto(goto)
      }
    },
    // 跳转网页
    goto (url) {
      this.$router.push({ path: url })
    },
    // 计算时间
    calculateTimeDifference() {
          const now = new Date().getTime();
          this.timeDifference = now - this.specifiedTime;
        },
        goToLogin() {
              this.$router.push('/login');
            }
  },


}
</script>


<style scoped>
/* 总页布局 */
.fathercontainer {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  width: 100%;
 min-height: 100%;
  /* background: url(../../assets/images/07.png); */
  background-size: 100% ;
  background-attachment:fixed;

}
/* 顶部导航栏 */
.el-header {
  z-index: 20;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  width: 100%;
  transition: top 0.3s; /* 添加过渡效果 */
}

.hidden {
  top: -100px; /* 隐藏导航栏 */
}

 

.el-menu-demo {
   position: absolute;
  top: 0;
  left: 0;
  right: 0;
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin:0px ;
  padding: 0px;
  width: 100%;
  height: 80px;
  opacity:0.6;
}

.el-menu-demo .el-menu-item {
  text-align: center; /* 居中文本 */
  height: 80px;
  line-height: 80px;
  font-size: 20px; /* 设置"登录"菜单项的字体大小 */
}

.left-menu,
.centered-menu,
.right-menu {
  display: flex;
  align-items: center;
}

/* 中下布局 */
.childrencontainer {
  margin-top:80px ;
  margin-bottom:80px ;

}




/* 展示区区域 */
.el-main {
  background-color:rgba(170, 170, 170, 0.1) ;
  z-index:10;


}



.el-aside{
  width:10%;
  position: fixed;
  background-color: rgba(255, 255, 255, 0);
}


.el-aside .el-menu div .el-menu-item{
  height: 100px;
  line-height: 100px;
  /* border-top: 1px solid #d40a0a;
  border-bottom: 1px solid #d40a0a; */
  /* border-bottom: 1px solid #d40a0a;  */
  background-color: rgba(255, 255, 255, 0);
}


span{
  float: right;
  padding-right: 20px;
  font-size: 20px;
  color: #fff;
  /* 定义菜单标题的样式 */
cursor: pointer; /* 鼠标悬停时显示手形光标 */

}


.main-content {
  padding: 0;
  margin: 0;
  width: 100%;
  overflow-y: scroll;
  /* 设置主界面样式以匹配你的设计 */
}


/* 侧边栏布局 */
.aside_menu {
  z-index: 20;
  position: fixed;
  top: 100px;
  left: 0px;
  height: 400px;
  width: 10%;
}
.aside_menu div .el-menu-item{
  background-color:rgba(77, 0, 232, 0.9) ;
}

element.style{
  padding-left: 0px;
}

.menu_texiao{
  padding: 0px;
  margin: 0;
  margin-left: -20px;
  /* background-color:rgba(235, 12, 12, 0.9) ; */

}




/* 底部区域 */
.el-footer {
  width: 100%;
  margin: 0;
  padding: 0;
  background: #000;
  opacity: 0.5;
  color: #fff;
}

.onerow{
  width: 100%;
  height: 20px;
  margin: 0;
  padding: 0;
    text-align: center; /* 文本水平居中 */
}

.tworow{
  width: 100%;
  height: 120px;
  margin: 0;
  padding: 0;
}
.tworow {
  display: flex; /* 使用 Flexbox 布局 */
  justify-content: space-between; /* 均匀分布五个列 */
  align-items: center; /* 垂直居中 */
}


.tworow > div {
  flex: 1; /* 利用 flex 属性使五个列宽度相等 */
  text-align: center; /* 文本水平居中 */
  margin: 0 5px; /* 左右间距为 5px */
  align-items: center; /* 垂直居中 */
}

.threerow{

  width: 100%;
  /* height: 50px; */
  margin: 0;
  padding: 0;
  text-align: center; /* 文本水平居中 */
}



.mainbox {
            width: 100%;
            height: 100px;
            position: relative;
            /* 超出隐藏需要加上 */
            overflow: hidden;
        }

        .content {
            width: 100%;
            height: 100px;
            line-height: 100px;
            text-align: center;
            background-color:rgba(230, 9, 9, 0.1);
        }

        .line {
            /* 结合外层元素的相对定位 */
            position: absolute;
        }

        .line:nth-child(1) {
            top: 0;
            left: 0;
            width: 100%;
            height: 3px;
            /* 加上渐变效果，方可形成拖尾效果 */
            background: linear-gradient(90deg, transparent, orange);
            animation: animate1 8s linear infinite;
        }

        /* 分别控制其上下左右的定位距离，从而形成线条跟随效果 */
        @keyframes animate1 {
            0% {
                left: -100%;
            }

            50%,
            100% {
                left: 100%;
            }
        }

        .line:nth-child(2) {
            top: -100%;
            right: 0;
            width: 1px;
            height: 100%;
            background: linear-gradient(180deg, transparent, red);
            animation: animate2 8s linear infinite;
            /* 注意要加上延时触发动画效果，这样线条才会依次触发 */
            animation-delay: 2s;
        }

        @keyframes animate2 {
            0% {
                top: -100%;
            }

            50%,
            100% {
                top: 100%;
            }
        }

        .line:nth-child(3) {
            bottom: 0;
            right: 0;
            width: 100%;
            background: linear-gradient(270deg, transparent, green);
            animation: animate3 8s linear infinite;
            animation-delay: 4s;
        }

        @keyframes animate3 {
            0% {
                right: -100%;
                height: 3px;
            }

            50%,
            100% {
                height: 3px;
                right: 100%;
            }
        }

        .line:nth-child(4) {
            bottom: -100%;
            left: 0;
            width: 1px;
            height: 100%;
            background: linear-gradient(360deg, transparent, #3a86ff);
            animation: animate4 8s linear infinite;
            animation-delay: 6s;
        }

        @keyframes animate4 {
            0% {
                bottom: -100%;
            }

            50%,
            100% {
                bottom: 100%;
            }
        }
 
 /* 悬停时的背景色 */
.mainbox:hover{
  background-color:rgb(0, 0, 0);
  color: #130b1270;
}
/* 点击时的背景色 */
.mainbox:active {
  background-color: #000000; 
  color: #ffffff;
}


/* 蜘蛛网 */
.particles{
  z-index: 0;
  width: 100%;
  height: 100%;
  position: fixed;
}
</style>
