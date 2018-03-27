<template lang="pug">
  .container
    .article__wrapper
      .article
        .article-title
          | {{ getContent(title) }}
        .article-info__wrapper
          .article-info(v-if="postInfo")
            .article-info__item.publishing(v-if="postInfo.origin")
              a(:href="getContent(postInfo.origin)")
                | {{ getContent(postInfo.origin) }}
            .article-info__item.transfer(v-if="postInfo.translate")
              div Перевод:
              div {{  getContent(postInfo.translate) }}
            .article-info__item.revision(v-if="postInfo.redaction")
              div Редакция:
              div {{ getContent(postInfo.redaction) }}
            .article-info__item.cover(v-if="postInfo.infographic")
              div Обложка:
              div {{ getContent(postInfo.infographic) }}
            .article-info__item.tags(v-if="postInfo.tags")
              div Теги:
              div {{ getTags() }}
          .date
            | {{ getCurrentDate() }}
        .article__content
          img.article__cover-image(v-if="coverImage" :src="coverImage" )
          .article__content-text( v-html="post" )
</template>

<script>
  import { format } from 'date-fns'
  import ru from 'date-fns/locale/ru'

  export default {
    props: ['title', 'coverImage', 'date', 'post', 'postInfo'],

    methods: {
      getContent(data) {
        if (data) return data
        return ""
      },

      getCurrentDate() {
        if (this.date) {
          let date = format(this.date, 'MMMM D, YYYY', { locale: ru });
          return date[0].toUpperCase() + date.slice(1);
        }
        return ""
      },

      getTags() {
        return this.postInfo.tags.join(', '); 
      }
    }
  }


</script>

<style lang="scss">
  .article__content {
    font-family: PTSerif-Regular, helvetica;
  }

  .article__content img {
    width: 100%;
    height: 100%;
  }

  .article__content-text img {
    margin: 10px 0;
    padding: 0 25px;
  }

  .article__content-text p {
    margin: 15px 0;

    line-height: 1.5em;
  }

  .article__content i {
    font-family: PTSerif-Regular, helvetica;
  }
</style>

<style lang="scss" scoped>
  .article__wrapper {
    max-width: 1380px;
    width: 100%;
    margin: 0 auto;
    padding: 40px 30px 90px 77px;


    background: #fff;
    border-radius: 8px;
  }

  .article {
    max-width: 700px;
    width: 100%;
  }

  .article-title {
    font-family: PTSerif-Regular, helvetica;
    font-size: 30px;
  }

  .article-info__wrapper{
    display: flex;
    justify-content: space-between;
    padding-top: 40px;
    padding-bottom: 40px;

    font-size: 16px;
    font-family: PTSerif-Regular, helvetica;
    color: #ACACAC;
  }

  .article-info {
    max-width: 530px;
    width: 100%;
  }

  .article-info__item {
    display: flex;
    margin-bottom: 5px;
  }

  .article-info__item:last-child {
    margin-bottom: 0;
  }

  .article-info__item div:first-child {
    margin-right: 8px;
  }

  .date {
    max-width: 170px;
    width: 100%;
    text-align: right;
    margin-top: auto;

    font-family: Montserrat-Regular, helvetica;
  }

  .content-header {
    font-family: Montserrat-Medium, helvetica;
    font-size: 22px;
  }

  .content-header__image {
    width: 100%;
  }

  .content-header p {
    margin-top: 24px;
    padding-left: 23px;
    padding-right: 23px;
  }

  .content-header .content-header__title {
    margin-top: 40px;
    font-size: 26px;
  }

  .publishing a {
    color: #00C;
  }

  .article__cover-image {
    margin-bottom: 40px;
  }

  .img-info {
    margin-top: 20px;
  }

  @media (max-width: 1024px) {
    .article__wrapper {
      padding-left: 30px;
      padding-right: 30px;
    }
  }
</style>