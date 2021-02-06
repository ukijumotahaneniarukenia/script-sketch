<template>
  <div>
    <div>
      <!-- スタイル等は一度レンダラ処理しないと描画されない -->
      <b-card
        data-insert-html="<b-button variant='success'>Button</b-button>"
        draggable="true"
        @dragstart="dragstartHandler($event)"
        @dragend="dragendHandler($event)"
      >
        <b-icon-plus-circle></b-icon-plus-circle>
        <p>Button</p>
      </b-card>
      <b-card
        data-insert-html='<h1>HEADER GOES HERE</h1>'
        draggable="true"
        @dragstart="dragstartHandler($event)"
        @dragend="dragendHandler($event)"
      >
        <b-icon-type-h1></b-icon-type-h1>
        <p>Header</p>
      </b-card>
      <b-card
        data-insert-html="<img src='https://picsum.photos/600/300/?image=48'>"
        draggable="true"
        @dragstart="dragstartHandler($event)"
        @dragend="dragendHandler($event)"
      >
        <b-icon-image></b-icon-image>
        <p>Chart Image</p>
      </b-card>
    </div>
    <div
      id="target"
      @drop="dropHandler($event)"
      @dragover="dragoverHandler($event)"
    >
      Drop Zone
    </div>
  </div>
</template>

<script>

// https://developer.mozilla.org/ja/docs/Web/API/Element/insertAdjacentHTML

// https://developer.mozilla.org/en-US/docs/Web/API/DataTransferItemList/add

import { v4 as uuidv4 } from "uuid";

export default {
  methods: {
    dragstartHandler(event) {
      console.log("dragStart");
      const targetDomId = uuidv4();
      event.target.setAttribute("id", targetDomId);
      const targetPayload = event.target.getAttribute("data-insert-html");
      let itemDataList = event.dataTransfer.items;
      itemDataList.add(
        '{"targetDomId":"' +
          targetDomId +
          '","targetPayload":"' +
          targetPayload +
          '"}',
        "text/plain"
      );
    },
    dropHandler(event) {
      event.preventDefault();
      console.log("Drop");
      let targetDropDom = event.target;
      console.log(targetDropDom);
      let itemDataList = event.dataTransfer.items;
      for (let i = 0; i < itemDataList.length; i++) {
        console.log(itemDataList[i]);
        console.log(itemDataList[i].kind);
        console.log(itemDataList[i].type);
        itemDataList[i].getAsString(targetDomInfo => {
          const targetDomItem = JSON.parse(targetDomInfo);
          console.log(targetDomItem.targetPayload);
          let parser = new DOMParser();
          let doc = parser.parseFromString(
            targetDomItem.targetPayload,
            "text/html"
          );
          let item = document.createElement("div");
          item.innerHTML = targetDomItem.targetPayload;
          item.firstElementChild.setAttribute("id", targetDomItem.targetDomId);
          item.firstElementChild.classList.add("drop-item");
          targetDropDom.append(item.firstElementChild);
        });
      }
    },
    dragoverHandler(event) {
      event.preventDefault();
      console.log("dragOver");
      console.log(event.target);
      event.dataTransfer.dropEffect = "move";
    },
    dragendHandler(event) {
      console.log("dragEnd");
      console.log(event.target);
      let itemDataList = event.dataTransfer.items;
      for (let i = 0; i < itemDataList.length; i++) {
        itemDataList.remove(i);
      }
      itemDataList.clear();
    }
  }
};
</script>

<style>
#source {
  color: blue;
  border: 1px solid black;
}
#target {
  border: 3px dashed black;
}

.drop-item {
  display: inline-block;
}
</style>
