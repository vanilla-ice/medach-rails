<template lang="pug">
  .wrapper(@click="scrollTo")
    .arrow
      img.arrow-img(src="../static/images/arrow-to-top.svg")
</template>

<script>
  import VueScrollTo from 'vue-scrollto'

  export default {
    methods: {
      scrollTo() {
        VueScrollTo.scrollTo(document.body, 400)
      }
    }
  }
</script>

<style scoped lang="scss">
  .wrapper {
    position: fixed;
    z-index: 999;
    left: 0;
    bottom: 0;
    width: 0;
    height: 0;
    border-style: solid;
    border-width: 0 45px 45px 0;
    border-color: transparent transparent #1F262E transparent;
    text-align: center;
    opacity: .8;
    transition: opacity .2s ease;
    cursor: pointer;

    &:hover {
      opacity: 1;
    }
  }

  .arrow-img {
    position: absolute;
    top: 23px;
    right: -22px;
    width: 15px;
    height: 15px;
    transform: rotate(-90deg);
  }
</style>