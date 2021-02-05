<template>
  <!-- https://medium.com/the-z/making-a-resizable-div-in-js-is-not-easy-as-you-think-bda19a1bc53d -->
  <div>
    <div class="resizable">
      <div class="resizer-item-list">
        <div class="resizer-item top-left"></div>
        <div class="resizer-item top-right"></div>
        <div class="resizer-item bottom-left"></div>
        <div class="resizer-item bottom-right"></div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  mounted() {
    this.makeResizableDiv('.resizable');
  },
  methods: {
    makeResizableDiv(targetDomSelector) {
      // クロージャ イベント発火時の間、前回の座標をもとにした実装はよく利用される
      const targetDom = document.querySelector(targetDomSelector);
      const resizerItemList = document.querySelectorAll(targetDomSelector + " .resizer-item");
      const minimumSize = 20;
      let originalWidth = 0;
      let originalHeight = 0;
      let originalX = 0;
      let originalY = 0;
      let originalMouseX = 0;
      let originalMouseY = 0;
      // 4隅の座標を対象要素のマウスクリックダウン時に取得
      for (let i = 0; i < resizerItemList.length; i++) {
        const currentResizer = resizerItemList[i];
        currentResizer.addEventListener("mousedown", function (e) {
          e.preventDefault();
          originalWidth = parseFloat(
            window.getComputedStyle(targetDom, null)
              .getPropertyValue("width")
              .replace("px", "")
          );
          originalHeight = parseFloat(
            window.getComputedStyle(targetDom, null)
              .getPropertyValue("height")
              .replace("px", "")
          );
          originalX = targetDom.getBoundingClientRect().left;
          originalY = targetDom.getBoundingClientRect().top;
          originalMouseX = e.pageX;
          originalMouseY = e.pageY;
          console.log(e.pageX, e.pageY)
          window.addEventListener("mousemove", resize); // ドラッグオーバーしている間はリサイズ
          window.addEventListener("mouseup", stopResize);  // 対象要素のマウスクリックアップ時にリサイズをストップ
        });

        function resize(e) {
          if (currentResizer.classList.contains("bottom-right")) {
            const width = originalWidth + (e.pageX - originalMouseX);
            const height = originalHeight + (e.pageY - originalMouseY);
            if (width > minimumSize) {
              targetDom.style.width = width + "px";
            }
            if (height > minimumSize) {
              targetDom.style.height = height + "px";
            }
          } else if (currentResizer.classList.contains("bottom-left")) {
            const height = originalHeight + (e.pageY - originalMouseY);
            const width = originalWidth - (e.pageX - originalMouseX);
            if (height > minimumSize) {
              targetDom.style.height = height + "px";
            }
            if (width > minimumSize) {
              targetDom.style.width = width + "px";
              targetDom.style.left =
                originalX + (e.pageX - originalMouseX) + "px";
            }
          } else if (currentResizer.classList.contains("top-right")) {
            const width = originalWidth + (e.pageX - originalMouseX);
            const height = originalHeight - (e.pageY - originalMouseY);
            if (width > minimumSize) {
              targetDom.style.width = width + "px";
            }
            if (height > minimumSize) {
              targetDom.style.height = height + "px";
              targetDom.style.top =
                originalY + (e.pageY - originalMouseY) + "px";
            }
          } else {
            const width = originalWidth - (e.pageX - originalMouseX);
            const height = originalHeight - (e.pageY - originalMouseY);
            if (width > minimumSize) {
              targetDom.style.width = width + "px";
              targetDom.style.left =
                originalX + (e.pageX - originalMouseX) + "px";
            }
            if (height > minimumSize) {
              targetDom.style.height = height + "px";
              targetDom.style.top =
                originalY + (e.pageY - originalMouseY) + "px";
            }
          }
        }

        function stopResize() {
          window.removeEventListener("mousemove", resize);
        }
      }
    },
  },
};
</script>

<style>
.resizable {
  background: white;
  width: 100px;
  height: 100px;
  position: absolute;
  top: 100px;
  left: 100px;
}

.resizable .resizer-item-list {
  width: 100%;
  height: 100%;
  border: 3px solid #4286f4;
  box-sizing: border-box;
}

.resizable .resizer-item-list .resizer-item {
  width: 10px;
  height: 10px;
  border-radius: 50%; /*magic to turn square into circle*/
  background: white;
  border: 3px solid #4286f4;
  position: absolute;
}

.resizable .resizer-item-list .resizer-item.top-left {
  left: -5px;
  top: -5px;
  cursor: nwse-resize; /*resizer-item cursor*/
}
.resizable .resizer-item-list .resizer-item.top-right {
  right: -5px;
  top: -5px;
  cursor: nesw-resize;
}
.resizable .resizer-item-list .resizer-item.bottom-left {
  left: -5px;
  bottom: -5px;
  cursor: nesw-resize;
}
.resizable .resizer-item-list .resizer-item.bottom-right {
  right: -5px;
  bottom: -5px;
  cursor: nwse-resize;
}
</style>
