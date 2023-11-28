<template>
  <div>
    <header class="login-header">
      <div class="container m-top-20">
        <h1 class="logo"></h1>
        <RouterLink class="entry" to="/">
          进入网站首页
          <i class="iconfont icon-angle-right"></i>
          <i class="iconfont icon-angle-right"></i>
        </RouterLink>
      </div>
    </header>
    <section class="login-section" v-if="account">
      <div class="wrapper">
        <nav>
          <a href="javascript:;">账户登录</a>
        </nav>
        <div class="account-box">
          <div class="form">
            <el-form ref="formRef" style="line-height: 28px" :model="userInfo" status-icon>
              <el-form-item prop="username" label="账户">
                <el-input v-model="userInfo.username" />
              </el-form-item>
              <el-form-item prop="password" label="密码">
                <el-input v-model="userInfo.password" type="password" />
              </el-form-item>
              <el-form-item prop="code">
                <el-row :gutter="12">
                  <el-col :span="17">
                    <el-input v-model="userInfo.code" auto-complete="off" placeholder="验证码"/>
                  </el-col>
                  <el-col :span="7">
                    <img :src="codeUrl" @click="getLoginCode" style="max-width: 100%;" />
                  </el-col>
                </el-row>
              </el-form-item>
              <el-form-item prop="agree" label-width="22px">
                <el-checkbox v-model="userInfo.agree" size="large">
                  我已同意隐私条款和服务条款
                </el-checkbox>
              </el-form-item>
              <el-button size="large" class="subBtn" @click="doLogin">点击登录</el-button>
              <div>
                没有账号？<a @click.stop="accounts('a')" style="color: blue">注册账号</a>
              </div>
            </el-form>
          </div>
        </div>
      </div>
    </section>
    <section class="login-section" v-if="!account">
      <div class="wrapper">
        <nav>
          <a href="javascript:;">账户注册</a>
        </nav>
        <div class="account-box">
          <div class="form">
            <el-form ref="formRef" style="line-height: 28px" :model="user" status-icon>
              <el-form-item prop="username" label="用户名">
                <el-input v-model="user.userName" />
              </el-form-item>
              <el-form-item prop="phonenumber" label="手机号">
                <el-input v-model="user.phonenumber" />
              </el-form-item>
              <el-form-item prop="password" label="密码">
                <el-input v-model="user.password" type="password" />
              </el-form-item>
              <el-form-item label="验证码">
                <el-input v-model="code1" @blur="inputCode()" prefix-icon="el-icon-lock" />
                <a @click.capture="getCode()"><el-image style="width: 100px; height: 50px"
                    :src="'http://localhost:9001/profile/upload' + codes.routes">
                  </el-image></a>
              </el-form-item>
              <el-button size="large" class="subBtn" @click="getUser" :disabled="disabled">注 册</el-button>
              <div>
                已有账号？<a @click.stop="accounts('b')" style="color: blue">登录账号</a>
              </div>
            </el-form>
          </div>
        </div>
      </div>
    </section>

    <footer class="login-footer">
      <div class="container">
        <p>
          <a href="javascript:;">关于我们</a>
          <a href="javascript:;">帮助中心</a>
          <a href="javascript:;">售后服务</a>
          <a href="javascript:;">配送与验收</a>
          <a href="javascript:;">商务合作</a>
          <a href="javascript:;">搜索推荐</a>
          <a href="javascript:;">友情链接</a>
        </p>
        <p>CopyRight &copy; 遥云影院</p>
      </div>
    </footer>
  </div>
</template>

<script>
import { loginAPI, getCodeImg } from "@/api/login";
import { code, addUser, getUserProfile } from "@/api/user";
import { setToken } from '@/utils/auth';

export default {
  data() {
    return {
      disabled: true,
      account: true,
      code1: null,
      codes: {
        code: null,
        routes: null,
      },
      userInfo: {
        username: "user1",
        password: "123456",
        uuid: undefined,
        code: undefined,
        agree: true,
      },
      user: {
        userName: null,
        phonenumber: null,
        password: null,
      },
      codeUrl: "",
    };
  },
  created() {
    this.getLoginCode();
  },
  methods: {
    getLoginCode() {
      getCodeImg().then(res => {
        this.codeUrl = "data:image/gif;base64," + res.data.img;
        this.userInfo.uuid = res.data.uuid;
      });
    },
    getUser() {
      addUser(this.user).then((res) => {
        if (res.data.code == 200) {
          this.$message({
            message: "账号注册成功！",
            type: "success",
          });
        }
        this.account = true;
      });
    },
    inputCode() {
      if (this.codes.code === this.code1) {
        this.disabled = false;
        this.$message({
          message: "验证码正确！",
          type: "success",
        });
      } else {
        this.disabled = true;
        this.$message({
          message: "验证码错误！",
          type: "error",
        });
      }
    },
    accounts(a) {
      this.account = !this.account;
      if (a === "a") {
        this.getCode();
      }
    },
    getCode() {
      code().then((res) => {
        if (res.data.code == 200) {
          this.codes.code = res.data.data.code;
          this.codes.routes = res.data.data.routes;
          console.log("验证码", res)
        }
      });
    },
    doLogin() {
      const username = this.userInfo.username;
      const password = this.userInfo.password;
      // 调用实例方法
      if (this.userInfo.agree) {
        if ((username != null) & (password != null)) {
          loginAPI({ username, password, code:this.userInfo.code, uuid: this.userInfo.uuid }).then((res) => {
            setToken(res.data.token);
            if (res.data.code == 200) {
              this.$message({
                message: "登录成功",
                type: "success",
              });
              this.$router.push("/");
            } else {
              this.getLoginCode();
              this.$message({
                message: res.data.msg,
                type: "error",
              });
            }

          });
        } else {
          this.$message({
            message: "账号或密码不能为空！！！",
            type: "warning",
          });
        }
      } else {
        this.$message({
          message: "请同意用户隐私协议",
          type: "warning",
        });
      }
    },
  },
};
</script>

