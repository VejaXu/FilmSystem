<!-- 首页 -->
<template>
  <div class="app">
    <div class="app-header" style="border-bottom: 1px solid #dddddd;margin-bottom: 10px;">
      <el-row type="flex" align="middle">
        <el-col :span="2">
          <RouterLink to="/"><img :src="require('@/assets/images/logo.png')" style="width:120px; height:120px;" />
          </RouterLink>
        </el-col>
        <el-col :span="10">
          <div style="display: flex;">
            <div class="movie-item" @click="getFilmsNames()">首页</div>
            <div class="movie-item" v-for="(item, i) in classificationList" :key="i" @click="getFilmsNames(item.title)">
              {{ item.title }}
            </div>
          </div>
        </el-col>
        <el-col :span="4">
          <el-input type="text" style="width: 250px" @change="search" v-model="titles" autocomplete="off" size="medium"
            placeholder="搜索" prefix-icon="el-icon-edit"></el-input>
        </el-col>
        <el-col :span="8">
          <div style="display: flex;">
            <div class="function-div" @click="cb('history')">
              <i class="el-icon-view"></i>
              <span>看过</span>
            </div>
            <div class="function-div" @click="cb('collect')">
              <i class="el-icon-star-off"></i>
              <span>收藏</span>
            </div>
            <div class="function-div" @click="cb('notice')">
              <i class="el-icon-chat-dot-round"></i>
              <span>公告</span>
            </div>
            <div style="font-size:16px;padding: 20px;" v-show="form.userName">
              <el-dropdown>
                <span class="el-dropdown-link">
                  <i style="font-size: 16px;" class="el-icon-user"></i>
                  <span>
                    {{ form.userName }}
                  </span>
                </span>
                <template #dropdown>
                  <el-dropdown-menu>
                    <el-dropdown-item @click.native="open = true">个人中心</el-dropdown-item>
                    <el-dropdown-item @click.native="opens = true">修改密码</el-dropdown-item>
                    <el-dropdown-item @click.native="logout()">退出</el-dropdown-item>
                  </el-dropdown-menu>
                </template>
              </el-dropdown>
            </div>
            <div class="function-div" v-show="!form.userName" @click="login()">
              <i class="el-icon-user"></i>
              <span>登录</span>
            </div>
          </div>
        </el-col>
      </el-row>
    </div>

    <div style="padding: 0 300px;">

      <div class="banner-div">
        <el-carousel :interval="50000" arrow="always" type="card">
          <el-carousel-item v-for="item in carousel" :key="item.id">
            <img :src="item.img" :title="item.name" />
          </el-carousel-item>
        </el-carousel>
      </div>

      <div class="container">
        <div class="pannel">
          <h2 class="pannel_head">
            <i class="rebboIcon iconfont icon-remen"></i>
            {{ movie }}电影
          </h2>
          <ul class="right_menu">
            <li>
              <a href="#">
                最近更新 <em>{{ film.length }}</em> 部
                <span class="line">|</span>
              </a>
            </li>
            <li><a href="#">更多 ></a></li>
          </ul>
        </div>

        <div>
          <ul class="movie_list" v-if="film.length != 0">
            <li v-for="item in film" :key="item.id" @click="detail(item.id)">
              <el-image class="movie_head" :src="item.field5" :fit="item.title"></el-image>
              <div class="movie_info">
                <el-row>
                  <el-col :span="12">
                    <span style="">{{ item.title }}</span>
                  </el-col>
                  <el-col :span="12" style="text-align: right;">
                    <span>{{ item.mobile }}分钟</span>
                  </el-col>
                </el-row>
                <div style="">评分:
                  <span
                    style="text-shadow: #000 1px 0 0, #000 0 1px 0, #000 -1px 0 0, #000 0 -1px 0; color: #fbff00; margin-left: 7px;">
                    {{ item.num ? item.num : 0 }} 分
                  </span>
                </div>
                <span class="view-text">简介: {{ item.content }}</span>
              </div>
            </li>
          </ul>
        </div>
        <el-empty :image-size="200" v-if="film.length == 0"></el-empty>
        <hr />
        <div slot="header" class="clearfix" style="text-align: left; font-size: 18px; font-weight: 700">
          <span>影视爱好者网络社区 >>></span>
          <el-button style="float: right; padding: 3px 0" type="text" @click="cb('community')">进入社区<i
              class="el-icon-arrow-right"></i></el-button>
        </div>
        <div class="text item">
          <img style="width: 100%; height: 200px" :src="require('@/assets/images/OIP.jpg')" />
        </div>
      </div>

    </div>

    <!-- 修改密码 -->
    <el-dialog title="修改密码" :visible.sync="opens" width="600px" append-to-body>
      <el-form ref="form" :model="user" label-width="80px">
        <el-form-item label="旧密码" prop="oldPassword">
          <el-input v-model="user.oldPassword" placeholder="请输入旧密码" type="password" show-password />
        </el-form-item>
        <el-form-item label="新密码" prop="newPassword">
          <el-input v-model="user.newPassword" placeholder="请输入新密码" type="password" show-password />
        </el-form-item>
        <el-form-item label="确认密码" prop="confirmPassword">
          <el-input v-model="user.confirmPassword" placeholder="请确认密码" type="password" show-password />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" size="mini" @click="submits">保存</el-button>
          <el-button type="danger" size="mini" @click="opens = false">关闭</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>

    <!-- 个人中心 -->
    <el-dialog title="个人中心" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" label-width="80px">
        <el-row>
          <el-col :span="12">
            <el-form-item label="用户昵称" prop="nickName">
              <el-input v-model="form.nickName" placeholder="请输入用户昵称" maxlength="30" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="手机号码" prop="phonenumber">
              <el-input v-model="form.phonenumber" placeholder="请输入手机号码" maxlength="11" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row> </el-row>
        <el-row>
          <el-col :span="24">
            <el-form-item label="备注">
              <el-input v-model="form.remark" type="textarea" placeholder="请输入内容"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="open = false">取 消</el-button>
      </div>
    </el-dialog>


  </div>
