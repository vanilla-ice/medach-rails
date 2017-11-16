<template lang="pug">
  .big-fotos
      router-link(v-for="(post, id) in getPosts", :to="'post/' + post.url", :key="id").main__big-foto.main__big-foto-1
      .main__big-fotos__cloock
        .main__big-fotos__cloock-icon
        .main__big-fotos__cloock-digits
          | 19:10
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
  background-size: cover !important;
}

.big-fotos {
  display: flex;
  background: #f8f8f8;
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


</style>

