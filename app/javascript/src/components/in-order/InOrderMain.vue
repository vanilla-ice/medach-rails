<template lang="pug">
  .in-order
    .container
      .in-order__wrapper
        bouncing-loader(v-if='isLoadingInOrder')
        in-order-item(:info="info")
        bouncing-loader(v-if='bouncing')
</template>

<script>
import InOrderItem from './InOrderItem.vue'
import BouncingLoader from '../BouncingLoader.vue'


export default {
  props: ['info', 'bouncing', 'isLoadingInOrder'],

  components: {
    InOrderItem,
    BouncingLoader,
    LoaderComponent: () => import('../Loader.vue')
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