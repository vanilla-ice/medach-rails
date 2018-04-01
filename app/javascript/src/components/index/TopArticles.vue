
<template lang="pug">
  .top-articles__container.container
    router-link(:to=" 'post/' + info.pinnedArticles[0].id ").top-articles__item
      .top-articles__image.top-articles__image-placeholder
        span MEDACH
      .top-articles__image.top-articles__image-1( :style="{ backgroundImage:`url(${getImageSrc(0)})` }")
        .top-articles__info-name
      .top-articles__text-block
        .top-articles__text
          | {{ getTitle(info.pinnedArticles[0]) }}
        card-footer( :tags="info.pinnedArticles[0].tags", :view="info.pinnedArticles[0].views" :date="info.pinnedArticles[0].publicationDate" )
    router-link(:to="'post/' + info.pinnedArticles[1].id").top-articles__item
      .top-articles__image.top-articles__image-placeholder
        span MEDACH
      .top-articles__image.top-articles__image-2( :style="{ backgroundImage:`url(${getImageSrc(1)})` }")
        .top-articles__info-name
      .top-articles__text-block
        .top-articles__text
          | {{ getTitle(info.pinnedArticles[1]) }}
        card-footer( :tags="info.pinnedArticles[1].tags", :view="info.pinnedArticles[1].views" :date="info.pinnedArticles[1].publicationDate" )
</template>

<script>
  import CardFooter from './CardFooter.vue';

  export default {
    props: ['info'],

    components: {
      CardFooter
    },

    methods: {
      getTitle(data) {
        if (data) return data.title
        return "Неизвестно" 
      },

      getImageSrc(num) {
        if (this.info.pinnedArticles[num].smallCoverImage.url) return this.info.pinnedArticles[num].smallCoverImage.url
        return this.info.pinnedArticles[num].coverImage.url
      }
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
    position: relative;

    display: flex;
    flex-direction: column;

    width: 675px;
    min-height: 500px;

    cursor: pointer;
  }

  .top-articles__image.top-articles__image-placeholder {
    position: absolute;
    z-index: 1;
    background-color: #f8f8f8;
    top: 0;
    left: 0;
    width: 100%;

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

  .top-articles__image {
    position: relative;
    z-index: 2;
    min-height: 316px;
    width: 100%;

    background-repeat: no-repeat;
    background-position: center;
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

  @media (min-width: 1024px) and (max-width: 1440px) {
    .top-articles__item {
      width: 675/1380 * 100%;
      min-height: 500/1440 * 100vw;
    }

    .top-articles__image {
      min-height: 316/1440 * 100vw;
    }

    .top-articles__text-block {
      min-height: 184/1440 * 100vw; 
      padding: 24/1440 * 100vw;
    }
  }
  @media(max-width: 1250px) {
    .top-articles__text {
      font-size: 20px;
    }
  }

  @media(max-width: 1024px) {
    .top-articles__container {
      flex-direction: column;
    }

    .top-articles__item {
      width: 100%;
      max-width: 675px;

      margin: 0 auto;
      margin-bottom: 20px;
    }
  }

  @media(max-width: 500px) {
    .container {
      padding-left: 0;
      padding-right: 0; 
    }

    .top-articles__item {
      min-height: 10px;
    }

    .top-articles__image {
      min-height: 200px;
    }

    .top-articles__text-block {
      position: absolute;
      top: 0;
      left: 0;
      z-index: 3;

      width: 100%;
      height: 100%;
      justify-content: flex-end;
      padding: 15px;

      background: rgba(0,0,0, 0.7);
    }

    .top-articles__text {
      font-family: Montserrat-Regular;
      color: #fff;
    }
  }

</style>