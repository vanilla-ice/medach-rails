<template lang="pug">
  .desc-column.ql-editor
    .desc-column__title {{ name }}
    .desc-column__text(v-html="data")
</template>

<script>
export default {
  props: ['data', 'name']
}
</script>

<style lang="scss">
@import '../assets/quill.core.css';

.desc-column {
  max-width: 622px;
  width: 100%;

  p {
    font-family: Times-Roman;
    color: #515666;
  }

  .desc-column__title {
    font-family: LucidaGrande-Bold;
    font-size: 36px;
    line-height: 43px;
    margin-bottom: 46px;
  }

  img {
    display: block;
    max-width: 100%;
  }

  blockquote {
    padding-left: 16px;
    border-left: 3px solid #ccc;
    color: #666;
  }



}

</style>

