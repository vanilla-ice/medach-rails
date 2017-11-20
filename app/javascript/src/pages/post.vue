<template lang="pug" >
  div
    header-component
    main.main.main-description
      .container
        .foto-column
          .foto-column__poster
            lightbox#lightbox(:images="image")
        desc-column(v-if="activePost", :data="activePost.body", :name="activePost.title")
        info-column(v-if="activePost", :info="activePost")
</template>

<script>
import HeaderComponent from '../components/Header.vue'
import DescColumn from '../components/DescColumn.vue'
import InfoColumn from '../components/InfoColumn.vue'
import descColumnBottom from '../components/DescColumnBottom.vue'
import Lightbox from 'vue-simple-lightbox'

import { mapGetters } from 'vuex'

export default {

  data () {
    return {
    }
  },

  computed: {
    ...mapGetters(['activePost']),

    image () {
      return [{
        src: 'https://pp.userapi.com/c639524/v639524204/642d5/xBSPPUBJ9nE.jpg',
      }]
    }
  },

  created () {
    this.$store.commit('getActivePost', {id: this.$route.params.id})
  },

  mounted () {
  },

  components: {
    HeaderComponent,
    DescColumn,
    InfoColumn,
    descColumnBottom,
    Lightbox
  }
}
</script>

<style lang="scss">
  .my-gallery a img {
    width: 100% !important;
  }
</style>

<style scoped lang="scss">
.main-description {
  margin-top: 66px;
  padding-bottom: 56px;
}

.main-description .container {
  display: flex;
  justify-content: space-between;
}

.foto-column {
  max-width: 254.43px;
  width: 100%;
}

.foto-column__poster {
  max-width: 254.43px;
  width: 100%;
  height: 321.17px;

  margin-top: 8px;

  // background: url('../static/images/good-bad.png') no-repeat center / contain;

  img {
    display: block;
    width: 100%;
  }
}
</style>
