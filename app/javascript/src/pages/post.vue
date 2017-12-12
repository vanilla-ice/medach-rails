<template lang="pug" >
  div
    loader-component(v-if="isLoading")
    header-component
    main.main.main-description
      .container
        .foto-column
          .foto-column__poster(v-if="image[0].src")
            lightbox#lightbox(:images="image")
          .placeholder(v-if="!image[0].src")
            span
              | MEDACH
        desc-column(v-if="activePost", :data="activePost.body", :name="activePost.title")
        info-column(v-if="activePost", :info="activePost")
</template>

<script>
import HeaderComponent from '../components/Header.vue'
import DescColumn from '../components/DescColumn.vue'
import InfoColumn from '../components/InfoColumn.vue'
import descColumnBottom from '../components/DescColumnBottom.vue'
import Lightbox from 'vue-simple-lightbox'
import LoaderComponent from '../components/Loader.vue'


import { mapGetters } from 'vuex'

export default {

  data () {
    return {
      isLoading: true
    }
  },

  computed: {
    ...mapGetters(['activePost']),

    image () {
      return [{
        src: this.activePost ? this.activePost.image.url : null,
      }]
    }
  },

  mounted () {
    this.$store.dispatch('getActivePost', {id: this.$route.params.id}).then(() => setTimeout(() => this.isLoading = false, 300))
  },

  components: {
    HeaderComponent,
    DescColumn,
    InfoColumn,
    descColumnBottom,
    Lightbox,
    LoaderComponent
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
  position: relative;
  min-height: 321px;
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
</style>
