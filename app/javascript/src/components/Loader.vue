<template lang="pug">
  .wrapper
    .loader
      img(src="../static/images/loader.svg")
</template>

<script>
export default {
  data() {
    return {
    }
  },

  methods: {
    
  }
}
</script>

<style scoped lang="scss">
.wrapper {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100vh;
  background: #fff;
  z-index: 100;
}

.loader {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

</style>

