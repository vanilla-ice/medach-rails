<template lang="pug">
  .big-fotos
    router-link(v-for="(post, id) in getPosts" v-if="id < 5 && post.image" :to="'post/' + post.id", :key="id").main__big-foto
      .placeholder
        span MEDACH
      .image(v-if="post.image", :style="{ background: `url(${post.image.url})` }")
</template>

<script>
import { mapMutations } from 'vuex'
import { format } from 'date-fns'
import ru from 'date-fns/locale/ru'

export default {
  props: ['posts'],

  data () {
    return {
    }
  },

  mounted () {
  },

  updated () {
  },

  computed: {    
    dayOfTheWeek () {
      return format(this.day, 'dddd', { locale: ru })
    },

    getPosts () {
      return this.posts
    }
  },

  methods: {
    ...mapMutations(['setActiveDate'])
  }
}
</script>

<style scoped lang="scss">
.main__big-foto {
  display: block;
  width: 20%;
  height: 25vw;
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
    font-size: 28px;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    line-height: 24px;
    color: #aaaaaa;
  }
}

.big-fotos {
  display: flex;
  background: #f8f8f8;
  justify-content: center;
  height: 25vw;
}

.main__big-foto-1 {
  background: url('../static/images/skull.png') no-repeat center;
}

.main__big-foto-2 {
  background: url('../static/images/good-bad.png') no-repeat center;
}

.main__big-foto-3 {
  background: url('../static/images/dies-irae.png') no-repeat center;
}

.main__big-foto-4 {
  background: url('../static/images/diagnosis-logic.png') no-repeat center;
}

.main__big-fotos__cloock {
  width: 20%;
}

.big-fotos__container {
  padding: 0
}

.main__big-fotos__cloock {
  background: #f8f8f8;
}

.main__big-fotos__cloock-icon {
  width: 67.26px;
  height: 67.26px;
  margin: 0 auto;
  margin-top: 94px;
  background: url('../static/images/clock-icon.png') no-repeat center;
  background-size: contain;
}

.main__big-fotos__cloock-digits {
  text-align: center;
  margin-top: 35.6px;
  font-family: LucidaGrande-Bold;
  color: #BEBEBE;
}

@media (max-width: 1024px) {
  .main__big-foto {
    height: 275px;
  }

  .big-fotos {
    height: 275px;
    margin-bottom: 15px;
  }
}


</style>