</template>

<script>
//这里可以导入其他文件（比如：组件，工具js，第三方插件js，json文件，图片文件等等）

//例如：import 《组件名称》 from '《组件路径》';
import { getInfo } from "@/api/login";
import { getFilms, getReceived } from "@/api/films";
import { updateUser, updateUserPwd, getUserProfile } from "@/api/user";
import { listClassification } from "@/api/classification";
import { listCarousel } from '@/api/carousel'
import { removeToken } from "@/utils/auth";

export default {
  //import引入的组件需要注入到对象中才能使用
  components: {},
  data() {
    return {
      carousel: [], //轮播图
      classificationList: [],
      queryParams: {},
      movie: "推荐",
      titles: "",
      user: {}, //用户密码
      // 用户信息
      form: {},
      opens: false, //是否弹出修改密码
      // 是否弹出个人中心
      open: false,
      activeIndex: "1",
      activeIndex2: "1",
      film: [], //视频
      queryFilms: {},
      images: [
        {
          id: 1,
          url: require("@/assets/img/banner/banner1.jpg"),
        },
        {
          id: 2,
          url: require("@/assets/img/banner/banner2.jpg"),
        },
        {
          id: 3,
          url: require("@/assets/img/banner/banner3.jpg"),
        },
        {
          id: 4,
          url: require("@/assets/img/banner/banner4.jpg"),
        },
        {
          id: 5,
          url: require("@/assets/img/banner/banner5.jpg"),
        },
      ],
    };
  },
  created() {
    this.getInfos();
    this.received(this.queryFilms);
    this.getClassificat();
    this.getCarousel();
  },
  methods: {
    //查询轮播图
    getCarousel(carousel) {
      listCarousel(carousel).then(res => {
        if (res.data.code = 200) {
          this.carousel = res.data.rows;
        }
      })
    },
    //查询热映电影
    received() {
      this.queryFilms.status = '1';
      getReceived(this.queryFilms).then((res) => {
        console.log("热映电影：", res);
        if (res.data.code == 200) {
          this.film = res.data.data;
        }
      });
    },
    getFilmsNames(title) {
      if (title == null) {
        this.movie = "全部";
      } else {
        this.movie = title;
      }
      this.queryFilms.address = title;

      this.received(this.queryFilms);
    },
    //查询分类列表
    getClassificat() {
      listClassification(this.queryParams).then((res) => {
        if (res.data.code == 200) {
          this.classificationList = res.data.rows;
        }
      });
    },
    //搜索
    search() {
      this.$router.push("/search/" + this.titles);
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        title: null,
        name: null,
        mobile: null,
        address: null,
        content: null,
        imgs: null,
        num: null,
        status: null,
        date1: null,
        field1: null,
        field2: null,
        field3: null,
        field5: null,
        field6: null,
        field7: null,
        field8: null,
        field9: null,
        delFlag: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null,
      };
      // this.resetForm("form");
    },
    //修改密码
    submits() {
      this.$refs["form"].validate((valid) => {
        if (valid) {
          updateUserPwd(this.user.oldPassword, this.user.newPassword).then(
            (res) => {
              if (res.code == 200) {
                this.$message({
                  message: "修改成功！",
                  type: "success",
                });
                this.opens = false;
              }
            }
          );
        }
      });
    },
    //修改个人中心
    submitForm() {
      updateUser(this.form).then((res) => {
        if (res.data.code == 200) {
          this.$message({
            message: "修改成功！",
            type: "success",
          });
          this.open = false;
          this.getInfo;
        }
      });
    },

    cb(da) {
      // console.log("88888")
      if (da === "history") {
        this.$router.push("/historys");
      } else if (da === "collect") {
        this.$router.push("/collect");
      } else if (da === "about") {
        this.$router.push("/about");
      } else if (da === "notice") {
        this.$router.push("/notice");
      } else if (da === "community") {
        this.$router.push("/community");
      }
    },
    //跳转电影详细页面
    detail(id) {
      this.$router.push("/detail/" + id);
    },
    //查询电影
    films(films) {
      getFilms(films).then((res) => {

        if (res.data.code == 200) {
          this.film = res.data.rows;
        }
      });
    },
    //用户信息验证
    getInfos() {

      getInfo().then((res) => {

        if (res.data.code == 200) {
          localStorage.setItem("user", JSON.stringify(res.data.user));
          this.form = res.data.user;
        } else {
          this.$message({
            message: "登录失败或登录超时，请重新登录！",
            type: "success",
          });
        }

      })
    },
    //登录跳转
    login() {
      this.$router.push("/login")
    },
    // 退出登录
    logout() {
      this.$router.push("/login");
      removeToken();
    },
    handleOpen(key, keyPath) {
      console.log(key, keyPath);
    },
    handleClose(key, keyPath) {
      console.log(key, keyPath);
    },
  },
};
</script>

