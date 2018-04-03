<template lang="pug">
  .blogs__container.container
    .blogs__wrapper
      .blogs-tag
        | БЛОГИ
      .blogs__articles-wrapper
        router-link(:to=" 'blog-post/' + info[0].id ").blogs__articles-big
          .blogs__articles-big-text
            | {{ info[0].title }}
          .blogs__articles-big-date
            | {{ currentDate(info[0].publicationDate) }}  
        .blogs__articles-min-wrapper
          router-link(v-for="(item, id) in info" v-if="id > 0 && id < 5" :key="id" :to=" 'blog-post/' + item.id ").blogs__articles-min-item
            .blogs__articles-min-item-text
              | {{ item.title }}
            .blogs__articles-min-item-date
              | {{ currentDate(item.publicationDate) }}
</template>

<script>
 import { format } from 'date-fns'
 import ru from 'date-fns/locale/ru'

  export default {
    props: ['info'],

    methods: {
      currentDate(data) {
      if (data) {
          let date = format(data, 'MMMM D, YYYY', { locale: ru });
          return date[0].toUpperCase() + date.slice(1);
        }
        return ""
      }
    }
  }
</script>

<style lang = "scss" scoped>
  .blogs__container {
    padding-top: 15px;
    padding-bottom: 15px;
  }

  .blogs__wrapper {
    width: 100%;
    padding: 24px 24px 31px 24px;
    flex-wrap: nowrap;

    font-family: Montserrat-SemiBold, helvetica;

    background: #fff;
  }

  .blogs-tag {
    display: inline-block;
    padding: 3px 7px 4px 7px;
    margin-right: 8px;

    font-size: 14px;
    font-family: Montserrat-Medium, helvetica;

    border-radius: 3px;
    border: 1px solid #7F7F7F;
  }

  .blogs__articles-wrapper {
    display: flex;
    flex-wrap: wrap;
    flex-wrap: nowrap;
    justify-content: space-between;

    margin-top: 24px;
  }

  .blogs__articles-big {
    display: flex;
    flex-direction: column;
    justify-content: space-between;

    width: 50%;
    min-height: 251px;
    margin-right: 2%;

    cursor: pointer;
  }

  .blogs__articles-big-text {
    font-size: 24px;
  }

  .blogs__articles-big-date {
    font-size: 16px;
    color: #ACACAC;
  }

  .blogs__articles-min-wrapper {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;

    width: 50%;
    min-height: 251px;
  }

  .blogs__articles-min-item {
    display: flex;
    flex-direction: column;
    justify-content: space-between;

    min-height: 100px;
    width: 50%;
    padding: 10px;

    font-size: 16px;

    cursor: pointer;
  }

  .blogs__articles-min-item-date {
    margin-top: 10px;

    color: #ACACAC;
  }

  @media (min-width: 1024px) and (max-width: 1440px) {
    .blogs__wrapper {
      padding: 1.7vw 1.7vw 1.9vw 1.7vw;
    }
  }

  @media(max-width: 1250px) {
    .blogs__articles-big-text {
      font-size: 20px;
    }

    .blogs__articles-min-item {
      font-size: 14px;
    }
  }

  @media(max-width: 1024px) {
    .blogs__container {
      padding-top: 10px;
      padding-bottom: 10px;
    }

    .blogs__wrapper {
      display: flex;
      flex-direction: column;

      max-width: 675px;
      width: 100%;
      margin: 0 auto;
      padding: 15px;
      padding-left: 0;
      padding-right: 0;

      border-top: 2px solid #110F6C;
    }

    .blogs__articles-wrapper {
      flex-direction: column;
    }

    .blogs__articles-min-wrapper {
      display: flex;
      flex-direction: column;
      width: 100%;
    }

    .blogs-tag {
      padding: 0;
      padding-left: 12px;
      margin: 0;

      border: none;
      font-size: 17px;
      color: #939393;
    }

    .blogs__articles-big {
      width: 100%;
      margin-right: 0;
      min-height: 0;
      padding: 12px;
    }

    .blogs__articles-big-text {
      margin-bottom: 20px;
      font-size: 17px;

      font-family: Montserrat-Regular;
    }

    .blogs__articles-min-item {
      width: 100%;
      margin-right: 0;
      min-height: 0;
      padding: 12px;

      border-top: 1px solid #ececec;
    }

    .blogs__articles-min-item-text {
      margin-bottom: 20px;
      
      font-size: 17px;
      font-family: Montserrat-Regular;
    }

    .blogs__articles-big-date,
    .blogs__articles-min-item-date {
      font-family: Montserrat-Regular;
      font-size: 12px;;
    }
  }

  @media(max-width: 500px) {
    .container {
      padding-left: 0;
      padding-right: 0;
    }
  }
</style>