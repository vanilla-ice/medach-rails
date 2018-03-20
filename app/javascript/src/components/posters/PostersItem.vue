<template lang="pug">
  div
    router-link.posters__item(v-for="(post, id) in posts", :key="id", :to="`/post/${post.id}`")
      .posters__item-foto
        .image(:style="{ background: `url(${post.coverImage.url})` }")
        .placeholder
          span MEDACH
      .posters__item-text 
        .posters__item-author
          | {{ post.title }}
        posters-footer(:view="post.views" :author="post.author", :date="post.publicationDate")
</template>

<script>
import PostersFooter from './PostersFooter.vue'
  export default {
    props: ['posts'],

    components: {
      PostersFooter
    },

    mounted() {
      console.log(this.posts)
    }
  }
</script>

<style lang="scss" scoped>
.posters__item {
  display: flex;
  flex-direction: row;
  align-items: stretch;

  background: #fff;
  width: 100%;
  margin-bottom: 10px;

  border-radius: 2px;
  box-shadow: inset 0 0 0 1px rgba(0,0,0,0.15), inset 0 -1px 0 0 rgba(0,0,0,0.2);
}

.posters__item-text {
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

.posters__item-foto {
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