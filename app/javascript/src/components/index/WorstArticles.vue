<template lang="pug">
  .worst-articles__container.container
    router-link(to="#").worst-articles__item
      .worst-articles__image
        .worst-articles__info-name
      .worst-articles__text-block
        .worst-articles__text
          | Генетически модефицированые бактериофаги: обзор достижений последнего десятилетия
        card-footer
    router-link(to="#").worst-articles__item
      .worst-articles__image
      .worst-articles__text-block
        .worst-articles__text
          | Новые возможности анализа крови
        card-footer
    router-link(to="#").worst-articles__item
      .worst-articles__image
      .worst-articles__text-block
        .worst-articles__text
          | Новые возможности анализа крови
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
  .worst-articles__container {
    margin-top: 30px; 
    justify-content: space-between;
  }

  .worst-articles__item {
    display: flex;
    flex-direction: column;

    max-width: 440px;
    width: 100%;

    background: #fff;
    min-height: 500px;

  }

  .worst-articles__image {
    min-height: 325px;
    background: url('../../static/images/good-bad.png') no-repeat center;
    background-size: cover;
  }

  .worst-articles__text-block {
    display: flex;
    flex-direction: column;
    flex-grow: 1;
    justify-content: space-between;

    padding: 24px;
  }

  .worst-articles__text-footer {
    display: flex;
    min-height: 25px;
    align-items: flex-start;

    margin-top: 10px;

    font-size: 16px;
    color: #7F7F7F;
  }

  .worst-articles__text {
    font-size: 18px;
  }

  .worst-articles__like {
    display: flex;
    align-items: center;

    margin-right: 24px;
  }

  .worst-articles__like-icon {
    width: 21px;
    height: 26px;
    margin-right: 5px;

    background: url('../../static/images/fire.png') no-repeat center;
  }

  .worst-articles__like-digit {
    font-size: 16px;
  }

  .worst-articles__tags {
    display: flex;
    flex-wrap: wrap;
  }

  .worst-articles__tag {
    display: inline-block;
    padding: 3px 7px 4px 7px;
    margin-right: 8px;
    margin-bottom: 5px;

    font-size: 14px;
    border-radius: 3px;
    border: 1px solid #7F7F7F;
  }

  .worst-articles__date {
    flex-shrink: 0;
    margin-left: auto;
    padding-top: 4px;
    
    text-align: right;
  }

  @media(max-width: 1440px) {
    .worst-articles__item {
      max-width: 440/1380 * 100%;
      min-height: 500/1440 * 100vw;
    }

    .worst-articles__text-block {
      padding: 24/440 * 100%;
    }

    .worst-articles__image {
      min-height: 325/1440 * 100vw;
    }
  }

  @media(max-width: 1250px) {
    .worst-articles__text {
      font-size: 16px;
    }

    .worst-articles__text-footer {
      font-size: 14px;
    }

    .worst-articles__tag {
      font-size: 12px;
    }

    .worst-articles__like {
      margin-right: 12px;
    }

    .worst-articles__like-icon {
      width: 18px;
      height: 20px;
    }

    .worst-articles__like-digit {
      font-size: 14px;
    }

    .worst-articles__date {
      padding-top: 2px;
    }
  }
</style>