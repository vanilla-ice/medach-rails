<template lang="pug">
  .data
    .data-text
      | {{dayOfTheWeek}} {{date}}
      span.data__circle
</template>

<script>
import moment from 'moment'
import { mapMutations } from 'vuex'

export default {
  props: ['date'],

  data () {
    return {
    }
  },

  mounted () {
  },

  computed: {
    dayOfTheWeek () {
      return moment(this.date, 'DD/MM/YYYY').format('dddd')
    }
  },

  methods: {
    ...mapMutations(['setActiveDate'])
  }
}
</script>

<style scoped lang="scss">
.data {
  display: flex;
  align-items: center;

  margin-bottom: 36px;
  margin-top: 14px;
}


.data-text {
  position: relative;
  display: inline-block;
  margin: 0 auto;

  font-family: LucidaGrande-Bold;
  text-align: center;
  text-transform: uppercase;
}

.data__circle {
  position: absolute;
  left: -20px;
  top: 5px;

  width: 9px;
  height: 9px;
  background: #ff7e7e;
  border-radius: 50%;
}

</style>

