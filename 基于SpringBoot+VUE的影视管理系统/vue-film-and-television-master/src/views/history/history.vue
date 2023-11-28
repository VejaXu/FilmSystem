<template>
  <div style="height: 100%;">
    <div class="container">
      <div class="pannel">
        <h2 class="pannel_head">
          <el-page-header @back="goBack" content="历史">
          </el-page-header>
          <i class="rebboIcon iconfont icon-remen"></i>
          观看历史
        </h2>
        <ul class="right_menu">
          <li>
            <a href="#"><em>观看过{{ film.length }}</em> 部
              <span class="line">|</span>
            </a>
          </li>
          <li><a href="#">更多 ></a></li>
        </ul>
      </div>

      <ul class="movie_list" v-if="film.length !== 0">
        <li v-for="item in film" :key="item.id">
          <a href="#" @click.stop="detail(item.num)">
            <el-image class="movie_head" :src="item.field5" :fit="item.title"></el-image>
            <div class="movie_info">
              <p style="display: contents">{{ item.title }}</p>
              <span style="margin-left: 100px">{{ item.mobile }}分钟</span>
              <span class="view-text">简介: {{ item.content }}</span>
              <el-button type="danger" @click.stop="deletes(item.id)" icon="el-icon-delete" circle></el-button>
            </div>
          </a>
        </li>

      </ul>
      <el-empty :image-size="200" v-if="film.length === 0"></el-empty>
    </div>
  </div>
</template>

<script>
import { listHistory, delHistory } from "@/api/history";

export default {
  data() {
    return {
      films: {},
      film: []
    }
  },
  created() {
    this.gethistoryList(this.films);
  },
  methods: {
    //跳转电影详细页面
    detail(id) {
      this.$router.push("/detail/" + id);
    },
    deletes(id) {
      delHistory(id).then(res => {
        this.$message({
          message: '删除成功！',
          type: 'success'
        });
        this.gethistoryList();
      })
    },
    gethistoryList(films) {
      listHistory(films).then(res => {
        console.log("历史：", res)
        this.film = res.data.rows;
      })
    },
    goBack() {
      this.$router.push("/");
    }
  },

}
</script>

<style scoped lang='scss'>
.container {
  margin: 0 300px;
  height: 100%;
  padding: 10px 0;
  background: #fff;
  min-width: 990px;

  .view-text {
    display: inline-block;
    white-space: nowrap;
    width: 100%;
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
    height: 500px;
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
        height: 70%;
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
        padding: 10px;

        p {
          font-size: 18px;
          font-weight: bold;
        }

        span {
          font-size: 14px;
          color: #666;
          text-align: initial;
        }
      }
    }
  }
}
</style>