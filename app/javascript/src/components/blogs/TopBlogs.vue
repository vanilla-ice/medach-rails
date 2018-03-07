<template lang="pug">
  .top-blogs.container
    router-link(to="#").top-blogs__left
      .top-blogs__left-title
        | Про канадскую медицину.
      card-footer
    .top-blogs__right
      router-link(to="#").top-blogs__right-card.top-blogs__right-card-1
        .top-blogs__right-title
          | Четыре вопроса о зубах мудрости.
        card-footer
      router-link(to="#").top-blogs__right-card.top-blogs__right-card-2
        .top-blogs__right-title
          | Лечение в Израиле. ЭТО ПРОСТО
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
  .top-blogs__left {
    position: relative;

    display: flex;
    flex-direction: column;
    justify-content: space-between;
    flex-basis: 50%;

    width: 50%;
    min-height: 500px;
    padding: 40px 38px 24px 24px;

    background: url('../../static/images/dies-irae.png') no-repeat center;
    background-size: cover;

    border-radius: 8px;

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

  .top-blogs__left div {
    position: relative;
    z-index: 2;
  }

  .top-blogs__left-title {
    font-family: Montserrat-Bold, Helvetica;
    color: #fff;
    font-size: 24px;
  }

  .top-blogs__right {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    flex-basis: 50%;
    
    margin-left: 30px;
    width: 50%;

    min-height: 500px;
  }

  .top-blogs__right-title {
    padding-right: 24px;

    text-align: right;
    font-family: Montserrat-Bold, Helvetica;
    color: #fff;
    font-size: 18px;
  }

  .top-blogs__right-card {
    position: relative;

    display: flex;
    flex-direction: column;
    justify-content: space-between;

    width: 100%;
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

  .top-blogs__right-card div {
    position: relative;
    z-index: 2;
  }

  .top-blogs__right-card-1 {
    background: url('../../static/images/scince-rich.jpg') no-repeat center;
    background-size: cover;

    border-radius: 8px;
  }

  .top-blogs__right-card-2 {
    background: url('../../static/images/scince-rich.jpg') no-repeat center;
    background-size: cover;

    border-radius: 8px;
  }

  @media(max-width: 1440px) {
    .top-blogs__left {
      min-height: 500/1440 * 100vw;
      padding-top: 40/1440 * 100%;
      padding-right: 38/1440 * 100%;
      padding-bottom: 24/1440 * 100%;
      padding-left: 24/1440 * 100%;
    }

    .top-blogs__right {
      min-height: 500/1440 * 100vw;
    }

    .top-blogs__right-card {
      min-height: 235/1440 * 100vw;;
    }
  }
</style>