<template>
  <el-container class="fathercontainer">
    <!-- 顶部导航栏 -->
    <el-header :class="{ hidden: isNavHidden }" style="height: 80px; border-bottom: 0px solid;">
      <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal" background-color="#000"
        text-color="#fff" active-text-color="#1eb0df" style="width: 100%; ; border-bottom: 10px solid;">
        <div class="left-menu ">
          <el-menu-item index="9" class="centered-login" @click="goToLogin">
            <!-- 使用router-link实现点击跳转到登录页面 -->
            <!-- <router-link to="/login"> -->
            后台
            <!-- </router-link> -->
          </el-menu-item>
        </div>
        <div class="centered-menu">
          <el-menu-item index="1" @click="handleSelect(1, 'starrySkyHome')">欲穷千里</el-menu-item>
          <el-menu-item index="2" @click="handleSelect(2, 'socialContactHome')">落花时节</el-menu-item>
          <el-menu-item index="3" @click="handleSelect(3, 'careerHome')">其修远兮</el-menu-item>
          <el-menu-item index="4" @click="handleSelect(4, 'homeHome')"><img src="@/assets/logo/myzlogo.gif" width="80px"
              height="80px" alt="木有枝"></el-menu-item>
          <el-menu-item index="5" @click="handleSelect(5, 'articleHome')">上下求索</el-menu-item>
          <el-menu-item index="6" @click="handleSelect(6, 'wayHome')">指日可待</el-menu-item>
          <el-menu-item index="7" @click="handleSelect(7, 'milestoneHome')">重以修能</el-menu-item>
        </div>
        <div class="right-menu">
          <el-menu-item index="8" class="centered-login">
            登录
          </el-menu-item>

        </div>
      </el-menu>
    </el-header>
    <!-- 左侧边栏区域 -->
    <div style="width: 100%; height: 100%; position: relative; overflow: hidden; background-color: #dbe8ff">
      <!-- ^ 自定义拖拽模块一 -->
      <div class="d-d" v-dragSwitch="true">
        <div class="d-d_container">
          <div class="menu-box" :class="{ 'active': isActive }">
            <div class="menu-button" @click="toggleMenu">
              <div class="line-box">
                <div class="line"></div>
                <div class="line"></div>
                <div class="line"></div>
              </div>
            </div>
            <ul class="menu-list">
              <li v-show="activeIndex==1" v-for="caidan in menuItems.starrySkyHome"    @click="goto(caidan.urlname)">
                <i :class="caidan.icon"></i><span>{{ caidan.name }}</span>
              </li>
              <li v-show="activeIndex==2" v-for="caidan in menuItems.socialContactHome"  @click="goto(caidan.urlname)">
                <i :class="caidan.icon"></i><span>{{ caidan.name }}</span>
              </li>
              <li v-show="activeIndex==3" v-for="caidan in menuItems.careerHome"   @click="goto(caidan.urlname)">
                <i :class="caidan.icon"></i><span>{{ caidan.name }}</span>
              </li>
              <li v-show="activeIndex==4" v-for="caidan in menuItems.homeHome"  @click="goto(caidan.urlname)">
                <i :class="caidan.icon"></i><span>{{ caidan.name }}</span>
              </li>
              <li v-show="activeIndex==5" v-for="caidan in menuItems.articleHome"  @click="goto(caidan.urlname)">
                <i :class="caidan.icon"></i><span>{{ caidan.name }}</span>
              </li>
              <li v-show="activeIndex==6" v-for="caidan in menuItems.wayHome"  @click="goto(caidan.urlname)">
                <i :class="caidan.icon"></i><span>{{ caidan.name }}</span>
              </li>
              <li v-show="activeIndex==7" v-for="caidan in menuItems.milestoneHome"  @click="goto(caidan.urlname)">
                <i :class="caidan.icon"></i><span>{{ caidan.name }}</span>
              </li>
            </ul>
          </div>
        </div>
      </div>

    </div>



    <!-- 内容主体区域 -->
    <el-main>
          <!-- 路由占位符 -->
                   <router-view ></router-view>
      </el-main>
      
      <vue-particles class="particles" color="#39AFFD" :particleOpacity="0.3" :particlesNumber="100" shapeType="star"
      :particleSize="4" linesColor="#8DD1FE" :linesWidth="1" :lineLinked="true" :lineOpacity="0.7" :linesDistance="200"
      :moveSpeed="2" :hoverEffect="true" hoverMode="grab" :clickEffect="true" clickMode="push">
      </vue-particles>

      <!-- 底部区域 -->
      <el-footer style="height: 220px; ">
        <!-- 第一行 -->
        <div class="onerow">
          跑马灯
        </div>
        <!-- 第二行 -->
        <div class="tworow">
          <div>
            <img src="@/assets/avatar/adminAvatar.gif" width="32%" height="32%" alt="木有枝">
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
            <img src="@/assets/logo/myzlogo.gif" width="100px" height="100px" alt="木有枝">
          </div>
          <div>
            <p><a @click="goto('newFunction')" target="_blank">法律声明</a></p>
            <p><a @click="goto('newFunction')" target="_blank">隐私政策</a></p>
          </div>
          <div>
            <p>网站运行时长：</p>

            {{ formattedTimeDifference }}
          </div>
        </div>
        <el-divider style="position: absolute;top:20px">岁岁平安</el-divider>
        <!-- 第三行 -->
        <div class="threerow">

          <p style="font-size: 14px;text-align: center">ICP备案/许可证号：<a href="https://beian.miit.gov.cn/"
              target="_blank">滇ICP备2023010996号-2</a>
              <el-divider direction="vertical"></el-divider><a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=53233102000065" >
                <img src="../../assets/icons/备案编号图标.png" style=""/>滇公网安备53233102000065号</a>
            <el-divider direction="vertical"></el-divider>Copyright © 2024 shanyoumuxi
          </p>

        </div>
      </el-footer>

  </el-container>
