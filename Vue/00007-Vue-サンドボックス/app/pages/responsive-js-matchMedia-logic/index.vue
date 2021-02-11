<template>
  <div>
    <div class="invisible-content is-smartphone" id="main-content-smartphone">
      スマホ
    </div>
    <div class="invisible-content is-tablet" id="main-content-tablet">
      タブレット
    </div>
    <div class="invisible-content is-desktop" id="main-content-desktop">
      デスクトップ
    </div>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      viewportPatternDomIdList: [
        "main-content-smartphone",
        "main-content-tablet",
        "main-content-desktop",
      ],
    };
  },
  mounted() {
    // Not working
    // https://gist.github.com/jakub-g/5286483ff5f29e8fdd9f#user-content-domcontentloaded-vs-load
    // document.addEventListener("DOMContentLoaded", (event) => {
    //   this.detectViewport(event);
    // });
    window.addEventListener("load", (event) => {
      this.detectViewport(event);
    });
    window.addEventListener("resize", (event) => {
      this.detectViewport(event);
    });
  },
  methods: {
    setUpViewport(targetDomId) {
      console.log("setUpViewport");
      for (
        let index = 0;
        index < this.viewportPatternDomIdList.length;
        index++
      ) {
        const viewportPatternDomId = this.viewportPatternDomIdList[index];
        if (targetDomId === viewportPatternDomId) {
          const targetDom = document.getElementById(targetDomId);
          targetDom.classList.remove("invisible-content");
        } else {
          const nonTargetDom = document.getElementById(viewportPatternDomId);
          nonTargetDom.classList.add("invisible-content");
        }
      }
    },
    detectViewport(event) {
      console.log("detectViewport");
      console.log(event);
      if (window.matchMedia("(max-width:400px)").matches) {
        console.log(
          "smartphone",
          window.matchMedia("(max-width:400px)").matches
        );
        this.setUpViewport("main-content-smartphone");
      }
      if (
        window.matchMedia("(min-width:400px) and (max-width:1000px)").matches
      ) {
        console.log(
          "tablet",
          window.matchMedia("(min-width:400px) and (max-width:1000px)").matches
        );
        this.setUpViewport("main-content-tablet");
      }
      if (window.matchMedia("(min-width:1000px)").matches) {
        console.log("desktop", window.matchMedia("(min-width:1000px)").matches);
        this.setUpViewport("main-content-desktop");
      }
    },
  },
};
</script>

<style>
.invisible-content {
  display: none;
}
</style>
