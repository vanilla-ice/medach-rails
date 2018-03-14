<template lang="pug">
  .article-footer
    .article-footer__like
      .article-footer__like-icon
      .article-footer__like-digit
        | {{ view }}
    .article-footer__tag(v-for="tag in tags")
      | {{ tag }}
    .article-footer__date
      | {{ currentDate() }}
</template>

<script>
  import { format } from 'date-fns'
  import ru from 'date-fns/locale/ru'

  export default {
    props: ['tags', 'view', 'date'],

    methods: {
      currentDate() {
        if (this.date) {
          let date = format(this.date, 'MMMM D, YYYY', { locale: ru });
          return date[0].toUpperCase() + date.slice(1);
        }
      }
    }
  }
</script>

<style lang="scss" scoped>
  .article-footer {
    display: flex;
    min-height: 25px;
    align-items: center;

    margin-top: 10px;

    color: #7F7F7F;
    font-family: Montserrat-SemiBold, helvetica;
    font-size: 16px;
  }

  .article-footer__like {
    display: flex;
    align-items: center;

    margin-right: 24px;
  }

  .article-footer__like-icon {
    width: 21px;
    height: 26px;
    margin-right: 5px;

    background: url('../../static/images/fire.png') no-repeat center;
  }

  .article-footer__tag {
    display: inline-block;
    padding: 3px 7px 4px 7px;
    margin-right: 8px;

    font-size: 14px;
    font-family: Montserrat-Medium, helvetica;
    border-radius: 3px;
    border: 1px solid #7F7F7F;
  }

  .article-footer__date {
    flex-shrink: 0;
    width: 170px;
    margin-left: auto;
    
    text-align: right;
  }

  @media(max-width: 1250px) {
    .article-footer {
      font-size: 14px;
    }

    .article-footer__tag {
      font-size: 12px;
    }

    .article-footer__like {
      margin-right: 10px;
    }

    .top-articles__like-icon {
      width: 18px;
      height: 20px;
    }

    .top-articles__date {
      padding-top: 2px;
      width: 130px;
    }
    

    .top-articles__like {
      margin-right: 12px;
    }
  }
</style>