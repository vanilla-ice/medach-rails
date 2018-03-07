<template lang="pug">
  .container
    .intresting-wrapper
      .card-title
        | Вам будет интересно!
      .cards
        router-link(to="#").card
        router-link(to="#").card
        router-link(to="#").card
        router-link(to="#").card
</template>

<script>
  export default {
    
  }
</script>

<style lang="scss" scoped>
  .container {
    margin-top: 30px;
  }

  .intresting-wrapper {
    min-height: 500px;
    padding: 40px;
    width: 100%;

    background: #fff;
  }

  .card-title {
    text-align: center;
    font-size: 24px;
    font-family: Montserrat-SemiBold, helvetica;
  }

  .cards {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;

    width: 100%;
    margin-top: 40px;
  }

  .card {
    min-height: 351px;
    max-width: 295px;
    width: 100%;

    border: 2px solid #19DBAB;
  }
</style>