<template lang="pug">
  div
    router-link(to="#").in-order__item
      .in-order__item-foto
        .image
        .placeholder
          span MEDACH
      .in-order__item-text 
        .in-order__item-author
          | Пост 
        in-order-footer
    router-link(to="#").in-order__item
      .in-order__item-foto
        .image
        .placeholder
          span MEDACH
      .in-order__item-text 
        .in-order__item-author
          | Пост 
        in-order-footer
    router-link(to="#").in-order__item
      .in-order__item-foto
        .image
        .placeholder
          span MEDACH
      .in-order__item-text 
        .in-order__item-author
          | Пост 
        in-order-footer
</template>

<script>
import InOrderFooter from './InorderFooter.vue'

  export default {
    components: {
      InOrderFooter
    }
  }
</script>

<style lang="scss" scoped>
.in-order__item {
  display: flex;
  flex-direction: row;
  align-items: stretch;

  background: #fff;
  width: 100%;
  margin-bottom: 10px;

  border-radius: 2px;
  box-shadow: inset 0 0 0 1px rgba(0,0,0,0.15), inset 0 -1px 0 0 rgba(0,0,0,0.2);
}

.in-order__item-text {
  display: flex;
  flex-direction: column;
  justify-content: space-between;

  padding: 15px;
  flex-basis: 60%;
  flex-grow: 1;

  color: #515666;
  font-size: 20px;
  line-height: 24px;
  font-family: Montserrat-SemiBold, helvetica;
  overflow: hidden;
}

.in-order__item-foto {
  display: block;

  height: 150px;
  width: 33.3%;
  position: relative;
}

.image {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-size: cover !important;
  background-repeat: no-repeat !important;
  background-position: center !important;
  z-index: 2;
}

.placeholder {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #f8f8f8;
  z-index: 1;

  span {
    font-size: 18px;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    line-height: 24px;
    color: #aaaaaa;
  }
}
</style>