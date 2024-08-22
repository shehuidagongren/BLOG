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
          <el-menu-item index="9" class="centered-login">左</el-menu-item>
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
          <el-menu-item index="9" class="centered-login"  @click="goToLogin">
              <!-- 使用router-link实现点击跳转到登录页面 -->
              <!-- <router-link to="/login"> -->
                进入后台
                <!-- </router-link> -->
            </el-menu-item>
        </div>
      </el-menu>
    </el-header>
    <!-- 左侧边栏区域 -->
    <el-container class="childrencontainer">
      <el-aside style="width:20%">
          <el-menu
            class="aside_menu"
            background="transparent"
            background-color="#000"
            text-color="#fff"
            active-text-color="#000"
          >
           <!-- 欲穷千里 -->
            <div v-show="activeIndex == '1'">

              <el-menu-item index="1">
                <span slot="title"  @click="goto('laboratory')">实验室</span>
              </el-menu-item>
              <el-menu-item index="2">
                <span slot="title"  @click="goto('newFunction')">内嵌音乐盒</span>
              </el-menu-item>
              <el-menu-item index="3">
                <span slot="title"  @click="goto('newFunction')">人工智能接口</span>
              </el-menu-item>
              <el-menu-item index="4">
                <span slot="title"  @click="goto('newFunction')">导航四</span>
              </el-menu-item>
            </div>
            <!-- 落花时节 -->
            <div v-show="activeIndex == '2'">
              <el-menu-item index="1">
                <span slot="title"  @click="goto('leetcode')">每日一题</span>
              </el-menu-item>
              <el-menu-item index="2">
                <span slot="title"  @click="goto('questionAnswering')">问题互答</span>
              </el-menu-item>
              <el-menu-item index="3">
                <span slot="title"  @click="goto('technologySharing')">干货分享</span>
              </el-menu-item>
              <el-menu-item index="4">
                <span slot="title"  @click="goto('userManagement')">用户管理</span>
              </el-menu-item>
            </div>
            <!-- 其修远兮 -->
            <div v-show="activeIndex == '3'">
              <el-menu-item index="1">
                <span slot="title"  @click="goto('lifeJourney')">五湖四海</span>
              </el-menu-item>
              <el-menu-item index="2">
                <span slot="title"  @click="goto('photography')">摄影合集</span>
              </el-menu-item>
              <el-menu-item index="3">
                <span slot="title"  @click="goto('commemorate')">里程碑</span>
              </el-menu-item>
              <el-menu-item index="4">
                <span slot="title"  @click="goto('newFunction')">导航四</span>
              </el-menu-item>
            </div>
            <!-- logo -->
            <div v-show="activeIndex == '4'">
              <el-menu-item index="1">
                <span slot="title"  @click="goto('homeHome')">山有木兮</span>
              </el-menu-item>
              <el-menu-item index="2">
                <span slot="title"  @click="goto('entertainment')">木有枝</span>
              </el-menu-item>
              <el-menu-item index="3">
                <span slot="title"  @click="goto('toolCabinet')">工具箱</span>
              </el-menu-item>
              <el-menu-item index="4">
                <span slot="title"  @click="goto('newFunction')">导航4</span>
              </el-menu-item>
            </div>
            <!-- 上下求索 -->
            <div v-show="activeIndex == '5'">
              <el-menu-item index="1">
                <span slot="title"  @click="goto('dailyArticle')">每日一篇</span>
              </el-menu-item>
              <el-menu-item index="2">
                <span slot="title"  @click="goto('allArticle')">所有文章</span>
              </el-menu-item>
              <el-menu-item index="3">
                <span slot="title"  @click="goto('collectArticles')">收藏文章</span>
              </el-menu-item>
              <el-menu-item index="4">
                <span slot="title"  @click="goto('newFunction')">导航4</span>
              </el-menu-item>
            </div>
            <!-- 指日可待 -->
            <div v-show="activeIndex == '6'">
              <el-menu-item index="1">
                <span slot="title"  @click="goto('studyDiary')">学习日记</span>
              </el-menu-item>
              <el-menu-item index="2">
                <span slot="title"  @click="goto('studyGoal')">学习目标</span>
              </el-menu-item>
              <el-menu-item index="3">
                <span slot="title"  @click="goto('newFunction')">掌握技术</span>
              </el-menu-item>
              <el-menu-item index="4">
                <span slot="title"  @click="goto('newFunction')">导航4</span>
              </el-menu-item>
            </div>
            <!-- 重已修能 -->
            <div v-show="activeIndex == '7'">
              <el-menu-item index="1">
                <span slot="title"  @click="goto('aboutBlog')">关于博客</span>
              </el-menu-item>
              <el-menu-item index="2">
                <span slot="title"  @click="goto('updateBlog')">博客更新</span>
              </el-menu-item>
              <el-menu-item index="3">
                <span slot="title"  @click="goto('cooperation')">支持合作</span>
              </el-menu-item>
              <el-menu-item index="4">
                <span slot="title"  @click="goto('newFunction')">导航四</span>
              </el-menu-item>
            </div>
          </el-menu>

      </el-aside>
      <!-- 内容主体区域 -->
      <el-main style="min-height: 100%;  ">
          <!-- 路由占位符 -->
                   <router-view ></router-view>
      </el-main>
       </el-container>
      <!-- 底部区域 -->
      <el-footer style="height: 200px; ">
       <!-- 第一行 -->
       <div class="onerow">
        跑马灯
       </div>
       <!-- 第二行 -->
       <div class="tworow">
        <div>
          <img src="@/assets/avatar/adminAvatar.gif" width="35%" height="35%"  alt="木有枝">
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
           <img src="@/assets/logo/myzlogo.gif" width="120px" height="120px"  alt="木有枝">
        </div>
        <div>备案</div>
        <div>法律</div>
       </div>
       <!-- 第三行 -->
       <div class="threerow">
      网站运行时长：{{ formattedTimeDifference }}
       </div>
      </el-footer>

  </el-container>
</template>

<script>
  // import { listNotice } from "@/api/system/notice";
export default {
  name: 'Menu',
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
  background: url(../../assets/images/07.png);
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

.centered-menu .el-menu-item {
  margin: 0 10px; /* 调整菜单项之间的间距 */
}
/* 中下布局 */
.childrencontainer {
  margin-top:80px ;
  margin-bottom:80px ;

}

/* 侧边栏布局 */
.aside_menu {
  position: fixed;
  top: 100px;
  left: 0px;
  height: 400px;
  width: 20%;
  background-color:transparent; /* 设置背景颜色 */
  /* 可以添加其他样式，如阴影、边框等 */
  opacity:0.5;
}

.el-aside .el-menu div .el-menu-item{
  height: 100px;
  line-height: 100px;
  border-bottom: 2px solid #ccc;
  border-right:none;
}


.el-aside{
  background-color: rgba(255, 255, 255, 0);
}

span{
  float: right;
  padding-right: 10px;
  font-size: 20px;
  color: #fff;

}

.main-content {
  padding: 0;
  margin: 0;
  width: 100%;
  overflow-y: scroll;
  /* 设置主界面样式以匹配你的设计 */
}

/* 展示区区域 */
.el-main {
  background-color:rgba(170, 170, 170, 0.1) ;
  z-index:10;


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
  height: 130px;
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
  height: 50px;
  margin: 0;
  padding: 0;
  text-align: center; /* 文本水平居中 */
}

</style>
