<template>
  <div style="height: 100%; min-width: 990px;" >
    <div style="margin: 0 300px;">
      <el-page-header @back="goBack" content="热映电影" style="padding: 20px 0;">
      </el-page-header>

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
            热映电影
          </h2>
          <ul class="right_menu">
            <li>
              <a href="#">最近更新 <em>{{ film.length }}</em> 部
                <span class="line">|</span>
              </a>
            </li>
            <li><a href="#">更多 ></a></li>
          </ul>
        </div>

        <ul class="movie_list" v-if="films.length != 0">
          <li v-for="item in films" :key="item.id">
            <a @click="detail(item.id)">
              <el-image class="movie_head" :src="item.field5" :fit="item.title"></el-image>
              <div class="movie_info">
                <p style="display: contents">{{ item.title }}</p>
                <span style="margin-left: 100px">{{ item.mobile }}分钟</span>
                <span class="view-text">简介: {{ item.content }}</span>
              </div>
            </a>
          </li>
        </ul>
        <el-empty :image-size="200" v-if="film.length == 0"></el-empty>
      </div>
    </div>
  </div>
</template>

<script>
import { listCarousel } from "@/api/carousel";
import { getFilms } from "@/api/films";

export default {
  data() {
    return {
      carousel: [],
      films: []
    }
  },
  created() {
    this.film();
    this.getCarousel();
  },
  methods: {
    goBack() {
      this.$router.push("/");
    },
    //查询轮播图
    getCarousel() {
      listCarousel().then(res => {
        if (res.data.code = 200) {
          this.carousel = res.data.rows;
        }
      })
    },
    //查询所有电影
    film(films) {
      getFilms(films).then((res) => {
        if (res.data.code == 200) {
          this.films = res.data.rows;
        }
      });
    },
    //跳转电影详细页面
    detail(id) {
      this.$router.push("/detail/" + id);
    },
  }
}
</script>

<style scoped lang='scss'>
.container {
  margin-top: 20px;
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

        .movie_test_left {
          color: #fff;
          position: absolute;
          bottom: 8px;
          padding-left: 5px;
        }

        .movie_test_right {
          color: #ff5f00;
          position: absolute;
          bottom: 8px;
          right: 8px;
        }
      }

      .movie_info {
        margin-top: 10px;

        p {
          font-size: 18px;
          font-weight: bold;
        }

        span {
          font-size: 14px;
          color: #666;
          margin-left: 15px;
          text-align: initial;
        }
      }
    }
  }
}

.banner-div {
    padding: 20px;
    border: 1px solid #dadada;
    border-radius: 20px;
  }
</style>