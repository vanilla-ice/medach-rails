<template lang="pug">
  .posters
      .container
        .posters__wrapper
          router-link.posters__item(v-for="(post, id) in posts", :key="id", :to="`/post/${post.id}`")
            .posters__item-foto
              .image(:style="{ background: `url(${post.image.url})` }")
              .placeholder
                span MEDACH
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

.posters__item:nth-child(n+6) {
  margin-top: 4.3%;
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


@media (max-width: 1024px) {
  .posters .container {
    padding: 0 40px;
  }

  .posters__item {
    max-width: initial;
    width: calc(33.3% - 27px);
    margin-right: 0;

    &:not(:nth-child(3n - 2)) {
      margin-left: 40px;
    }

    &:nth-child(n + 4) {
      margin-top: 40px;
    }
  }

  .posters__item-foto {
    width: initial;
    height: 275px;
  }
}

@media (max-width: 767px) {
  .posters__wrapper {
    padding-top: 0;
  }
  .posters__item {
    width: 100%;
    margin-left: 0 !important;
    margin-top: 40px;
  }

  .posters__item-foto {
    height: 370px;
  }

  .posters__item-text {
    font-size: 18px;
    line-height: 22px;
    max-height: 68px;
  }
}

</style>

