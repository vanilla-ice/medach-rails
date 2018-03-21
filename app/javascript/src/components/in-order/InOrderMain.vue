<template lang="pug">
  .in-order
    .container
      .in-order__wrapper
        in-order-item(:info="info")
</template>

<script>
import InOrderItem from './InOrderItem.vue'


export default {
  props: ['info'],

  components: {
    InOrderItem
  },

  data() {
    return {
    }
  },

  methods: {
    getPostDate (date) {
      return moment(date).format('DD.MM.YYYY')
    }
  }
}
</script>

<style lang="scss" scoped>
.in-order {
  min-height: 100vh;
  background: #e0e0e0;
}

.in-order__wrapper {
  max-width: 800px;
  width: 100%;
  margin: 0 auto;
}
</style>