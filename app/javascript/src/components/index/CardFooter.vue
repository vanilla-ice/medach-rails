<template lang="pug">
  .article-footer
    .article-footer__like
      .article-footer__like-icon
      .article-footer__like-digit
        | {{ view }}
    .article-footer__tag(v-for="tag in tags")
      | {{ tag }}
    .article-footer__date
      | Ноябрь 19, 2017
</template>

<script>
  export default {
    props: ['tags', 'view']

  }
</script>

<style lang="scss" scoped>
  .article-footer {
    display: flex;
    min-height: 25px;
    align-items: center;

    margin-top: 10px;

    color: #7F7F7F;
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
    border-radius: 3px;
    border: 1px solid #7F7F7F;
  }

  .article-footer__date {
    flex-shrink: 0;
    width: 141px;
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