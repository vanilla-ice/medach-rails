<template lang="pug">
  .container
    router-link(to="#").card.left-card
      .title
        | Четыре вопроса о зубах мудрости.
      card-footer
    router-link(to="#").card.right-card
      .title
        | Четыре вопроса о зубах мудрости.
      card-footer
</template>

<script>
  import CardFooter from "./CardFooter.vue"
  export default {
    components: {
      CardFooter
    }
  }
</script>

<style lang="scss" scoped>
  .container {
    margin-top: 30px;
  }

  .card {
    position: relative;

    display: flex;
    flex-direction: column;
    justify-content: space-between;
    flex-basis: 50%;

    width: 50%;
    min-height: 235px;
    padding: 40px 24px 24px;

    &::after {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      bottom: 0;
      right: 0;
      background: #000;
      opacity: 0.5;
      z-index: 1;
      pointer-events: none;

      border-radius: 8px;
    }  
  }

  .left-card {
    background: url('../../static/images/scince-rich.jpg') no-repeat center;
    background-size: cover;

    border-radius: 8px;
  }

  .right-card {
    background: url('../../static/images/scince-rich.jpg') no-repeat center;
    background-size: cover;

    border-radius: 8px;
  }

  .card div {
    position: relative;
    z-index: 2;
  }

  .right-card {
    margin-left: 30px;
  }

  .title {
    padding-right: 24px;

    text-align: right;
    font-family: Montserrat-Bold, Helvetica;
    color: #fff;
    font-size: 18px;
  }
</style>