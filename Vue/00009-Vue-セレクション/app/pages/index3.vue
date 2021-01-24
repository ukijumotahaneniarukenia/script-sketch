<template>
  <div>
    <div style="position: absolute;top:10px;left:10px;z-index: 5;opacity: 0.20;">
      <div id="target-drag-area" class="is-flex is-flex-wrap-wrap">
        <div
          v-for="itemIndex in gridDataList"
          :key="itemIndex"
          :id="'mini-box-' + (itemIndex + 1)"
          class="mini-box"
        ></div>
      </div>
    </div>
    <div>
      <img id="target-image" src="/images/sample-640x427.jpg" style="position: absolute;top:10px;left:10px"/>
    </div>
    <!-- <div>
      <img id="target-image" src="/images/sample-1280x854.jpg" style="position: absolute;top:10px;left:10px"/>
    </div> -->
  </div>
</template>

<script>
import SelectionArea from "@simonwep/selection-js";

export default {
  data: function() {
    return {
      defaultSelectBoxSize: 16,
      adjustBoxCount: 100,
      gridDataList: []
    };
  },
  mounted() {
    this.initilaize(this.defaultSelectBoxSize);
    this.setDragArea();
  },
  methods: {
    setDragArea() {
      const selection = new SelectionArea({
        selectables: [".mini-box"],
        boundaries: ["#target-drag-area"]
      })
        .on("start", ({ store, event }) => {
          if (!event.ctrlKey && !event.metaKey) {
            // Unselect all elements
            for (const el of store.stored) {
              el.classList.remove("selected");
            }

            // Clear previous selection
            selection.clearSelection();
          }
        })
        .on(
          "move",
          ({
            store: {
              changed: { added, removed }
            }
          }) => {
            // Add a custom class to the elements that where selected.
            for (const el of added) {
              el.classList.add("selected");
            }

            // Remove the class from elements that where removed
            // since the last selection
            for (const el of removed) {
              el.classList.remove("selected");
            }
          }
        )
        .on("stop", (dragInfo) => {
          console.log(dragInfo)
          console.log(dragInfo.store.selected)
          console.log(dragInfo.store.stored)
          selection.keepSelection();
        });
    },
    resetBoxSize() {
      this.resizeBoxSize(this.defaultSelectBoxSize);
    },
    resizeBoxSize(targerBoxSize) {
      this.initilaize(targerBoxSize);
      const targetMiniBoxList = Array.from(
        document.querySelectorAll(".mini-box")
      );
      for (let index = 0; index < targetMiniBoxList.length; index++) {
        const targetMiniBox = targetMiniBoxList[index];
        targetMiniBox.setAttribute("id", "mini-box-" + index);
        targetMiniBox.style.setProperty(
          "--mini-box-height",
          targerBoxSize + "px"
        );
        targetMiniBox.style.setProperty(
          "--mini-box-width",
          targerBoxSize + "px"
        );
      }
      console.log("resizeBoxSize");
    },
    range(start, end) {
      return Array.from({ length: end - start + 1 }, (_, i) => end + i);
    },
    initilaize(targerBoxSize) {
      console.log("initilaize");
      const targetImageItem = document.getElementById("target-image");
      const targetDragArea = document.getElementById("target-drag-area");
      const boxCount = Math.ceil(
        (targetImageItem.clientHeight * targetImageItem.clientWidth) /
          (targerBoxSize * targerBoxSize)
      );
      console.log(boxCount);
      this.gridDataList = this.range(1, boxCount+this.adjustBoxCount);
      targetDragArea.style.setProperty(
        "--drag-area-width",
        targetImageItem.clientWidth + "px"
      );
      targetDragArea.style.setProperty(
        "--drag-area-height",
        targetImageItem.clientHeight + "px"
      );
    }
  }
};
</script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html,
body {
  height: 100%;
}

body {
  background-color: whitesmoke;
}

#target-drag-area {
  --drag-area-width: 200px;
  --drag-area-height: 200px;
  width: var(--drag-area-width);
  height: var(--drag-area-height);
}

.mini-box {
  --mini-box-width: 16px;
  --mini-box-height: 16px;
  width: var(--mini-box-width);
  height: var(--mini-box-height);
  background-color: #e3e3e3;
   /* デバッグ用 */
  /* border: 0.9px solid #000000;
  border-radius: 0.1em; */
}

.selected {
  background-color: #000000;
  border: 0.9px solid #000000;
}
</style>
