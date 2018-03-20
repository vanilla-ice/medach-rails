<template lang="pug">
  div.card-footer
    .name
      | Имя
    .card-info
      .icon
      .liks
        | 89
      .date
        | Дата
</template>

<script>
  export default {
    
  }
</script>

<style lang="scss" scoped>
  .card-footer {
    display: flex;
    justify-content: space-between; 
    align-items: center;
    width: 100%;

    font-size: 14px;
    font-family: Montserrat-SemiBold, helvetica;
  }

  .card-footer.color-black {
    color: #000;
  }

  .color-black .liks {
    color: #7F7F7F;
  }

  .color-black .date {
    color: #7F7F7F;
  }

  .card-info {
    display: flex;
    align-items: center;
  }

  .icon {
    width: 21px;
    height: 26px;
    margin-right: 5px;

    background: url('../../static/images/fire.png') no-repeat center;
  }

  .date {
    display: flex;
    align-items: center;

    margin-left: 26px;
  }

  .name {
    font-family: Montserrat-Medium, helvetica;
  }
</style>