
<template lang="pug">
  .top-articles__container.container
    router-link(to="#").top-articles__item
      .top-articles__image.top-articles__image-1
        .top-articles__info-name
      .top-articles__text-block
        .top-articles__text
          | Скрининг: в крови
        card-footer
    router-link(to="#").top-articles__item
      .top-articles__image.top-articles__image-2
        .top-articles__info-name
      .top-articles__text-block
        .top-articles__text
          | Влияние электронных сигарет на сердечно-сосудистую систему
        card-footer
</template>

<script>
  import CardFooter from './CardFooter.vue';

  export default {
    components: {
      CardFooter
    }
  }
</script>

<style lang="scss" scoped>
  .top-articles__container {
    justify-content: space-between;
    max-width: 1440px;
    width: 100%;
  }

  .top-articles__item {
    display: flex;
    flex-direction: column;

    width: 675px;
    min-height: 500px;

    cursor: pointer;
  }

  .top-articles__image {

    min-height: 316px;
    width: 100%;

    background: url('../../static/images/dies-irae.png') no-repeat center;
    background-size: cover; 
  }

  .top-articles__text-block {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    flex-grow: 1;

    min-height: 184px; 
    padding: 24px;

    background: #fff;
  }

  .top-articles__text {
    font-family: Montserrat-Bold, helvetica;
    font-size: 23.3px;
  }

  @media(max-width: 1440px) {
    .top-articles__item {
      width: 675/1380 * 100%;
      min-height: 500/1440 * 100vw;
    }

    .top-articles__image {
      min-height: 316/1440 * 100vw;
    }

    .top-articles__text-block {
      min-height: 184/1440 * 100vw; 
      padding: 24/675 * 100%;
    }
  }
  @media(max-width: 1250px) {
    .top-articles__text {
      font-size: 20px;
    }
  }
</style>