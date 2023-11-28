<template>
  <div class="dashboard-editor-container">
    <iframe v-if="showDaping" :src="`/daping/index.html`"  width="100%" height="2000" scrolling="auto"></iframe>
    <div v-else  class="title">欢迎使用影视管理系统</div>
  </div>
</template>

<script>
  export default {
    name: 'Index',
    data() {
      return {
        showDaping: false //是否显示大屏，true/false
      }
    },
    methods: {
    }
  }
</script>

<style lang="scss" scoped>
  .dashboard-editor-container {
    .title{
      font-size: 50px;
      color: #409EFF;
      text-align: center;
      font-family: '宋体';
      font-weight: bold;
    }
    background-color: rgb(240, 242, 245);
    position: relative;

    .chart-wrapper {
      background: #fff;
      padding: 16px 16px 0;
      margin-bottom: 32px;
    }
  }

  @media (max-width: 1024px) {
    .chart-wrapper {
      padding: 8px;
    }
  }
</style>
