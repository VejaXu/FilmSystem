<template>
  <div>
    <svg-icon icon-class="question" @click="goto"/>
  </div>
</template>

<script>
export default {
  name: '',
  data() {
    return {
      url: 'http://'
    }
  },
  methods: {
    goto() {
      window.open(this.url)
    }
  }
}
</script>