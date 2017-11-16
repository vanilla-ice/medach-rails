<template lang="pug" >
  .inner
    .posts
      nuxt-link.post(to="admin/post/new")
        .add-new(v-html="require('~/static/images/plus.svg')")

      .post(v-for="(post, index) in posts")
        .opacity
          .buttons
            nuxt-link.button(:to="'admin/post/' + post.url") Редактировать
            .button(@click="removePost(post['.key'])") Удалить
        .img
        .name
          | {{ post.name }}

</template>

<script>
import { mapGetters } from 'vuex'
import { db } from '~/db'
const $posts = db.ref('posts')

export default {
  layout: 'admin',

  data () {
    return {
    }
  },

  fetch ({ store }) {
    store.dispatch('setPostsRef', $posts.orderByChild('sortDate'))
  },

  mounted () {
    console.log(this)
  },

  computed: {
    ...mapGetters(['posts'])
  },

  methods: {
    removePost (id) {
      return this.$swal({
        title: 'Удалить пост?',
        text: 'Это действие нельзя отменить',
        type: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        cancelButtonText: 'Отмена',
        confirmButtonText: 'Удалить!'
      }).then(() => {
        $posts.child(id).remove()
        this.$swal(
          'Успешно!',
          'Пост успешно удален',
          'success'
        )
      })
    }
  }
}
</script>

<style scoped lang="scss">
.posts {
  display: flex;
  flex-flow: row wrap;
  
}

.inner {
  padding: 10px 50px 50px 50px;
  height: calc(100% - 83px);
  overflow-y: auto;
}

.post {
  width: calc(20% - 20px);
  cursor: pointer;
  margin: 0 10px;
  padding: 20px;
  box-shadow: 1px 1px 3px 0 #ccc;
  position: relative;
  overflow: hidden;
  display: flex;
  flex-flow: column nowrap;
  min-height: 330px;

  background: #fff;

  &:nth-child(n + 6) {
    margin-top: 20px;
  }
}

.name {
  font-family: sans-serif;
  margin-top: 15px;
}

.opacity {
  position: absolute;
  top: 0;
  left: 0;
  background: rgba(0,0,0,0.8);
  width: 100%;
  height: 100%;
  color: #fff;
  opacity: 0;
  transition: opacity .2s ease;

  &:hover {
    opacity: 1;
  }
}

.buttons {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
}

.button {
  font-size: 18px;
  font-family: sans-serif;
  text-shadow: 1px 1px 1px #000;
  border-bottom: 1px solid transparent;
  display: inline-block;
  color: #fff;

  &:not(:first-child) {
    margin-top: 10px;
  }

  &:hover {
    border-color: #fff;
  }
}

.add-new {
  width: 40%;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
</style>

<style lang="scss">
.add-new {
  svg {
    width: 100%;

    path {
      fill: #ccc;
      transition: fill .2s ease;
    }
  }
}

.post:hover{
  .add-new svg path {
    fill: #aaa;
  }
}

.img {
  background: url('~static/images/crisp.jpg') no-repeat center / cover;
  flex: 1 1 auto;
}

</style>
