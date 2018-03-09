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

  @media (min-width: 1024px) and (max-width: 1440px) {
    .intresting-wrapper {
      min-height: 500/1440 * 100vw;
      padding: 40/1440 * 100vw;
    }

    .cards {
      margin-top: 40/1440 * 100vw;
    }

    .card {
      min-height: 351/1440 * 100vw;
      max-width: 295/1440 * 100vw;
    }
  }
</style>