<style scoped lang='scss'>
.div::after {
  content: ""; //标签内容为空
  display: block; //设置为块级元素
  clear: both; //清除浮动，防止高度坍塌
}

.el-carousel__item h3 {
  color: #475669;
  font-size: 18px;
  opacity: 0.75;
  line-height: 300px;
  margin: 0;
}

.el-carousel__item:nth-child(2n) {
  background-color: #99a9bf;
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: #d3dce6;
}

.container {

  min-width: 990px;

  // 设置文本超出使用省略号
  .view-text {
    display: inline-block;
    // white-space: nowrap;
    width: 92%;
    overflow: hidden;
    text-overflow: ellipsis;
  }

  .pannel {
    display: flex;
    justify-content: space-between;

    .rebboIcon {
      font-size: 24px;
      color: #ff5f00;
    }

    .right_menu {
      li {
        line-height: 70px;
        float: left;

        em {
          color: #ff5f00;
        }
      }

      a:hover {
        color: #27ba9b;
      }

      .line {
        margin-left: 10px;
        margin-right: 10px;
      }
    }
  }

  .movie_list {
    display: flex;
    flex-flow: row wrap;

    li {
      width: 300px;
      height: 500px;
      margin: 0 15px 20px 15px;
      background: #ede9e9;
      box-shadow: 0 0 6px 0px #786d6d;
      box-sizing: border-box;

      .movie_head {
        width: 100%;
        height: 350px;
        background-size: cover;
        background-position: center;
        background-image: url("@/assets/images/login-bg.png");
        position: relative;
        font-size: 15px;
        font-weight: bold;
      }

      .movie_info {
        font-size: 14px;
        text-align: left;
        margin: 10px;
      }
    }
  }
}

.example-showcase .el-dropdown-link {
  cursor: pointer;
  color: var(--el-color-primary);
  display: flex;
  align-items: center;
}

.app {
  background: #fff;

  .app-header {

    box-shadow: 0px 5px 10px #dadada;

    .movie-item {
      font-size: 18px;
      padding: 10px;
      margin: 10px;
    }

    .movie-item:hover {
      color: rgb(0, 196, 75);
      border-bottom: 1px solid rgb(0, 196, 75);
    }

    .function-div {
      color: rgb(0, 196, 75);
      font-size: 16px;
      padding: 20px;
    }

    .function-div:hover {
      color: rgb(38, 248, 49);
    }
  }

  .banner-div {
    padding: 20px;
    border: 1px solid #dadada;
    border-radius: 20px;
  }
}
</style>