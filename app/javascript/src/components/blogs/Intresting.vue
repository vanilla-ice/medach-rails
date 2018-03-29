<template lang="pug">
  .container
    .intresting-wrapper
      .card-title
        | Вам будет интересно!
      .cards
        router-link.card(v-for="(item, id) in info" v-if="id < 2" :key="item.id" :to="'blog-post/' + item.id")
          .card__image.card__image-placeholder
            span MEDACH
          .card__image( :style="{ backgroundImage: `url(${item.coverImage.url})` }" )
            .card__info-name
          .card__text-block
            .card__text
              | {{ item.title }}
            card-footer(:view="item.views", :date="item.publicationDate")
</template>

<script>
  import CardFooter from './CardFooter.vue'

  export default {
    props: ['info'],
    components: {
      CardFooter
    }
  }
</script>

<style lang="scss" scoped>
  .container {
    margin-top: 30px;
  }

  .intresting-wrapper {
    min-height: 500px;
    padding: 30px 15px 15px;
    width: 100%;
    margin-bottom: 10px;

    background: #fff;
    box-shadow: 0 0 15px rgba(0,0,0,0.15), inset 0 4px 0 #110F6C;
  }

  .card-title {
    text-align: center;
    font-size: 29px;
    font-family: Montserrat-SemiBold, helvetica;
  }

  .cards {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;

    width: 100%;
    margin-top: 40px;
  }

  .card {
    position: relative;
    display: flex;
    flex-direction: column;
    justify-content: flex-end;

    min-height: 410px;
    max-width: 660px;
    width: 100%;
    border-radius: 3px;
  }

  .card .card__image {
    position: absolute;
    z-index: 2;

    height: 100%;
    width: 100%;
    background-size: cover;
  }

  .card .card__image-placeholder {
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

  .card div {
    z-index: 4;
  }

  .card__text-block {
    display: flex;
    flex-direction: column;
    justify-content: space-between;

    min-height: 190px;
    padding: 60px 18px 18px;

    font-family: Montserrat-SemiBold, helvetica;
    font-size: 27px;
    line-height: 29px;
    color: #fff;

    background-image: linear-gradient(-180deg, rgba(0,0,0,0) 0, rgba(0,0,0,0.05) 5%, rgba(0,0,0,0.2) 25%, rgba(0,0,0,0.5) 100%);
    text-shadow: 0 2px 2px rgba(0,0,0,0.5);
  }

  .card__text {
    margin-bottom: 15px;
  }

  @media (min-width: 1024px) and (max-width: 1440px) {
    .intresting-wrapper {
      min-height: 500/1440 * 100vw;
      padding-top: 30/1440 * 100vw;
      padding-bottom: 15/1440 * 100vw;
      padding-left: 15/1440 * 100vw;
      padding-right: 15/1440 * 100vw;
    }

    .cards {
      margin-top: 40/1440 * 100vw;
    }

    .card {
      min-height: 410/1440 * 100vw;
      max-width: 48.875%;
    }
  }

  @media(max-width: 1024px) {
    .card {
      max-width: 660px;
      width: 100%;
      margin: 0 auto;
      margin-bottom: 20px;
    }

    .card:last-child {
      margin-bottom: 0;
    }
  }

  @media(max-width: 700px) {
    .card__text {
      font-size: 20px;
    }
  }

  @media(max-width: 500px) {
    .card-title {
      font-size: 24px;
    }

    .container {
      padding-left: 0;
      padding-right: 0;
    }

    .intresting-wrapper {
      padding-left: 0;
      padding-right: 0; 
    }

    .card {
      min-height: 56vw;
    }

    .card__text-block {
      min-height: 29vw;
      padding: 40px 12px 12px;
    }
  }
</style>