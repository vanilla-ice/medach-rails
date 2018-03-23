<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script>
export default {
}
</script>

<style lang="scss">
a {
  text-decoration: none;
  color: #000;
}

html {
  font-family: "Source Sans Pro", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
  font-size: 16px;
  word-spacing: 1px;
  -ms-text-size-adjust: 100%;
  -webkit-text-size-adjust: 100%;
  -moz-osx-font-smoothing: grayscale;
  -webkit-font-smoothing: antialiased;
  box-sizing: border-box;

  background: #e0e0e0;
}

*, *:before, *:after {
  box-sizing: border-box;
  margin: 0;
}

.container {
  display: flex;
  position: relative;

  max-width: 1440px;
  width: 100%;
  padding: 0 30px;
}

.button--green {
  display: inline-block;
  border-radius: 4px;
  border: 1px solid #3b8070;
  color: #3b8070;
  text-decoration: none;
  padding: 10px 30px;
}

.button--green:hover {
  color: #fff;
  background-color: #3b8070;
}

.button--grey {
  display: inline-block;
  border-radius: 4px;
  border: 1px solid #35495e;
  color: #35495e;
  text-decoration: none;
  padding: 10px 30px;
  margin-left: 15px;
}

.button--grey:hover {
  color: #fff;
  background-color: #35495e;
}

.editor_img-title {
  width: 100%;
  padding-top: 10px;
  padding-bottom: 10px;
  padding-left: 20px;
  padding-right: 10px;

  color: #fff;
  font-family: inherit;
  font-weight: bold;
  font-size: 18px;
  line-height: 20px;

  background: #30312F;
  border-top: 2px solid #000;
  border-left: 2px solid #000; 
  border-right: 2px solid #000; 
  border-top-left-radius: 3px;
  border-top-right-radius: 3px;
}

.editor_img-content {
  padding-left: 20px;
  padding-right: 10px;
  padding-top: 10px;
  padding-bottom: 10px;

  margin-bottom: 20px;

  font-size: 14px;
  color: #30312F;
  line-height: 20px;

  border-left: 2px solid #000; 
  border-right: 2px solid #000; 
  border-bottom: 2px solid #000; 
  border-bottom-left-radius: 3px;
  border-bottom-right-radius: 3px;
}

  .main-index {
    padding-bottom: 50px;
  }
  @import './src/assets/normalize.css';
  @import './src/assets/fonts.css';
  @import './src/assets/settings.css';

@media(max-width: 1440px) {
  .container {
    padding-left: 30/1380 * 100%;
    padding-right: 30/1380 * 100%;
  }
}
</style>
