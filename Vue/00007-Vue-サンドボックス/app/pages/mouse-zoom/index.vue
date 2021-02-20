<template>
  <!-- https://stackoverflow.com/questions/46647138/zoom-in-on-a-mousewheel-point-using-scale-and-translate -->
  <div id="slide-container">
    <div id="slide-content">
      <img
        id="slide-item"
        src="https://iso.500px.com/wp-content/uploads/2014/07/big-one.jpg"
      />
    </div>
  </div>
</template>

<script>
export default {
  mounted() {
    this.mouseScrollZoom(
      document.getElementById("slide-container"),
      "slide-item",
      10,
      0.03
    );
  },

  methods: {
    mouseScrollZoom(targetDom, targetImageDomId, maxScale, factor) {
      let targetImageDom = targetDom.querySelector(`#${targetImageDomId}`);
      let targetImageDomSize = {
        width: targetImageDom.width,
        height: targetImageDom.height,
      };
      let pos = { x: 0, y: 0 };
      let zoomTarget = { x: 0, y: 0 };
      let zoomPoint = { x: 0, y: 0 };
      let scale = 1;
      // 左上を基準にし、ズームインの場合はイメージをスケール後、右下への移動（スケールを変数とした移動量を求める）
      // ズームアウトの場合はもとのスケールに戻す
      targetImageDom.style.setProperty("transform-origin", "0px 0px");
      targetImageDom.addEventListener(
        "wheel",
        (event) => {
          detectScroll(event);
        },
        false
      );
      targetImageDom.addEventListener(
        "mousewheel",
        (event) => {
          detectScroll(event);
        },
        false
      );
      targetImageDom.addEventListener(
        "DOMMouseScroll",
        (event) => {
          detectScroll(event);
        },
        false
      );
      function detectScroll(event) {
        console.log("detectScroll", event);
        // マウスホイールが発火したところをズーム開始始点に設定
        zoomPoint.x = event.pageX - targetDom.offsetLeft;
        zoomPoint.y = event.pageY - targetDom.offsetTop;

        event.preventDefault();
        let wheelDelta = event.wheelDelta;
        wheelDelta = Math.max(-1, Math.min(1, wheelDelta)); // マウスホイールの差分を-1（Up to Down）1 (Down To Up) のどちらかのパターンに振り分け

        if (wheelDelta === -1) {
          console.log("zoom out")
        } else {
          console.log("zoom in")
        }

        // ズーム座標を設定
        zoomTarget.x = (zoomPoint.x - pos.x) / scale;
        zoomTarget.y = (zoomPoint.y - pos.y) / scale;

        scale += wheelDelta * factor * scale;
        scale = Math.max(1, Math.min(maxScale, scale)); // ズームアウトの場合スケールが1より小さくならないように再設定

        // ズーム後、フォーカス座標をズーム開始始点を基準に再設定
        pos.x = -zoomTarget.x * scale + zoomPoint.x;
        pos.y = -zoomTarget.y * scale + zoomPoint.y;

        // ズームインしてからズームインする場合
        // ズームインしてからズームアウトする場合
        // ズームアウトしてからズームインする場合
        // ズームアウトしてからズームアウトする場合

        if (pos.x > 0) {
          // ズームアウトの場合
          pos.x = 0;
        }
        if (pos.y > 0) {
          // ズームアウトの場合
          pos.y = 0;
        }
        if (
          pos.x + targetImageDomSize.width * scale <
          targetImageDomSize.width
        ) {
          // ズームインかつ元画像の横幅未満の場合
          pos.x = -targetImageDomSize.width * (scale - 1);
        }
        if (
          pos.y + targetImageDomSize.height * scale <
          targetImageDomSize.height
        ) {
          // ズームインかつ元画像の縦幅未満の場合
          pos.y = -targetImageDomSize.height * (scale - 1);
        }

        update();
      }

      function update() {
        console.log( "transform:",
          "translate(" +
            pos.x +
            "px," +
            pos.y +
            "px) " +
            "scale(" +
            scale +
            "," +
            scale +
            ")");
        targetImageDom.style.setProperty(
          "transform",
          "translate(" +
            pos.x +
            "px," +
            pos.y +
            "px) " +
            "scale(" +
            scale +
            "," +
            scale +
            ")"
        );
      }
    },
  },
};
</script>

<style>
#slide-targetDom {
  width: 100%;
  height: 100%;
}
#slide-content {
  width: 100%;
  height: 100%;
  transition-duration: 2s;
  overflow: hidden;
}
img {
  width: 100vw;
  max-width: 100%;
  height: 100vh;
}
</style>
