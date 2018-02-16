<template lang="pug" >
  div.main-container
    header-component
    main.main-surgery
      posters-component(:posts="posts")
</template>
<script>
import HeaderComponent from '../components/Header.vue'
import PostersComponent from '../components/Posters.vue'

import { mapGetters } from 'vuex'

export default {
  data () {
    return {
    }
  },

  created () {
    
  },

  mounted () {
  },

  computed: {
    ...mapGetters(['posts'])
  },

  components: {
    HeaderComponent,
    PostersComponent
  }
}
</script>

<style scoped lang="scss">
  .main-surgery {
  padding-bottom: 56px;
}

.main-surgery__title {

  text-align: center;

  font-family: LucidaGrande-Bold;
  font-size: 36px;
  line-height: 43px;
  max-width: 800px;
  text-overflow: ellipsis;
  overflow: hidden;
  margin: 96px auto 76px auto;
}


.main-surgery .container {
  padding: 0 115px;
}

@media (max-width: 1024px) {
  .main-container {
    margin-top: 115px;
  }
}
</style>
