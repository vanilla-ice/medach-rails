<template lang="pug">
  .cards-container.container
    router-link(to="#").card
      .card-title
        | Лечение рака подорожником
      card-footer(:color="colorBlack")
    router-link(to="#").card
      .card-title
        | Лечение рака подорожником
      card-footer(:color="colorBlack")
    router-link(to="#").card
      .card-title
        | Лечение рака подорожником
      card-footer(:color="colorBlack")
</template>

<script>
  import CardFooter from "./CardFooter.vue"

  export default {
    components: {
      CardFooter
    },

    data() {
      return {
        colorBlack: true
      }
    }
  }
</script>

<style lang="scss" scoped>
  .cards-container {
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;

    margin-top: 30px;
  }

  .card {
    display: flex;
    flex-direction: column;
    justify-content: space-between;

    max-width: 440px;
    width: 100%;
    min-height: 150px;

    padding: 24px 24px 26px 24px;
    background: #fff;

    border-radius: 8px;
  }

  .card-title {
    font-size: 16px;
    font-family: Montserrat-Bold, helvetica;
  }

  @media(max-width: 1440px) {
    .card {
      min-height: 150/1440 * 100vw;

      max-width: 440/1440 * 100vw;
      padding-top: 24/1440 * 100vw; 
      padding-right: 24/1440 * 100vw;
      padding-bottom: 26/1440 * 100vw;
      padding-left: 24/1440 * 100vw;
    }
  }

</style>