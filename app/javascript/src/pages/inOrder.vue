<template lang="pug">
    div.main-container
      header-component
      main.main-surgery
        in-order-main
</template>

<script>
import HeaderComponent from '../components/Header.vue'
import InOrderMain from '../components/in-order/InOrderMain.vue'

import { mapGetters } from 'vuex'

export default { 
  components: {
    HeaderComponent,
    InOrderMain
  }
}
</script>

<style scoped lang="scss">

</style>

