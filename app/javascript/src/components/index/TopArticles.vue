
<template lang="pug">
  .top-articles__container.container
    .top-articles__item
      .top-articles__image
        .top-articles__info-name
      .top-articles__text-block
        .top-articles__text
          | Скрининг: в крови
        .top-articles__text-footer
          .top-articles__like
            .top-articles__like-icon
            .top-articles__like-digit
              | 166
          .top-articles__tags
            .top-articles__tag
              | терапия
            .top-articles__tag
              | терапия
            .top-articles__tag
              | терапия
            .top-articles__tag
              | терапия
            .top-articles__tag
              | терапия
          .top-articles__date
            | Ноябрь 19, 2017
    .top-articles__item
      .top-articles__image
        .top-articles__info-name
      .top-articles__text-block
        .top-articles__text
          | Влияние электронных сигаретна сердечно-сосудистую систему
        .top-articles__text-footer
          .top-articles__like
            .top-articles__like-icon
            .top-articles__like-digit
              | 1667
          .top-articles__tag
            | терапия
          .top-articles__date
            | Ноябрь 19, 2017
</template>

<script>
  export default {
    
  }
</script>

<style lang="scss" scoped>
  .top-articles__container {
    justify-content: space-between;
    width: 1440px;

    margin-top: 30px;
  }

  .top-articles__item {
    width: 675px;
    min-height: 500px;
  }

  .top-articles__image {
    min-height: 316px;
    width: 100%;
    background: #6f53ee; 
  }

  .top-articles__text-block {
    display: flex;
    flex-direction: column;
    justify-content: space-between;

    min-height: 184px; 
    padding: 24px;

    background: #fff;
  }

  .top-articles__text {
    font-family: Montserrat-Bold, helvetica;
    font-size: 24px;
  }

  .top-articles__text-footer {
    display: flex;
    min-height: 25px;
    align-items: flex-start;

    margin-top: 53px;

    color: #7F7F7F;
  }

  .top-articles__like {
    display: flex;
    align-items: center;

    margin-right: 24px;
  }

  .top-articles__like-icon {
    width: 21px;
    height: 26px;
    margin-right: 5px;

    background: url('../../static/images/fire.png') no-repeat center;
  }

  .top-articles__like-digit {
    font-size: 16px;
  }

  .top-articles__tag {
    display: inline-block;
    padding: 3px 4px 4px 4px;
    margin-right: 8px;

    font-size: 14px;
    border-radius: 3px;
    border: 1px solid #7F7F7F;
  }

  .top-articles__date {
    flex-shrink: 0;
    width: 150px;
    margin-left: auto;
    
    text-align: right;
  }
</style>