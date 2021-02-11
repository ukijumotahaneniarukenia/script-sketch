<template>
  <div>
    <div>
      current viewport is {{ currentViewport }}
    </div>
    <div id="main-content-smartphone">
      スマホ
    </div>
    <div id="main-content-tablet">
      タブレット
    </div>
    <div id="main-content-desktop">
      デスクトップ
    </div>
  </div>
</template>

<script>
export default {
  data:function () {
    return {
      currentViewport: "",
      viewportPatternDomIdList: [
        "main-content-smartphone",
        "main-content-tablet",
        "main-content-desktop",
      ],
    }
  },
  mounted() {
    this.detectViewport()
    window.addEventListener("resize", (event) => {
      this.detectViewport(event);
    });
  },
  methods: {
    detectViewport(event) {
      console.log("detectViewport")
      console.log(event)
      for (let index = 0; index < this.viewportPatternDomIdList.length; index++) {
        const viewportPatternDomId = this.viewportPatternDomIdList[index];
        const targetDom = document.querySelector(`#${viewportPatternDomId}`);
        // https://davidwalsh.name/pseudo-element
        // https://www.lullabot.com/articles/importing-css-breakpoints-into-javascript
        const contentViewportPattern = window.getComputedStyle(targetDom, ':before').getPropertyValue('content').replace(/\"/g, '');
        if (contentViewportPattern  !== "none") {
          this.currentViewport = contentViewportPattern
          targetDom.style.display = "block"
        } else {
          targetDom.style.display = "none"
        }
      }
    }
  }
};
</script>

<style>
@media screen and (max-width: 400px) {
  div#main-content-smartphone::before {
    content: "smartphone";
    display: none; /* Prevent from displaying. */
  }
}
@media screen and (min-width: 400px) and (max-width: 1000px) {
  div#main-content-tablet::before {
    content: "tablet";
    display: none; /* Prevent from displaying. */
  }
}
@media screen and (min-width: 1000px) {
  div#main-content-desktop::before {
    content: "desktop";
    display: none; /* Prevent from displaying. */
  }
}
</style>
