<template lang="pug">
  .top-blogs.container
    router-link(to="#").top-blogs__left( :style="{ backgroundImage:`url(${info.pinnedBlogs[0].coverImage.url})` }")
      .top-blogs__left-title
        | {{ info.pinnedBlogs[0].title }}
      card-footer( :tags="info.pinnedBlogs[0].tags", :view="info.pinnedBlogs[0].views", :author="info.pinnedBlogs[0].author", :date="info.pinnedBlogs[0].publicationDate" )
    .top-blogs__right
      router-link(to="#").top-blogs__right-card.top-blogs__right-card-1( :style="{ backgroundImage:`url(${info.pinnedBlogs[1].coverImage.url})`, }")
        .top-blogs__right-title
          | {{ info.pinnedBlogs[1].title }}
        card-footer( :tags="info.pinnedBlogs[1].tags", :view="info.pinnedBlogs[1].views", :author="info.pinnedBlogs[1].author", :date="info.pinnedBlogs[1].publicationDate" )
      router-link(to="#").top-blogs__right-card.top-blogs__right-card-2( :style="{ backgroundImage:`url(${info.pinnedBlogs[2].coverImage.url})` }")
        .top-blogs__right-title
          | {{ info.pinnedBlogs[2].title }}
        card-footer( :tags="info.pinnedBlogs[2].tags", :view="info.pinnedBlogs[2].views" :author="info.pinnedBlogs[2].author", :date="info.pinnedBlogs[2].publicationDate" )
</template>

<script>
  import CardFooter from "./CardFooter.vue"

  export default {
    props: ['info'],

    components: {
      CardFooter
    },

    mounted() {
      console.log('props', this.info)
    }
  }
</script>

<style lang="scss" scoped>
  .top-blogs__left {
    position: relative;

    display: flex;
    flex-direction: column;
    justify-content: space-between;
    flex-basis: 50%;

    width: 50%;
    min-height: 500px;
    padding: 40px 38px 24px 24px;

    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;

    border-radius: 8px;

    &::after {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      bottom: 0;
      right: 0;
      background: #000;
      opacity: 0.5;
      z-index: 1;
      pointer-events: none;

      border-radius: 8px;
    }
  }

  .top-blogs__left div {
    position: relative;
    z-index: 2;
  }

  .top-blogs__left-title {
    font-family: Montserrat-Bold, Helvetica;
    color: #fff;
    font-size: 24px;
  }

  .top-blogs__right {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    flex-basis: 50%;
    
    margin-left: 30px;
    width: 50%;

    min-height: 500px;
  }

  .top-blogs__right-title {
    padding-right: 24px;

    text-align: right;
    font-family: Montserrat-Bold, Helvetica;
    color: #fff;
    font-size: 18px;
  }

  .top-blogs__right-card {
    position: relative;

    display: flex;
    flex-direction: column;
    justify-content: space-between;

    width: 100%;
    min-height: 235px;
    padding: 40px 24px 24px;

    &::after {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      bottom: 0;
      right: 0;
      background: #000;
      opacity: 0.5;
      z-index: 1;
      pointer-events: none;

      border-radius: 8px;
    }
  }

  .top-blogs__right-card div {
    position: relative;
    z-index: 2;
  }

  .top-blogs__right-card-1 {
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;

    border-radius: 8px;
  }

  .top-blogs__right-card-2 {
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;

    border-radius: 8px;
  }

  @media(max-width: 1440px) {
    .top-blogs__left {
      min-height: 500/1440 * 100vw;
      padding-top: 40/1440 * 100%;
      padding-right: 38/1440 * 100%;
      padding-bottom: 24/1440 * 100%;
      padding-left: 24/1440 * 100%;
    }

    .top-blogs__right {
      min-height: 500/1440 * 100vw;
      margin-left: 30/1440 * 100vw;
    }

    .top-blogs__right-card {
      min-height: 235/1440 * 100vw;;
      padding-top: 40/1440 * 100vw;
      padding-right: 24/1440 * 100vw;
      padding-left: 24/1440 * 100vw;
      padding-bottom: 24/1440 * 100vw;
    }
  }

  @media(max-width: 1250px) {
    .top-blogs__left-title {

    }
  }
</style>