<template lang="pug">
  .container
    router-link.card(v-for="(item, id) in info" :key="item.id" v-if="id < 2" :to="'blog-post/' + item.id")
      .card__image( :style="{ backgroundImage:`url(${item.coverImage.url})` }")
      .card__placeholder
      .title
        | {{ item.title }}
      card-footer(:tags="item.tags" :view="item.views" :author="item.author" :date="item.publicationDate")
</template>

<script>
  import CardFooter from "./CardFooter.vue"
  export default {
    props: ['info'],

    components: {
      CardFooter
    }
  }
</script>

<style lang="scss" scoped>
  .container {
    display: flex;
    justify-content: space-between;
    margin-top: 30px;
  }

  .card {
    position: relative;

    display: flex;
    flex-direction: column;
    justify-content: space-between;
    flex-basis: 50%;

    max-width: 675px;
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
      z-index: 3;
      pointer-events: none;

      border-radius: 8px;
    }  
  }

  .card .card__image {
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    z-index: 2;

    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    border-radius: 8px;
  }

  .card .card__placeholder {
    position: absolute;
    z-index: 1;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;

    background-color: #110E9B;
    border-radius: 8px;
  }

  .card div {
    position: relative;
    z-index: 4;
  }

  .title {
    padding-right: 24px;

    text-align: right;
    font-family: Montserrat-Bold, Helvetica;
    color: #fff;
    font-size: 18px;
  }

  @media (max-width: 1440px) {
    .card {
      min-height: 235/1440 * 100vw;
      max-width: 675/1380 * 100%;
      padding-top: 40/1440 * 100vw;
      padding-left: 24/1440 * 100vw;
      padding-right: 24/1440 * 100vw;
      padding-bottom: 24/1440 * 100vw;
    }
  }
</style>