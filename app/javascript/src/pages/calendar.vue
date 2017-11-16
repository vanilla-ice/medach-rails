<template lang="pug" >
  div
    header-component
    main.main-calendar
      calendar-component

</template>
<script>
  import HeaderComponent from '~/components/Header.vue'
  import CalendarComponent from '~/components/Calendar.vue'

export default {
    components: {
      HeaderComponent,
      CalendarComponent
    }
}
</script>

<style scoped lang="scss">

</style>
