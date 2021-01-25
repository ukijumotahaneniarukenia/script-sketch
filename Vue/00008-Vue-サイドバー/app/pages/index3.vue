<template>
  <div>
    <div id="target-drag-area" class="is-flex is-flex-wrap-wrap drag-area">
      <div class="mini-box" v-for="itemIndex in gridDataList" :key="itemIndex">
      </div>
    </div>
    <div class="is-flex is-justify-content-center">
      <figure style="margin: 50px">
        <img id="target-image" src="/images/test.jpg" />
      </figure>
    </div>
    <!-- <div class="columns is-gapless">
      <div class="column" v-for="(itemRowList, itemRowKey) in gridDataList" :key="itemRowKey">
        <div class="column" v-for="(itemData, itemColKey) in itemRowList" :key="itemColKey">
          <div class="box">
            {{itemData.itemName}}
            {{itemRowKey + ',' + itemColKey}}
          </div>
        </div>
      </div>
    </div> -->
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      miniBoxHeight: 30,
      miniBoxwidth: 30,
      gridDataList: this.range(1, 100)
    };
  },
  mounted() {
    this.initilaize();
    this.setUp();
  },
  methods: {
    range(start, end) {
      return Array.from({ length: end - start + 1 }, (_, i) => end + i);
    },
    initilaize() {
      console.log("initilaize");
      const targetImageItem = document.getElementById("target-image");
      const boxCount = Math.ceil(
        (targetImageItem.clientHeight * targetImageItem.clientWidth) / (this.miniBoxHeight * this.miniBoxwidth)
      );
      console.log(boxCount);
      this.gridDataList =  this.range(1, boxCount)
    },
    setUp() {
      const targetDragArea = document.getElementById("target-drag-area")
      console.log(targetDragArea)
      console.log(typeof(targetDragArea))
      // console.log(targetDragArea.classList)
      // targetDragArea.classList.add("mini-box-override")
      // console.log(targetDragArea.classList)
      let targetMiniBoxList = Array.from(document.getElementsByClassName("mini-box"))
      for (let index = 0; index < targetMiniBoxList.length; index++) {
        let targetMiniBox = targetMiniBoxList[index];
        console.log(targetMiniBox)
        targetMiniBox.setAttribute("id","mini-box-"+index)
        // console.log(window.getComputedStyle(targetMiniBox).getPropertyValue("--mini-box-height"))
        // console.log(window.getComputedStyle(targetMiniBox).getPropertyValue("--mini-box-width"))
        // console.log(targetMiniBox.classList)
        // targetMiniBox.classList.add("mini-box-override")
        // console.log(targetMiniBox.classList)
        // targetMiniBox.style.setProperty("--mini-box-height", this.miniBoxHeight + 'px')
        // targetMiniBox.style.setProperty("--mini-box-width", this.miniBoxwidth + 'px')
        // console.log(window.getComputedStyle(targetMiniBox).getPropertyValue("--mini-box-height"))
        // console.log(window.getComputedStyle(targetMiniBox).getPropertyValue("--mini-box-width"))
      }
      const a = document.getElementById("mini-box-0")
      console.log(a)
      a.classList.add("mini-box-override")
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

main {
  width: 100%;
  max-width: 50em;
  margin: 1.5em auto;
}

main .boxes {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  border: 2px solid rgba(165, 33, 158, 0.075);
  border-radius: 0.15em;
  padding: 1em 0;
}

main .boxes.green,
main .boxes.blue {
  margin-bottom: 3em;
}

main .boxes div {
  height: 3em;
  width: 3em;
  margin: 0.2em;
  background: rgba(66, 68, 90, 0.075);
  border: 2px solid transparent;
  border-radius: 0.15em;
  cursor: pointer;
}

main .boxes.green div.selected {
  background: hsl(100, 80%, 65%);
  border: 2px solid rgba(0, 0, 0, 0.075);
}

.drag-area {
  --mini-box-width: 20px;
  width: 200px;
}

.mini-box-override {
  --mini-box-width: 20px;
  --mini-box-height: 20px;
  width: var(--mini-box-width);
  height: var(--mini-box-height);
}
.mini-box {
  width: 20px;
  height: 20px;
  background-color: #e4e4e4;
  border: 1px solid steelblue;
}
</style>
