<template lang="pug">
  header.header
    .container
      router-link(to="/").logo
        img(src="../static/images/logo.png")
      .header__main-nav
        router-link(to="/tag/surgery").main-nav__item
          | #ХИРУРГИЯ
        router-link(to="/tag/therapy").main-nav__item
          | #ТЕРАПИЯ
        router-link(to="/tag/ophthalmology").main-nav__item
          | #ОФТАЛЬМОЛОГИЯ
        router-link(to="/tag/cardiology").main-nav__item
          | #КАРДИОЛОГИЯ
        router-link(to="/tag/education").main-nav__item
          | #ОБРАЗОВАНИЕ
        router-link(to="/tag/crispr").main-nav__item
          | #CRISPR
        router-link(to="/tag/neurosurgery").main-nav__item
          | #НЕЙРОХИРУРГИЯ
      .header__wrapper-dop
        .header__serch-wrapper
          label
            span.header__search-icon
            input(type="text" class="header__search" name="search" placeholder = "Поиск")
          .header__search-buffer
        a(href="#").header__medach
        .header__socials-wrapper
          a(href="#").header__social.header__socials-vk
          a(href="#").header__social.header__socials-facebook
          a(href="#").header__social.header__socials-telegram
        a(href="#").calendar
          | Календарь
</template>

<style scoped >
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
  justify-content: space-between;

  max-width: 694px;
  width:  100%;

  font-size: 10px;
}

.main-nav__item {
  position: relative;

  display: inline-block;
}

.main-nav__item.main-nav__item::before {
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

</style>