</template>

<script>
// import { listNotice } from "@/api/system/notice";
export default {
  name: 'Menu',
  components: {
 
  },
  // 注册自定义拖拽指令
  directives: {
    dragSwitch: {
      bind(el, binding, vnode, oldVnode) {
        // 判断是否可拖拽
        if (!binding.value) {
          return
        }

        // 获取相关元素
        const container = el.querySelector('.d-d_container')
        const header = el.querySelector('.menu-box')
        header.style.cssText += ';cursor:move;'

        // 获取元素原有属性
        const sty = (function () {
          if ((document.body).currentStyle) {
            return (dom, attr) => dom.currentStyle[attr] // 兼容IE写法
          }
          return (dom, attr) => getComputedStyle(dom, null)[attr]
        })()

        /**
         * 鼠标按下事件
         */
        header.onmousedown = (e) => {
          const disX = e.clientX - header.offsetLeft
          const disY = e.clientY - header.offsetTop
          const screenWidth = document.body.clientWidth // document.body的可见区域宽度
          const screenHeight = document.documentElement.clientHeight // 可见区域高度(应为body高度，可某些环境下无法获取)

          const containerWidth = container.offsetWidth // 对话框宽度
          const containerheight = container.offsetHeight // 对话框高度

          const minContainerLeft = container.offsetLeft
          const maxContainerLeft = screenWidth - container.offsetLeft - containerWidth

          const minContainerTop = container.offsetTop
          const maxContainerTop = screenHeight - container.offsetTop - containerheight

          // 左偏移距离
          let styL = sty(container, 'left')
          if (styL === 'auto') {
            styL = '0px' // 兼容IE写法
          }

          // 上偏移距离
          let styT = sty(container, 'top')

          // 注意在IE中，第一次获取到的值为组件自带50%，移动之后赋值为px
          if (styL.includes('%')) {
            styL = +document.body.clientWidth * (+styL.replace(/%/g, '') / 100)
            styT = +document.body.clientHeight * (+styT.replace(/%/g, '') / 100)
          } else {
            styL = +styL.replace(/px/g, '')
            styT = +styT.replace(/px/g, '')
          }

          /**
           * 鼠标移动事件
           */
          document.onmousemove = function (e) {
            // 通过事件委托，计算移动的距离
            let left = e.clientX - disX
            let top = e.clientY - disY

            // 边界处理
            if (-(left) > minContainerLeft) {
              left = -(minContainerLeft)
            } else if (left > maxContainerLeft) {
              left = maxContainerLeft
            }

            if (-(top) > minContainerTop) {
              top = -(minContainerTop)
            } else if (top > maxContainerTop) {
              top = maxContainerTop
            }

            // 移动当前元素
            container.style.cssText += `;left:${left + styL}px;top:${top + styT}px;`
          }

          /**
           * 鼠标松开事件
           */
          document.onmouseup = function (e) {
            document.onmousemove = null
            document.onmouseup = null
          }

          return false
        }
      }
    }
  },
  data() {
    return {
      activeIndex: sessionStorage.getItem("activeIndex") || '4', // 假设默认选中第一个菜单项
      isNavHidden: false, // 初始状态为导航栏显示
      lastScrollTop: 0,// 上次滚动位置
      timeDifference: 0, // 初始时间差值为 0
      specifiedTime: new Date('2023-10-17T00:00:00').getTime(), // 指定时间
      isActive: false,
      menuItems: {
        starrySkyHome:[
        { icon: 'fa fa-sliders', name: '实验室',urlname: 'laboratory' },
        { icon: 'fa fa-clone', name: '音乐盒',urlname: 'musicBox' },
        { icon: 'fa fa-share-square-o', name: '人工智能接口',urlname: 'newFunction' },
        { icon: 'fa fa-trash-o', name: '导航四',urlname: 'newFunction' },
      ],
      socialContactHome:[
        { icon: 'fa fa-sliders', name: '每日一题',urlname: 'leetcode' },
        { icon: 'fa fa-clone', name: '问题互答',urlname: 'questionAnswering' },
        { icon: 'fa fa-share-square-o', name: '干货分享',urlname: 'technologySharing' },
        { icon: 'fa fa-trash-o', name: '用户管理',urlname: 'userManagement' },
      ],
      careerHome:[
        { icon: 'fa fa-sliders', name: '五湖四海',urlname: 'lifeJourney' },
        { icon: 'fa fa-clone', name: '摄影合集',urlname: 'photography' },
        { icon: 'fa fa-share-square-o', name: '里程碑',urlname: 'commemorate' },
        { icon: 'fa fa-trash-o', name: '导航四',urlname: 'newFunction' },
      ],
      homeHome:[
        { icon: 'fa fa-sliders', name: '山有木兮',urlname: 'homeHome' },
        { icon: 'fa fa-clone', name: '木有枝',urlname: 'entertainment' },
        { icon: 'fa fa-share-square-o', name: '工具箱',urlname: 'toolCabinet' },
        { icon: 'fa fa-trash-o', name: '导航4',urlname: 'newFunction' },
      ],
      articleHome:[
        { icon: 'fa fa-sliders', name: '每日一篇',urlname: 'dailyArticle' },
        { icon: 'fa fa-clone', name: '所有文章',urlname: 'allArticle' },
        { icon: 'fa fa-share-square-o', name: '收藏文章',urlname: 'collectArticles' },
        { icon: 'fa fa-trash-o', name: '留言',urlname: 'messageBoard' },
      ],
      wayHome:[
        { icon: 'fa fa-sliders', name: '学习日记',urlname: 'studyDiary' },
        { icon: 'fa fa-clone', name: '学习目标',urlname: 'studyGoal' },
        { icon: 'fa fa-share-square-o', name: '掌握技术',urlname: 'masterTechnique' },
        { icon: 'fa fa-trash-o', name: '导航4',urlname: 'newFunction' },
      ],
      milestoneHome:[
        { icon: 'fa fa-sliders', name: '关于博客',urlname: 'aboutBlog' },
        { icon: 'fa fa-clone', name: '博客更新',urlname: 'updateBlog' },
        { icon: 'fa fa-share-square-o', name: '支持合作',urlname: 'cooperation' },
        { icon: 'fa fa-trash-o', name: '导航四',urlname: 'newFunction' },
      ]
      }
    }
  },
  created() {
    window.addEventListener('scroll', this.handleScrollheader);
  },
  destroyed() {
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
    handleScrollheader() {
      const st = window.pageYOffset || document.documentElement.scrollTop
      if (st > this.lastScrollTop) {
        this.isNavHidden = true // 向下滚动，隐藏导航栏
      } else {
        this.isNavHidden = false // 向上滚动，显示导航栏
      }
      this.lastScrollTop = st
    },
    // 点击路由实现跳转功能
    handleSelect(index, goto) {
      sessionStorage.setItem("activeIndex", index)
      this.activeIndex = sessionStorage.getItem("activeIndex", index)
      this.isActive = true;
      if (goto) {
        this.goto(goto)
      }
    },
    // 跳转网页
    goto(url) {
      console.log(url);
      this.$router.push({ path: url })
    },
    toggleMenu() {
      this.isActive = !this.isActive;
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


<style lang="less"  scoped>
/* 总页布局 */
.fathercontainer {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  width: 100%;
  min-height: 100%;
  background: url(../../assets/images/07.png);
  background-size: 100%;
  background-attachment: fixed;

}

/* 顶部导航栏 */
.el-header {
  z-index: 20;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  width: 100%;
  transition: top 0.3s;
  /* 添加过渡效果 */
}

.hidden {
  top: -100px;
  /* 隐藏导航栏 */
}



.el-menu-demo {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin: 0px;
  padding: 0px;
  width: 100%;
  height: 80px;
  opacity: 0.6;
}

.el-menu-demo .el-menu-item {
  text-align: center;
  /* 居中文本 */
  height: 80px;
  line-height: 80px;
  font-size: 20px;
  /* 设置"登录"菜单项的字体大小 */
}

.left-menu,
.centered-menu,
.right-menu {
  display: flex;
  align-items: center;
}

/* 中下布局 */
.childrencontainer {
  margin-top: 80px;
  margin-bottom: 80px;

}




/* 展示区区域 */
.el-main {
  padding: 0;
  margin-top: 100px;
  margin-bottom: 20px;
  z-index: 1;
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

.onerow {
  width: 100%;
  height: 20px;
  margin: 0;
  padding: 0;
  text-align: center;
  /* 文本水平居中 */
}

.tworow {
  width: 100%;
  height: 120px;
  margin: 0;
  padding: 0;
}

.tworow {
  display: flex;
  /* 使用 Flexbox 布局 */
  justify-content: space-between;
  /* 均匀分布五个列 */
  align-items: center;
  /* 垂直居中 */
}


.tworow>div {
  flex: 1;
  /* 利用 flex 属性使五个列宽度相等 */
  text-align: center;
  /* 文本水平居中 */
  margin: 0 5px;
  /* 左右间距为 5px */
  align-items: center;
  /* 垂直居中 */
}

.threerow {

  width: 100%;
  /* height: 50px; */
  margin: 0;
  padding: 0;
  text-align: center;
  /* 文本水平居中 */
}



/* 蜘蛛网 */
.particles {
  z-index: 0;
  width: 100%;
  height: 100%;
  position: fixed;
}


.d-d {
  z-index: 10;
  width: auto;
  height: auto;
  position: absolute;

  .d-d_container {
    top: 400px;
    left: 30px;
    position: fixed;
    user-select: none;


    .menu-box {
      bottom: 40px;
      right: 40px;
    }

    .menu-button {
      width: 50px;
      height: 50px;
      background-color: #5c67ff;
      border-radius: 50%;
      box-shadow: 0 0 0 4px rgba(92, 103, 255, 0.3);
      color: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
      position: relative;
      z-index: 1;
      cursor: pointer;
      transition: 0.2s ease-in;
    }

    .menu-button:hover {
      background-color: #4854ff;
      box-shadow: 0 0 0 8px rgba(92, 103, 255, 0.3);
    }

    .menu-button .line-box {
      width: 20px;
      height: 20px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      cursor: pointer;
      transition: transform 0.3s ease-out;
    }

    .menu-button .line {
      background-color: #fff;
      width: 100%;
      height: 2px;
      border-radius: 2px;
    }

    .menu-button .line:first-child {
      width: 50%;
      transform-origin: right;
      transition: transform 0.3s ease-in-out;
    }

    .menu-button .line:last-child {
      width: 50%;
      align-self: flex-end;
      transform-origin: left;
      transition: transform 0.3s ease-in-out;
    }

    .menu-list {
      width: 200px;
      height: 160px;
      background-color: #fff;
      border-radius: 8px;
      list-style: none;
      padding: 6px;
      box-shadow: 0 0 4px 4px rgba(92, 103, 255, 0.15);
      position: absolute;
      left: 15px;
      bottom: 15px;
      opacity: 0;
      transform: scale(0);
      transform-origin: bottom  left;
      transition: 0.3s ease;
      transition-delay: 0.1s;
    }

    .menu-list li {
      display: flex;
      align-items: center;
      padding: 10px;
      color: #1c3991;
      cursor: pointer;
      position: relative;
      opacity: 0;
      transform: translateX(-10px);
      transition: 0.2s ease-in;
    }

    .menu-list li:hover {
      color: #5c67ff;
    }

    .menu-list li::before {
      content: "";
      width: calc(100% - 24px);
      height: 1px;
      background-color: rgba(92, 103, 255, 0.1);
      position: absolute;
      bottom: 0;
      left: 12px;
    }

    .menu-list li:last-child::before {
      display: none;
    }

    .menu-list .fa {
      font-size: 18px;
      width: 18px;
      height: 18px;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .menu-list span {
      font-size: 14px;
      margin-left: 8px;
    }

    .active .line-box {
      transform: rotate(-45deg);
    }

    .active .line-box .line:first-child {
      transform: rotate(-90deg) translateX(1px);
    }

    .active .line-box .line:last-child {
      transform: rotate(-90deg) translateX(-1px);
    }

    .active .menu-list {
      opacity: 1;
      transform: scale(1);
    }

    .active .menu-list li {
      animation: fade-in-item 0.4s linear forwards;
    }

    .active .menu-list li:nth-child(1) {
      animation-delay: 0.1s;
    }

    .active .menu-list li:nth-child(2) {
      animation-delay: 0.2s;
    }

    .active .menu-list li:nth-child(3) {
      animation-delay: 0.3s;
    }

    .active .menu-list li:nth-child(4) {
      animation-delay: 0.4s;
    }

    @keyframes fade-in-item {
      100% {
        transform: translateX(0);
        opacity: 1;
      }
    }





  }
}
</style>
