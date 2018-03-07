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
  }

</style>