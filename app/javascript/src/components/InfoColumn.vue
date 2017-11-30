<template lang="pug">
  .info-column
        .info-column__item.info-column__autor
          | Автор: {{info.author}}
        .info-column__item.info-column__infographic(v-if="info.infographic")
          | Инфографика: 
          a(:href="info.infographic")
            | {{info.infographic}}
        .info-column__item.info-column__redaction
          | Редакция: {{info.redaction}}
        .info-column__item.info-column__data
          | {{date}}
</template>

<script>
import { format } from 'date-fns'
import ru from 'date-fns/locale/ru'

export default {
  props: ['info'],

  mounted () {
  },

  computed: {
    date() {
      return format(this.info.created_at, 'DD MMMM, YYYY', { locale: ru })
    }
  }
}
</script>

<style scoped lang="scss">
.info-column {
  max-width: 218px;
  width: 100%;
  margin-top: 90px;

  font-size: 12px;
  line-height: 14px;
}

.info-column__item {
  margin-bottom: 11px;
}

.info-column__data {
  font-style: italic;
}

</style>

