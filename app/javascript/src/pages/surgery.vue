<template lang="pug" >
  div
    header-component
    main.main-surgery
      .main-surgery__title
        | #ХИРУРГИЯ
      posters-component
</template>
<script>
  import HeaderComponent from '~/components/Header.vue'
  import PostersComponent from '~/components/Posters.vue'

export default {
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
  margin-top: 96px;
  margin-bottom: 76px;

  text-align: center;

  font-family: LucidaGrande-Bold;
  font-size: 36px;
  line-height: 43px;
}


.main-surgery .container {
  padding: 0 115px;
}
</style>
