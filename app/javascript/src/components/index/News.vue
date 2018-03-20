<template lang="pug">
  .autors__container.container
    router-link.autors__item.autors__item-1( v-for="(item, id) in info" :key="item.id" v-if="id < 2" :to="'news-post/' + item.id" )
      .autors__image( :style="{ backgroundImage:`url(${item.coverImage.url})` }")
      .autors__placeholder
      .autors__item-text
        | {{ item.title }}
</template> 

<script>
  export default {
    props: ['info']
    
  }
</script>

<style lang="scss" scoped>
  .autors__container {
    justify-content: space-between;
    margin-top: 30px;
  }

  .autors__item {
    position: relative;

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

    &::after {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      bottom: 0;
      right: 0;
      background: #000;
      opacity: 0.5;
      z-index: 3;
      pointer-events: none;

      border-radius: 8px;
    }
  }

  .autors__item div {
    z-index: 4;
  }

  .autors__item .autors__image {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 2;
    background-repeat: no-repeat;
    background-size: cover;

    border-radius: 8px;
  }

  .autors__item .autors__placeholder {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 1;

    border-radius: 8px;

    background: #110E9B;
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
      padding: 24/1440 * 100vw;
    }

    .autors__item-text {
      font-size: 20px;
    }
  }
</style>