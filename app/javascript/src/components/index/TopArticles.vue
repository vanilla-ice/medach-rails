
<template lang="pug">
  .top-articles__container.container
    router-link(:to=" 'post/' + info.pinnedArticles[0].id ").top-articles__item
      .top-articles__image.top-articles__image-1( :style="{ backgroundImage:`url(${info.pinnedArticles[0].coverImage.url})` }")
        .top-articles__info-name
      .top-articles__text-block
        .top-articles__text
          | {{ getTitle(info.pinnedArticles[0]) }}
        card-footer( :tags="info.pinnedArticles[0].tags", :view="info.pinnedArticles[0].views" :date="info.pinnedArticles[0].publicationDate" )
    router-link(:to="'post/' + info.pinnedArticles[1].id").top-articles__item
      .top-articles__image.top-articles__image-2( :style="{ backgroundImage:`url(${info.pinnedArticles[1].coverImage.url})` }")
        .top-articles__info-name
      .top-articles__text-block
        .top-articles__text
          | {{ getTitle(info.pinnedArticles[1].title) }}
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
      }
    },

    mounted() {
      console.log(this.info);
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