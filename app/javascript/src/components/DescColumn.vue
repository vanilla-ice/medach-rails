<template lang="pug">
  .desc-column
    .desc-column__title {{ name }}
    .desc-column__text(v-html="data")
</template>

<script>
export default {
  props: ['data', 'name']
}
</script>

<style lang="scss">
.desc-column {
  max-width: 622px;
  width: 100%;

  p {
    display: inline-block;
    margin-bottom: 25px;
  }

  p span {
    line-height: 20px !important;
    font-family: Times-Roman !important;
    font-size: 17px !important;
    color: #515666 !important;
    letter-spacing: 0 !important;
  }

  .desc-column__title {
    font-family: LucidaGrande-Bold;
    font-size: 36px;
    line-height: 43px;
    margin-bottom: 46px;
  }
}

</style>

