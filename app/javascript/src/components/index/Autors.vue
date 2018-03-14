<template lang="pug">
  .autors__container.container
    router-link(to="#").autors__item.autors__item-1
      .autors__item-text
        | Галлюциногенные грибы поделились друг с другом рецептом синтеза психоделиков
      .autors__item-subscribe
        | Подписаться
    router-link(to="#").autors__item.autors__item-2
      .autors__item-text
        | Галлюциногенные грибы поделились друг с другом рецептом синтеза психоделиков
      .autors__item-subscribe
        | Подписаться
</template>

<script>
  export default {
    
  }
</script>

<style lang="scss" scoped>
  .autors__container {
    justify-content: space-between;
    margin-top: 30px;
  }

  .autors__item {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: flex-start;

    max-width: 675px;
    width: 100%;
    min-height: 235px;
    padding: 24px;

    border-radius: 4px;

    cursor: pointer;
  }

  .autors__item-1 {
    background: #4C1876;
  }

  .autors__item-2 {
    background: url('../../static/images/good-bad.png') no-repeat center;
    background-size: cover;
  }

  .autors__item-text {
    font-size: 24px;
    font-family: Montserrat-SemiBold, helvetica;
    color: #fff;
  }

  .autors__item-subscribe {
    display: inline-block;
    padding: 8px 20px 7px 20px;
    border: 2px solid #19DBAB;

    font-size: 16px;
    font-family: Montserrat-Regular, helvetica;
    color: #fff;  
  }

  @media(max-width: 1440px) {
    .autors__item{
      width: 675/1380 * 100%;
      min-height: 235/1440 * 100vw;
    }
  }

  @media(max-width: 1250px) {
    .autors__item {
      padding: 24/1380 * 100%;
    }

    .autors__item-text {
      font-size: 20px;
    }
  }
</style>