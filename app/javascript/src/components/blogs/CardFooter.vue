<template lang="pug">
  div( :class="{'card-footer': true, 'color-black': color}")
    .name
      | Plague doctor
    .card-info
      .icon
      .liks
        | {{ getViews() }}
      .date
        | Сентябрь 21, 2018
</template>

<script>
  export default {
    props: {
      color: Boolean,
      tags: null,
      view: null,
    },

    data() {
      return {
      }
    },

    methods: {
      getViews () {
        if (this.view) {
          return this.view
        }
        return '0'
      }
    }
  }
</script>

<style lang="scss" scoped>
  .card-footer {
    display: flex;
    justify-content: space-between; 
    align-items: center;
    width: 100%;

    font-size: 16px;
    color: #fff;
  }

  .card-footer.color-black {
    color: #000;
  }

  .color-black .liks {
    color: #7F7F7F;
  }

  .color-black .date {
    color: #7F7F7F;
  }

  .card-info {
    display: flex;
    align-items: center;
  }

  .icon {
    width: 21px;
    height: 26px;
    margin-right: 5px;

    background: url('../../static/images/fire.png') no-repeat center;
  }

  .date {
    display: flex;
    align-items: center;

    margin-left: 26px;
  }

  @media(max-width: 1250px) {
    .card-footer.color-black {
      font-size: 14px;
    }
  }
</style>