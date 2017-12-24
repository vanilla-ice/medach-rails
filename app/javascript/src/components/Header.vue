<template lang="pug">
  
  header.header
    loader-component(v-if="isLoading")
    .container
      .left
        .logo(@click="closeMenu")
          | MEDACH
        .header__main-nav.only-desktop

          router-link(v-for="(tag, id) in popularTags" v-if="id < 8" , :to="`/tag/${tag.name}`").main-nav__item
            |{{tag.name.toUpperCase()}}

      .right.only-desktop
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
      
      .burger.only-mobile(@click="toggleMenu")
        #nav-icon3(:class="{open: isOpen}")
          span
          span
          span
          span
    
    .menu-page(:class="{visible: isOpen}")

      .search
        label
          form(@submit.prevent="search")
            button.header__search-icon(type="submit")
            input(type="text" class="header__search" name="search" placeholder = "Поиск" v-model="query")

      .tags
        .main-nav__item(v-for="(tag, id) in popularTags" v-if="id < 8" @click="goToTag(tag.name)")
          | {{tag.name.toUpperCase()}}

      .social
        .header__socials-wrapper
          a(href="#").header__social.header__socials-vk
          a(href="#").header__social.header__socials-facebook
          a(href="#").header__social.header__socials-telegram

</template>

<script>
import LoaderComponent from './Loader.vue'
import { mapGetters } from 'vuex'

export default {
  data() {
    return {
      query: '',
      isLoading: false,
      isOpen: false
    }
  },

  created() {
    this.$store.dispatch('getTagsCount')
  },

  methods: {
    search(e) {
      this.isLoading = true
      this.$store.dispatch('search', this.query).then(() => 
        setTimeout(() => {
          document.querySelector('#app').style.overflow = 'initial'
          this.isOpen = false
          this.$router.push('/search')
          this.isLoading = false
        })
      )
    },

    toggleMenu() {
      this.isOpen = !this.isOpen

      if (this.isOpen) {
        document.querySelector('#app').style.overflow = 'hidden'
        document.querySelector('#app').style.maxHeight = '100vh'
      }
      else {
        document.querySelector('#app').style.overflow = 'initial'
        document.querySelector('#app').style.maxHeight = 'initial'
      }
    },

    closeMenu() {
      this.isOpen = false
      document.querySelector('#app').style.overflow = 'initial'
      document.querySelector('#app').style.maxHeight = 'initial'
      this.$router.push('/')
    },

    goToTag(tag) {
      this.isOpen = false;
      document.querySelector('#app').style.overflow = 'initial'
      document.querySelector('#app').style.maxHeight = 'initial'
      this.$router.push(`/tag/${tag}`)
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
  z-index: 10;
  padding: 10px 0;
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
  flex-flow: row nowrap;
  justify-content: flex-start;
  overflow: hidden;
  white-space: nowrap;

  max-width: 753px;
  width:  100%;

  font-size: 10px;
  margin-left: 40px;
}

.main-nav__item {
  position: relative;

  display: inline-block;
  white-space: nowrap;

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

.main-nav__item:hover.main-nav__item::after {
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
}

.header__social {
  display: block;
  width: 15px;
  height: 14px;

  margin: 0 5px;
}

.header__socials-vk {
  background: url('../static/images/vk.svg') no-repeat center / contain;
}

.header__socials-facebook {
  background: url('../static/images/facebook.svg') no-repeat center / contain;
}

.header__socials-telegram {
  background: url('../static/images/telegram.svg') no-repeat center / contain;
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
  margin-right: 15px;
}

.logo {
  font-size: 24px;
  z-index: 20;
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

.left,
.right {
  display: flex;
  flex-flow: row nowrap;
  align-items: center;
}

.only-mobile {
  display: none;
}

.burger {
  opacity: .7;
  height: 22px;
  z-index: 20;

  img {
    display: block;
    width: 100%;
    height: 100%;
  }
}

#nav-icon3 {
  width: 27px;
  height: 22px;
  position: relative;
  -webkit-transform: rotate(0deg);
  -moz-transform: rotate(0deg);
  -o-transform: rotate(0deg);
  transform: rotate(0deg);
  -webkit-transition: .5s ease-in-out;
  -moz-transition: .5s ease-in-out;
  -o-transition: .5s ease-in-out;
  transition: .5s ease-in-out;
}

#nav-icon3 span {
  display: block;
  position: absolute;
  height: 2px;
  width: 100%;
  background: #000;
  opacity: 1;
  left: 0;
  -webkit-transform: rotate(0deg);
  -moz-transform: rotate(0deg);
  -o-transform: rotate(0deg);
  transform: rotate(0deg);
  -webkit-transition: .25s ease-in-out;
  -moz-transition: .25s ease-in-out;
  -o-transition: .25s ease-in-out;
  transition: .25s ease-in-out;
}

#nav-icon3 span:nth-child(1) {
  top: 0px;
}

#nav-icon3 span:nth-child(2),#nav-icon3 span:nth-child(3) {
  top: 7px;
}

#nav-icon3 span:nth-child(4) {
  top: 14px;
}

#nav-icon3.open span:nth-child(1) {
  top: 7px;
  width: 0%;
  left: 50%;
}

#nav-icon3.open span:nth-child(2) {
  -webkit-transform: rotate(45deg);
  -moz-transform: rotate(45deg);
  -o-transform: rotate(45deg);
  transform: rotate(45deg);
}

#nav-icon3.open span:nth-child(3) {
  -webkit-transform: rotate(-45deg);
  -moz-transform: rotate(-45deg);
  -o-transform: rotate(-45deg);
  transform: rotate(-45deg);
}

#nav-icon3.open span:nth-child(4) {
  top: 7px;
  width: 0%;
  left: 50%;
}

.menu-page {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100vh;
  background: #fff;
  opacity: 0;
  transition: opacity .2s ease;
  will-change: opacity;
  pointer-events: none;
  z-index: 10;
  padding-top: 82px;
}

.visible {
  opacity: 1;
  pointer-events: initial;
}

.search {
  position: absolute;
  left: 180px;
  top: 31px;

  input {
    font-size: 18px;
    width: 50vw;
    max-width: initial;
  }

  button {
    transform: translateY(37%);
  }
}

.tags {
  padding: 0 30px;
  display: flex;
  flex-flow: column nowrap;
  text-align: center;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);

  .main-nav__item:not(:first-child) {
    margin-left: 0;
    margin-top: 30px;
  }

  .main-nav__item {
    font-size: 20px;
  }
}

.social {
  position: absolute;
  bottom: 30px;
  right: 30px;

  .header__social {
    width: 27px;
    height: 27px;
    margin: 0 10px;
  }

  .header__socials-facebook {
    height: 22px;
    margin-top: 2px;
  }
}

@media (max-width: 1024px) {
  .only-desktop {
    display: none;
  }

  .only-mobile {
    display: block;
  }

  .header {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    background: #fff;
    box-shadow: 0px 0px 3px 0px rgba(0, 0, 0, 0.1);

    .container {
      padding: 0 40px;
    }
  }
}

</style>

