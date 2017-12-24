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
        .info-column__item
          span.title
            | Тэги:
          router-link(v-for="(tag, id) in info.tag_list", :to="'/tag/' + tag").tag
            |{{'#' + tag}}
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

.tag {
  display: inline-block;
  text-decoration: underline;
  margin-left: 5px;

  &:not(:last-child) {
    &::after {
      content: ',';
    }
  }
}

@media (max-width: 1024px) {
  .info-column {
    font-size: 18px;
    line-height: 24px;
    max-width: 50%;
  }
}

</style>

