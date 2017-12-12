<template lang="pug">
  .posters
      .container
        .posters__wrapper
          router-link.posters__item(v-for="(post, id) in posts", :key="id", :to="`/post/${post.id}`")
            a(href="#", :style="{ background: `url(${post.image.url})` }").posters__item-foto
            .posters__item-text
              | {{ post.shorttext }}
</template>

<script>
import moment from 'moment'

export default {
  props: ['posts'],

  data () {
    return {
    }
  },

  mounted () {
  },

  computed: {
  },

  methods: {
    getPostDate (date) {
      return moment(date).format('DD.MM.YYYY')
    }
  }
}
</script>

<style scoped lang="scss">
.posters__item {
  display: inline-block;
  vertical-align: top;

  max-width: 167px;
  width: 100%;
  margin-right: 4.3%;
}

.posters__item:nth-child(n+5) {
  margin-right: 0;
}

.posters__item-text {
  color: #515666;
  font-size: 12px;
  line-height: 14px;
  max-height: 43px;
  overflow: hidden;
}

.posters__item-foto {
  display: block;

  height: 219px;
  width: 167px;
  margin-bottom: 10px;

  background-size: cover !important;
  background-repeat: no-repeat !important;
  background-position: center !important;
}

.posters__item-foto-1 {
  background: url('../static/images/vaccine-wars.jpg') no-repeat center;
  background-size: contain;
}

.posters__item-foto-2 {
  background: url('../static/images/vaccine.jpg') no-repeat center;
  background-size: contain;
}

.posters__item-foto-3 {
  background: url('../static/images/mouth.jpg') no-repeat center;
  background-size: contain;
}

.posters__item-foto-4 {
  background: url('../static/images/pain.jpg') no-repeat center;
  background-size: contain;
}

.posters__item-foto-5 {
  background: url('../static/images/stress-brain.jpg') no-repeat center;
  background-size: contain;
}

.posters__item-foto-6 {
  background: url('../static/images/mikrobiom-intestines.jpg') no-repeat center;
  background-size: contain;
}

.posters__item-foto-7 {
  background: url('../static/images/darkside.jpg') no-repeat center;
  background-size: contain;
}

.posters__item-foto-8 {
  background: url('../static/images/womb.jpg') no-repeat center;
  background-size: contain;
}

.posters__item-foto-9 {
  background: url('../static/images/crisp.jpg') no-repeat center;
  background-size: contain;
}

.posters__item-foto-10 {
  background: url('../static/images/nay_2.jpg') no-repeat center;
  background-size: contain;
}

.posters__item-foto-11 {
  background: url('../static/images/scince-rich.jpg') no-repeat center;
  background-size: contain;
}

.posters__item-foto-12 {
  background: url('../static/images/eye.jpg') no-repeat center;
  background-size: contain;
}

.posters__wrapper {
  padding-top: 27px;
  padding-bottom: 18px;
}

.posters__item-data {
  position: relative;

  display: inline-block;
  margin-bottom: 12px;

  font-family: LucidaGrande-Bold;
  font-size: 12px;
  line-height: 15px;
}

.posters__item-data::after {
  content: '';
  position: absolute;
  height: 9px;
  width: 9px;
  background-color: #0EA4FB;
  border-radius: 50%;
  right: -15px;
  top: 3px;
}

.main-surgery .container {
  padding: 0 115px;
}

</style>

