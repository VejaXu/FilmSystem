<template>
  <div style="height: 100%;">
    <div style="margin: 0 300px;">
      <el-page-header @back="goBack" content="公告消息" style="padding: 20px 0;">
      </el-page-header>
      <div class="container">
        <div class="all" v-for="(item, i) in tableData" :key="i">
          <el-row type="flex" align="middle">
            <el-col :span="20">
              <h1 style="font-size: 19px;">{{ item.title }}</h1>
            </el-col>
            <el-col :span="4">
              <a @click="getA(i)">查看详细</a>
            </el-col>
          </el-row>
          
        
          <div class="a1" style="font-size: 15px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">内容: {{
            test(item.address) }}</div>
          <div class="a1" style="color: #d0cdc9; margin-top: 38px;">日期: {{ item.createTime }}</div>
        </div>
      </div>


      <el-dialog :title="notices.title" :visible.sync="dialogVisible" width="30%" :before-close="handleClose">
        <div v-html="notices.address">

        </div>
        <span slot="footer" class="dialog-footer">
          <el-button @click="dialogVisible = false">取 消</el-button>
          <el-button type="primary" @click="dialogVisible = false">确 定</el-button>
        </span>
      </el-dialog>

    </div>
  </div>
</template>

<script>
import { listNotice } from '@/api/notice'
import { MessageBox } from 'element-ui';

export default {
  components: [MessageBox],
  data() {
    return {
      notices: {},
      dialogVisible: false,
      query: {},
      tableData: [],
      test(str){
        return str.replace(/<[^>]+>/g, '');
      }
    }
  },
  created() {
    this.getList();
  },
  methods: {
    getA(i) {
      this.notices = this.tableData[i];
      this.dialogVisible = true;
    },
    getList(query) {
      listNotice(query).then(res => {

        if (res.data.code == 200) {
          this.tableData = res.data.rows;
          console.log(this.tableData);
        }
      })
    },
    goBack() {
      this.$router.push("/");
    },
  }
}
</script>

<style scoped>

.container{
  padding: 10px;
  border: 1px solid #dadada;
}

.all {
  padding: 10px;
  display: inline-block;
  width: 400px;
  height: 130px;
  margin: 10px;
  text-align: left;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)
}

/* 在这里添加样式，以匹配腾讯视频的留言样式 */
.comment {
  border: 1px solid #ddd;
  padding: 10px;
  margin-bottom: 10px;
}

.hidden {
  display: none;
}
</style>
