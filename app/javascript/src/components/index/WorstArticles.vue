<template lang="pug">
  .worst-articles__container.container
    router-link.worst-articles__item(v-for="(item, id) in info" v-if="id < 3" :key="item.id" :to="'post/' + item.id")
      .worst-articles__image.worst-articles__image-placeholder
        span MEDACH
      .worst-articles__image( :style="{ backgroundImage: `url(${item.coverImage.url})` }" )
        .worst-articles__info-name
      .worst-articles__text-block
        .worst-articles__text
          | {{ item.title }}
        card-footer(:view="item.views", :date="item.publicationDate")
</template>

<script>
  import CardFooter from './CardFooter.vue';

  import { mapGetters } from 'vuex'

  export default {
    props: ['info'],

    components: {
      CardFooter
    }
  }
</script>

<style lang="scss" scoped>
  .worst-articles__container {
    justify-content: space-between;
    padding-top: 15px;
    padding-bottom: 15px;
  }

  .worst-articles__item {
    position: relative;

    display: flex;
    flex-direction: column;

    max-width: 440px;
    width: 100%;

    background: #fff;
    min-height: 500px;
  }

  .worst-articles__image {
    position: relative;
    z-index: 2;

    min-height: 325px;
    background-size: cover;
  }

  .worst-articles__image-placeholder {
    position: absolute;
    z-index: 1;
    top: 0;
    left: 0;
    width: 100%;

    background: #f8f8f8;

    span {
      font-size: 28px;
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      line-height: 24px;
      color: #aaaaaa;
    }
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
    font-family: Montserrat-Bold, helvetica;
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

  @media (min-width: 1024px) and (max-width: 1440px) {
    .worst-articles__item {
      max-width: 440/1380 * 100%;
      min-height: 500/1440 * 100vw;
    }

    .worst-articles__text-block {
      padding: 24/1440 * 100vw;
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

  @media(max-width: 1024px) {
    .worst-articles__container {
      flex-direction: column;
      justify-content: flex-start;

      padding-top: 10px;
      padding-bottom: 10px;
    }

    .worst-articles__item {
      max-width: 675px;
      margin: 0 auto;
      margin-bottom: 20px;
    }

    .worst-articles__item:last-child {
      margin-bottom: 0;
    }
  }

  @media(max-width: 500px) {
    .worst-articles__item {
      min-height: 310px;
    }

    .worst-articles__image {
      min-height: 200px;
    }

    .worst-articles__text-block {
      padding: 18px;
    }

    .worst-articles__text {
      font-family: Montserrat-Regular;
    }
  }
</style>