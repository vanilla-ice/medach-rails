<template lang="pug">
  .blogs__container.container
    .blogs__wrapper
      .blogs-tag
        | БЛОГИ
      .blogs__articles-wrapper
        router-link(:to=" 'blog-post/' + info.pinnedBlogs[0].id ").blogs__articles-big
          .blogs__articles-big-text
            | {{ info.pinnedBlogs[0].title }}
          .blogs__articles-big-date
            | {{ currentDate(info.pinnedBlogs[0].publicationDate) }}  
        .blogs__articles-min-wrapper
          router-link(v-for="(item, id) in info.pinnedBlogs" v-if="id > 0 && id < 5" :key="id" :to=" 'blog-post/' + item.id ").blogs__articles-min-item
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
    margin-top: 30px;
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

  @media(max-width: 1440px) {
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
</style>