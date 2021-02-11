<template>
  <div>
    <div class="show-content is-tablet" id="main-content-tablet">
      タブレット
    </div>
    <div class="show-content is-smartphone" id="main-content-smartphone">
      スマホ
    </div>
    <div class="show-content is-desktop" id="main-content-desktop">
      デスクトップ
    </div>
  </div>
</template>

<script>
export default {
  mounted() {
    window.addEventListener("resize", (event) => {this.detectViewport(event)})
  },
  methods: {
    detectViewport(event) {
      console.log(event)
      if (window.getComputedStyle(document.getElementById("main-content-tablet")).getPropertyValue("display") === 'block') {
        console.log("viewport is tablet")
      }
      if (window.getComputedStyle(document.getElementById("main-content-smartphone")).getPropertyValue("display") === 'block') {
        console.log("viewport is smartphone")
      }
      if (window.getComputedStyle(document.getElementById("main-content-desktop")).getPropertyValue("display") === 'block') {
        console.log("viewport is desktop")
      }
    },
  },
};
</script>

<style>
.show-content {
  display: none;
}

@media screen and (max-width: 400px) {
  .show-content.is-smartphone {
    display: block;
  }
}
@media screen and (min-width: 400px) and (max-width: 1000px) {
  .show-content.is-tablet {
    display: block;
  }
}
@media screen and (min-width: 1000px) {
  .show-content.is-desktop {
    display: block;
  }
}
</style>
