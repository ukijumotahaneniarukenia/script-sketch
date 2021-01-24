<template>
  <div>
    <button class="button is-info" @click="resetBoxSize">Reset Box Size</button>
    <b-field label="Select Box Size">
      <b-select id="select-box-size" v-model="selectBoxSize" placeholder="Select Box Size" @change="detectBoxSize">
        <option
          v-for="index in boxSizeDataList"
          :key="index"
          :value="index-99"
        >
          {{ index-99 }}
        </option>
      </b-select>
    </b-field>
    <div class="is-flex is-justify-content-center"  style="z-index: 5">
      <div id="target-drag-area" class="is-flex is-flex-wrap-wrap">
        <div class="mini-box" v-for="itemIndex in gridDataList" :key="itemIndex">
        </div>
      </div>
    </div>
    <div class="is-flex is-justify-content-center">
      <figure style="margin: 50px">
        <img id="target-image" src="/images/test.jpg"/>
      </figure>
    </div>
  </div>
</template>

<script>

import DragSelect from 'dragselect'

export default {
  data: function() {
    return {
      selectBoxSize:0,
      defaultSelectBoxSize:16,
      boxSizeDataList: this.range(1, 100),
      gridDataList: this.range(1, 100)
    };
  },
  mounted() {
    this.initilaize(this.defaultSelectBoxSize);
    this.detectBoxSize();
    this.setDragArea()
  },
  methods: {
    setDragArea() {
      const dragSelect = new DragSelect({
        selectables: document.getElementById('target-image')
      });

      dragSelect.subscribe('dragstart',(event)=>{
        console.log(event)
      })
    },
    detectBoxSize() {
      const targetDom = document.getElementById("select-box-size")
      console.log("detectBoxSize")
      console.log(targetDom)
      targetDom.addEventListener("change", (event) => {
        console.log(event)
        console.log(this.selectBoxSize)
        this.resizeBoxSize(this.selectBoxSize)
      })
    },
    resetBoxSize() {
      this.resizeBoxSize(this.defaultSelectBoxSize)
    },
    resizeBoxSize(targerBoxSize) {
      this.initilaize(targerBoxSize)
      const targetMiniBoxList = Array.from(document.querySelectorAll(".mini-box"))
      for (let index = 0; index < targetMiniBoxList.length; index++) {
        const targetMiniBox = targetMiniBoxList[index];
        targetMiniBox.setAttribute("id","mini-box-"+index)
        targetMiniBox.style.setProperty("--mini-box-height", targerBoxSize + 'px')
        targetMiniBox.style.setProperty("--mini-box-width", targerBoxSize + 'px')
      }
      console.log("resizeBoxSize")
    },
    range(start, end) {
      return Array.from({ length: end - start + 1 }, (_, i) => end + i);
    },
    initilaize(targerBoxSize) {
      console.log("initilaize");
      const targetImageItem = document.getElementById("target-image");
      const targetDragArea = document.getElementById("target-drag-area");
      const boxCount = Math.ceil(
        (targetImageItem.clientHeight * targetImageItem.clientWidth) / (targerBoxSize * targerBoxSize)
      );
      console.log(boxCount);
      this.gridDataList =  this.range(1, boxCount);
      targetDragArea.style.setProperty("--drag-area-width", targetImageItem.clientWidth + 'px');
      targetDragArea.style.setProperty("--drag-area-height", targetImageItem.clientHeight + 'px');
    },
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
  background-color: #e4e4e4;
  border: 1px solid steelblue;
}
</style>
