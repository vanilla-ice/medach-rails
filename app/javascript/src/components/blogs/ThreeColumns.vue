<template lang="pug">
  .cards-container.container
    router-link.card(v-for="(item, id) in info" :key="item.id" v-if="id < 3" :to="'blog-post/' + item.id")
      .card-title
        | {{ item.title }}
      card-footer(:color="colorBlack" :tags="item.tags" :view="item.views" :author="item.author" :date="item.publicationDate")
</template>

<script>
  import CardFooter from "./CardFooter.vue"

  export default {
    props: ['info'],

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

    padding-top: 15px;
    padding-bottom: 15px;
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
    margin-bottom: 15px;

    font-size: 16px;
    font-family: Montserrat-Bold, helvetica;
  }

  @media (min-width: 1024px) and (max-width: 1440px) {
    .card {
      min-height: 150/1440 * 100vw;

      max-width: 440/1440 * 100vw;
      padding-top: 24/1440 * 100vw; 
      padding-right: 24/1440 * 100vw;
      padding-bottom: 26/1440 * 100vw;
      padding-left: 24/1440 * 100vw;
    }
  }

  @media(max-width: 1024px) {
    .cards-container {
      flex-direction: column;
      justify-content: flex-start;

      padding-top: 10px;
      padding-bottom: 10px;
    }

    .card {
      border-radius: 0;
      max-width: 675px;
      margin: 0 auto;
      border-top: 1px solid #ececec;
    }
  }

  @media(max-width: 500px) {
    .cards-container {
      padding-left: 0;
      padding-right: 0;
    }

    .card {
      padding: 15px;
    }
  }
</style>