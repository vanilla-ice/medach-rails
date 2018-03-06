
<template lang="pug">
  .top-articles__container.container
    .top-articles__item
      .top-articles__image.top-articles__image-1
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
          .top-articles__date
            | Ноябрь 19, 2017
    .top-articles__item
      .top-articles__image.top-articles__image-2
        .top-articles__info-name
      .top-articles__text-block
        .top-articles__text
          | Влияние электронных сигарет на сердечно-сосудистую систему
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

    background: url('../../static/images/dies-irae.png') no-repeat center;
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

  .top-articles__text-footer {
    display: flex;
    min-height: 25px;
    align-items: flex-start;

    margin-top: 53px;

    color: #7F7F7F;
    font-size: 16px;
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

  .top-articles__tag {
    display: inline-block;
    padding: 3px 7px 4px 7px;
    margin-right: 8px;
    margin-bottom: 5px;

    font-size: 14px;
    border-radius: 3px;
    border: 1px solid #7F7F7F;
  }

  .top-articles__date {
    flex-shrink: 0;
    width: 150px;
    margin-left: auto;
    padding-top: 4px;
    
    text-align: right;
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

    .top-articles__text-footer {
      margin-top: 10px;
    }
  }
  @media(max-width: 1250px) {
    .top-articles__text {
      font-size: 20px;
    }

    .top-articles__text-footer {
      font-size: 14px;
    }

    .top-articles__tag {
      font-size: 12px;
    }

    .top-articles__like-icon {
      width: 18px;
      height: 20px;
    }

    .top-articles__date {
      padding-top: 2px;
    }

    .top-articles__date {
      width: 130px;
    }

    .top-articles__like {
      margin-right: 12px;
    }
  }
</style>