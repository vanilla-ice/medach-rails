<template lang="pug">
  .container
    .article__wrapper
      .article
        .article-title
          | {{ getContent(title) }}
        .article-info__wrapper
          .article-info(v-if="postInfo")
            .article-info__item.publishing(v-if="postInfo.origin")
              div
                | Оригинал:
              a(:href="getContent(postInfo.origin)")
                | {{ getContent(postInfo.origin) }}
            .article-info__item.author(v-if="postInfo.author")
              div Автор:
              div {{  getContent(postInfo.author) }}
            .article-info__item.transfer(v-if="postInfo.translate")
              div Перевод:
              div {{  getContent(postInfo.translate) }}
            .article-info__item.revision(v-if="postInfo.redaction")
              div Редакция:
              div {{ getContent(postInfo.redaction) }}
            .article-info__item.cover(v-if="postInfo.infographic")
              div Оформление:
              div {{ getContent(postInfo.infographic) }}
            .article-info__item.tags(v-if="postInfo.tags && this.postInfo.tags.length > 0")
              div Теги:
              router-link.tag(v-for="(item, index) in postInfo.tags" :to="`/tag/${item}`") 
                | {{ item }}
          .date
            | {{ getCurrentDate() }}
        .article__content(ref="postData")
          img.article__cover-image(v-if="coverImage" :src="coverImage" )
          .article__content-text(v-html="post")
      .preview(v-if="currentImg")
        .preview-wrapper
          .opacity(@click="close")
          .christ(@click="close") +
          img(:src="currentImg")
</template>

<script>
  import { format } from 'date-fns'
  import ru from 'date-fns/locale/ru'

  export default {

    props: ['title', 'coverImage', 'date', 'post', 'postInfo'],

    data() {
      return {
        currentImg: null
      }
    },

    mounted() {
      const images = Array.from(this.$refs.postData.querySelectorAll('img'))
      images.map(img => {
        img.addEventListener('click', (evt) => {
          this.renderPreviewImage(img)
        })
      })
    },

    methods: {
      renderPreviewImage(image) {
        this.currentImg = image.getAttribute('src')
        document.body.classList.add('scroll-del')
      },
      close() {
        document.body.classList.remove('scroll-del')
        this.currentImg = null;
      },

      getContent(data) {
        if (data) return data
        return ""
      },

      getCurrentDate() {
        if (this.date) {
          let date = format(this.date, 'MMMM D, YYYY', { locale: ru });
          return date[0].toUpperCase() + date.slice(1);
        }
        return ""
      },

      getTags() {
        return this.postInfo.tags.join(', '); 
      }
    },

    beforeDestroy() {
      const images = Array.from(this.$refs.postData.querySelectorAll('img'))
      images.map(img => {
        img.removeEventListener('click', () => this.renderPreviewImage(img))
      })
    }
  }


</script>

<style lang="scss">
  .article__content {
    font-family: PTSerif-Regular, helvetica;
  }

  .article__content img {
    width: 100%;
    height: 100%;
    cursor: pointer;
  }

  .article__content-text img {
    margin: 10px 0;
    padding: 0 25px;
  }

  .article__content-text {
    font-size: 18px;

    line-height: 1.5em;
  }

  .article__content-text  a {
    color: #00C;
  }

  .article__content-text p {
    margin: 15px 0;
    font-size: 18px;

    line-height: 1.5em;
  }

  .article__content-text p span {
    display: inline-block;
    vertical-align: top;

    font-size: 18px;

    line-height: 1.5em;
  }

  .article__content-text span {
    display: inline-block;
    
    font-size: 18px;
    line-height: 1.5em;
  }

  .article__content i {
    font-family: PTSerif-Regular, helvetica;
  }

  .scroll-del {
    overflow: hidden !important;
  }

  @media(max-width: 500px) {
    .article__content-text img {
      padding: 0 5px; 
    }
  }
</style>

<style lang="scss" scoped>
  .article__wrapper {
    max-width: 1380px;
    width: 100%;
    margin: 0 auto;
    padding: 40px 30px 90px 150px;


    background: #fff;
    border-radius: 8px;
  }

  .article {
    max-width: 700px;
    width: 100%;
  }

  .article-title {
    font-family: PTSerif-Regular, helvetica;
    font-size: 30px;
  }

  .article-info__wrapper {
    display: flex;
    justify-content: space-between;
    padding-top: 40px;
    padding-bottom: 40px;

    font-size: 16px;
    font-family: PTSerif-Regular, helvetica;
    color: #ACACAC;
  }

  .article-info {
    max-width: 530px;
    width: 100%;
  }

  .article-info__item {
    display: flex;
    flex-wrap: wrap;
    margin-bottom: 5px;
  }

  .article-info__item:last-child {
    margin-bottom: 0;
  }

  .article-info__item div:first-child {
    margin-right: 8px;
  }

  .tag {
    margin-right: 7px;
    color: #505666;
  }

  .date {
    max-width: 170px;
    width: 100%;
    text-align: right;
    margin-top: auto;

    font-family: Montserrat-Regular, helvetica;
  }

  .content-header {
    font-family: Montserrat-Medium, helvetica;
    font-size: 22px;
  }

  .content-header__image {
    width: 100%;
  }

  .content-header p {
    margin-top: 24px;
    padding-left: 23px;
    padding-right: 23px;
  }

  .content-header .content-header__title {
    margin-top: 40px;
    font-size: 26px;
  }

  .publishing a {
    color: #505666;
  }

  .article__cover-image {
    margin-bottom: 40px;
  }

  .img-info {
    margin-top: 20px;
  }

  .preview {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100vh;
    background: rgba(255, 255, 255, 0.7);
    z-index: 3000;

    overflow: auto;

    img {
      position: relative;
      max-width: 92%;
      display: block;
      margin: 0 auto;
      z-index: 5;
    }
  }

  .preview-wrapper {
    margin: 30px auto;
  }

  .opacity {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 2;
  }
  .christ {
    position: absolute;
    top: 5px;
    right: 17px;
    font-size: 40px;
    font-family: sans-serif;
    transform: rotate(45deg);
    cursor: pointer;
    z-index: 10;
  }

  @media (max-width: 1024px) {
    .article__wrapper {
      padding-left: 30px;
      padding-right: 30px;
    }
  }

  @media(max-width: 700px) {
    .article-info__wrapper {
      flex-direction: column;
      justify-content: flex-start;
    }

    .date {
      margin-top: 15px;
      text-align: left;
    }
  }

  @media(max-width: 500px) {
    .article__wrapper {
      padding-left: 10px;
      padding-right: 10px;
      padding-top: 30px;
      padding-bottom: 40px;
    }
  }
</style>