<template lang="pug">
  .info-column
        .info-column__item.info-column__autor
          | Автор: Чумной Доктор
        .info-column__item.info-column__infographic
          | Инфографика:
          a(href="#")
            | http://factory.mn
        .info-column__item.info-column__redaction
          | Редакция: Cornu Ammonis, Николай Лисицкий, Елена Лисицына
        a(href='#').info-column__item.info-column__data
          | 2 июля, 2017
</template>

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

.info-column__infographic a {
  text-decoration: underline;
}

.info-column__data {
  text-decoration: underline;
  font-style: italic;
}

</style>

