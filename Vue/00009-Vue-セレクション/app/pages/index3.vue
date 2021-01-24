<template>
  <div>
    <div class="is-flex is-justify-content-center">
      <div id="target-drag-area" class="is-flex is-flex-wrap-wrap">
        <div
          class="mini-box"
          v-for="itemIndex in gridDataList"
          :key="itemIndex"
        ></div>
      </div>
    </div>
    <div class="is-flex is-justify-content-center">
      <figure style="margin: 50px">
        <img id="target-image" src="/images/test.jpg" />
      </figure>
    </div>
  </div>
</template>

<script>
import SelectionArea from "@simonwep/selection-js";

export default {
  data: function() {
    return {
      selectBoxSize: 0,
      defaultSelectBoxSize: 16,
      boxSizeDataList: this.range(1, 100),
      gridDataList: this.range(1, 100)
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
          console.log(store);
          console.log(event);
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
            console.log({
              store: {
                changed: { added, removed }
              }
            });
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
        .on("stop", () => {
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
      this.gridDataList = this.range(1, boxCount);
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
  border: 1px solid #000000;
  border-radius: 0.1em;
}

.selected {
  background-color: #bbbbbb;
  border: 1px solid #000000;
}
</style>
