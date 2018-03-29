<template lang="pug">
  .top-blogs.container
    router-link(:to="'blog-post/' + info.pinnedBlogs[0].id").top-blogs__left
      .top-blogs__image( :style="{ backgroundImage:`url(${info.pinnedBlogs[0].coverImage.url})` }")
      .top-blogs__placeholder
      .top-blogs__left-title
        | {{ getTitle(info.pinnedBlogs[0]) }}
      card-footer( :tags="info.pinnedBlogs[0].tags", :view="info.pinnedBlogs[0].views", :author="info.pinnedBlogs[0].author", :date="info.pinnedBlogs[0].publicationDate" )
    .top-blogs__right
      router-link(:to="'blog-post/' + info.pinnedBlogs[1].id").top-blogs__right-card.top-blogs__right-card-1
        .top-blogs__image( :style="{ backgroundImage:`url(${info.pinnedBlogs[1].coverImage.url})`, }")
        .top-blogs__placeholder
        .top-blogs__right-title
          | {{ getTitle(info.pinnedBlogs[1]) }}
        card-footer( :tags="info.pinnedBlogs[1].tags", :view="info.pinnedBlogs[1].views", :author="info.pinnedBlogs[1].author", :date="info.pinnedBlogs[1].publicationDate" )
      router-link(:to="'blog-post/' + info.pinnedBlogs[2].id").top-blogs__right-card.top-blogs__right-card-2
        .top-blogs__image( :style="{ backgroundImage:`url(${info.pinnedBlogs[2].coverImage.url})`, }")
        .top-blogs__placeholder
        .top-blogs__right-title
          | {{ getTitle(info.pinnedBlogs[2]) }}
        card-footer( :tags="info.pinnedBlogs[2].tags", :view="info.pinnedBlogs[2].views" :author="info.pinnedBlogs[2].author", :date="info.pinnedBlogs[2].publicationDate" )
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
        image: false
      }
    },

    methods: {
      getTitle(data) {
        if (data) return data.title
        return "Неизвестно"
      }
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
      z-index: 3;
      pointer-events: none;

      border-radius: 8px;
    }
  }

  .top-blogs__left div {
    position: relative;
    z-index: 4;
  }

  .top-blogs .top-blogs__image {
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    z-index: 2;

    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    border-radius: 8px;
  }

  .top-blogs .top-blogs__placeholder {
    position: absolute;
    z-index: 1;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;

    background-color: #110E9B;
    border-radius: 8px;
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
      z-index: 3;
      pointer-events: none;

      border-radius: 8px;
    }
  }

  .top-blogs__right-card div {
    position: relative;
    z-index: 4;
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

  @media (min-width: 1024px) and (max-width: 1440px) {
    .top-blogs__left {
      min-height: 500/1440 * 100vw;
      padding-top: 40/1440 * 100vw;
      padding-right: 38/1440 * 100vw;
      padding-bottom: 24/1440 * 100vw;
      padding-left: 24/1440 * 100vw;
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

  @media(max-width: 1024px) {
    .top-blogs {
      flex-direction: column;
    }

    .top-blogs__right {
      width: 100%;
      margin-left: 0;
    }

    .top-blogs__left {
      width: 100%;
      max-width: 675px;
      margin: 0 auto;
    }

    .top-blogs__right-card {
      max-width: 675px;
      width: 100%;
    }
  }
</style>