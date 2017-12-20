<template lang="pug">
  
  header.header
    loader-component(v-if="isLoading")
    .container
      router-link(to="/").logo
        | MEDACH
      .header__main-nav

        router-link(v-for="tag in popularTags", :to="`/tag/${tag.name}`").main-nav__item
          |{{tag.name.toUpperCase()}}

      .header__wrapper-dop
        .header__serch-wrapper
          label
            form(@submit.prevent="search")
              button.header__search-icon(type="submit")
              input(type="text" class="header__search" name="search" placeholder = "Поиск" v-model="query")
          .header__search-buffer
        a(href="#").header__medach
        .header__socials-wrapper
          a(href="#").header__social.header__socials-vk
          a(href="#").header__social.header__socials-facebook
          a(href="#").header__social.header__socials-telegram
        a(href="#").calendar
          | Календарь
</template>

<script>
import LoaderComponent from './Loader.vue'
import { mapGetters } from 'vuex'

export default {
  data() {
    return {
      query: '',
      isLoading: false
    }
  },

  created() {
    this.$store.dispatch('getTagsCount').then(() => console.log('popularTags', this.popularTags))
  },

  methods: {
    search(e) {
      this.isLoading = true
      this.$store.dispatch('search', this.query).then(() => 
        setTimeout(() => {
          this.$router.push('/search')
          this.isLoading = false
        })
      )
    }
  },

  computed: {
    ...mapGetters(['popularTags'])
  },

  components: {
    LoaderComponent
  }
}
</script>

<style scoped lang="scss">
.header {
  min-height: 62px;
  font-family: LucidaGrande-Bold;
}

.header .container {
  display: flex;
  justify-content: space-between;
  align-items: center;

  max-width: 1280px;
  width: 100%;

  min-height: 62px;

}

.header__main-nav {
  position: relative;

  display: flex;
  flex-direction: row;
  justify-content: flex-start;

  max-width: 694px;
  width:  100%;

  font-size: 10px;
}

.main-nav__item {
  position: relative;

  display: inline-block;

  &::before {
    content: '#';
  }

  &:not(:first-child) {
    margin-left: 5px;
  }
}

.main-nav__item.main-nav__item::after {
  content: '';
  position: absolute;
  opacity: 0;
  left: 0;
  bottom: -2px;

  width: 100%;
  height: 1px;
  background: #505666;
}

.main-nav__item:hover.main-nav__item::before {
  opacity: 1;
}

.header__wrapper-dop {
  display: flex;
  justify-content: space-between;
  align-items: center;

  max-width: 350px;
  width: 100%;
}

.header__serch-wrapper {
  width: 122px;
}

.header__serch-wrapper label {
  display: flex;
  align-items: center;
}

.header__search {
  width: 52px;
  min-width: 52px;
  max-width: 140px;

  border: none;

  font-size: 10px;

  outline: none;
}

.header__search:focus {
  border-bottom: 0.5px solid #0ea4fb;
}

.header__search-buffer {
  position: absolute;
  top: -1000px;
  left: -1000px;
  visibility: hidden;
  white-space: nowrap;
  font-size: 10px;
}

.header__search-icon {
  flex-shrink: 0;

  display: block;
  width: 13px;
  height: 13px;

  margin-right: 8px;
  margin-left: auto;

  background: url('../static/images/search.png') no-repeat center;
  background-size: contain;
}

  .header__socials-wrapper {
  display: flex;
  justify-content: space-between;
  margin-right: 20px;
}

.header__social {
  display: block;
  width: 15px;
  height: 14px;

  margin: 0 5px;
}

.header__socials-vk {
  background: url('../static/images/vk.png') no-repeat center;
}

.header__socials-facebook {
  background: url('../static/images/facebook.png') no-repeat center;
}

.header__socials-telegram {
  background: url('../static/images/telegram.png') no-repeat center;
}

.calendar {
  position: relative;
  font-size: 10px;
}

.calendar::before {
  content: '';
  position: absolute;
  opacity: 0;
  left: 0;
  bottom: -2px;

  width: 100%;
  height: 1px;
  background: #505666;
}

.calendar:hover::before {
  opacity: 1;
}

.header__medach {
  width: 46px;
  height: 7px;
  background: url('../static/images/medach.png') no-repeat center;
  background-size: contain;
}

.logo {
  font-size: 24px;
}

form {
  display: flex;
  width: 100%;
}

button {
  border: none;
  outline: none;
  cursor: pointer;
}

input {
  flex: 1 1 auto;
}

</style>

