<template lang="pug">
  div( :class="{'card-footer': true, 'color-black': color}")
    .name
      | {{ getAutor() }}
    .card-info
      .icon
      .liks
        | {{ getViews() }}
      .date
        | {{ currentDate() }}
</template>

<script>
  import { format } from 'date-fns'
  import ru from 'date-fns/locale/ru'

  export default {
    props: {
      color: Boolean,
      tags: null,
      view: null,
      author: null,
      date: null
    },

    data() {
      return {
      }
    },

    methods: {
      getAutor() {
        if (this.author) return this.author
        return "Неизвестно"
      },

      getViews () {
        if (this.view) {
          return this.view
        }
        return '0'
      },

      currentDate() {
        if (this.date) {
          let date = format(this.date, 'MMMM D, YYYY', { locale: ru });
          return date[0].toUpperCase() + date.slice(1);
        }
        return "Неизвестно"
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
    font-family: Montserrat-SemiBold, helvetica;
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

  .name {
    font-family: Montserrat-Medium, helvetica;
  }

  @media(max-width: 1250px) {
    .card-footer.color-black {
      font-size: 14px;
    }
  }
</style>