<style scoped lang='scss'>
@import "@/styles/var.scss";

.login-header {
  background: #fff;
  border-bottom: 1px solid #e4e4e4;

  .container {
    display: flex;
    align-items: flex-end;
    justify-content: space-between;
  }

  .logo {
    width: 200px;

    a {
      display: block;
      height: 132px;
      width: 100%;
      text-indent: -9999px;
      background: url("@/assets/images/logo.png") no-repeat center 18px / contain;
    }
  }

  .sub {
    flex: 1;
    font-size: 24px;
    font-weight: normal;
    margin-bottom: 38px;
    margin-left: 20px;
    color: #666;
  }

  .entry {
    width: 120px;
    margin-bottom: 38px;
    font-size: 16px;

    i {
      font-size: 14px;
      color: #27ba9b;
      letter-spacing: -5px;
    }
  }
}

.login-section {
  background: url("@/assets/images/login-bg3.png") no-repeat center / cover;
  height: 799px;
  width: 2059px;
  position: relative;

  .wrapper {
    width: 380px;
    background: #fff;
    position: absolute;
    left: 50%;
    top: 54px;
    transform: translate3d(100px, 0, 0);
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);

    nav {
      font-size: 14px;
      height: 55px;
      margin-bottom: 20px;
      border-bottom: 1px solid #f5f5f5;
      display: flex;
      padding: 0 40px;
      text-align: right;
      align-items: center;

      a {
        flex: 1;
        line-height: 1;
        display: inline-block;
        font-size: 18px;
        position: relative;
        text-align: center;
      }
    }
  }
}

.login-footer {
  padding: 30px 0 50px;
  background: #fff;

  p {
    text-align: center;
    color: #999;
    padding-top: 20px;

    a {
      line-height: 1;
      padding: 0 10px;
      color: #999;
      display: inline-block;

      ~a {
        border-left: 1px solid #ccc;
      }
    }
  }
}

.account-box {
  .toggle {
    padding: 15px 40px;
    text-align: right;

    a {
      color: #27ba9b;

      i {
        font-size: 14px;
      }
    }
  }

  .form {
    padding: 0 20px 20px 20px;

    &-item {
      margin-bottom: 28px;

      .input {
        position: relative;
        height: 36px;

        >i {
          width: 34px;
          height: 34px;
          background: #cfcdcd;
          color: #fff;
          position: absolute;
          left: 1px;
          top: 1px;
          text-align: center;
          line-height: 34px;
          font-size: 18px;
        }

        input {
          padding-left: 44px;
          border: 1px solid #cfcdcd;
          height: 36px;
          line-height: 36px;
          width: 100%;

          &.error {
            border-color: $priceColor;
          }

          &.active,
          &:focus {
            border-color: #27ba9b;
          }
        }

        .code {
          position: absolute;
          right: 1px;
          top: 1px;
          text-align: center;
          line-height: 34px;
          font-size: 14px;
          background: #f5f5f5;
          color: #666;
          width: 90px;
          height: 34px;
          cursor: pointer;
        }
      }

      >.error {
        position: absolute;
        font-size: 12px;
        line-height: 28px;
        color: $priceColor;

        i {
          font-size: 14px;
          margin-right: 2px;
        }
      }
    }

    .agree {
      a {
        color: #069;
      }
    }

    .btn {
      display: block;
      width: 100%;
      height: 40px;
      color: #fff;
      text-align: center;
      line-height: 40px;
      background: #27ba9b;

      &.disabled {
        background: #cfcdcd;
      }
    }
  }

  .action {
    padding: 20px 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;

    .url {
      a {
        color: #999;
        margin-left: 10px;
      }
    }
  }
}

.subBtn {
  background: #27ba9b;
  width: 100%;
  color: #fff;
}
</style>