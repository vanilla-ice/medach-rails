<template lang="pug">
  .footer
    .footer__container.container
      .links
        a().links__item
         | О проекте
        a().links__item
         | Команда
        a().links__item
         | Контакты
      .copyright
        | © 2018 Medach
</template>

<script>
  export default {
    
  }
</script>

<style lang="scss" scoped>
  .footer {
    padding-top: 34px;
    padding-bottom: 30px; 

    background: #000;

    font-family: Montserrat-Medium, Helvetica, sans-serif;
    font-size: 16px;
    color: #fff;
  }

  .footer a {
    color: #fff;
  }

  .footer__container {
    flex-direction: column;
  }

  .links__item {
    display: inline-block;
    vertical-align: top;
    margin-right: 41px;
  }

  .copyright {
    display: block;
    margin-top: 64px;
  }

  @media(max-width: 500px) {
    .links {
      display: flex;
      flex-direction: column;
    }

    .links__item {
      padding: 10px 10px 10px 10px;
    }
  }
</style>