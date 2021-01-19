<template>
  <div>
    <div>
      <!-- スタイル等は一度レンダラ処理しないと描画されない -->
      <b-card
        data-insert-html="<b-button variant='success'>Button</b-button>"
        draggable="true"
        @dragstart="dragstartHandler($event)"
        @dragend="dragendHandler($event)"
        @dragover="dragoverHandler($event)"
      >
        <b-icon-plus-circle></b-icon-plus-circle>
        <p>Button</p>
      </b-card>
      <b-card
        data-insert-html="<h1>HEADER GOES HERE</h1>"
        draggable="true"
        @dragstart="dragstartHandler($event)"
        @dragend="dragendHandler($event)"
        @dragover="dragoverHandler($event)"
      >
        <b-icon-type-h1></b-icon-type-h1>
        <p>Header</p>
      </b-card>
      <b-card
        data-insert-html="<img src='https://picsum.photos/600/300/?image=48'>"
        draggable="true"
        @dragstart="dragstartHandler($event)"
        @dragend="dragendHandler($event)"
        @dragover="dragoverHandler($event)"
      >
        <b-icon-image></b-icon-image>
        <p>Chart Image</p>
      </b-card>
    </div>
    <iframe
      id="drop-area-to-create-mock-page"
      src="/drag-and-drop/lesson03/preview"
      frameborder="0"
      width="100%"
      height="100%"
      style="height: 500px;weight: 600px;"
      @load="initialize"
    >
    </iframe>
  </div>
</template>

<script>
// https://developer.mozilla.org/ja/docs/Web/API/Element/insertAdjacentHTML

// https://developer.mozilla.org/en-US/docs/Web/API/DataTransferItemList/add

import { v4 as uuidv4 } from "uuid";

export default {
  data: function() {
    return {
      dragItem: {},
    }
  },
  methods: {
    initialize() {
      // https://www.reddit.com/r/vuejs/comments/5gzi2y/how_to_listen_iframes_onload_event_on_vuejs/
      const targetDom = document.querySelector("iframe");
      // console.log(targetDom)
      // console.log(targetDom.contentDocument.head)
      // console.log(targetDom.contentDocument.body)
      // drop対象はbody全体
      targetDom.contentDocument.body.addEventListener("drop", this.dropHandler);
      targetDom.contentDocument.body.addEventListener("dragover", this.dragoverHandler);

      let mockPageStyleDom = document.createElement("style");
      mockPageStyleDom.innerHTML = this.createMockPageCss();
      // // console.log(mockPageStyleDom)
      targetDom.contentDocument.head.appendChild(mockPageStyleDom);
    },
    createMockPageCss() {
      return `
        * {
          background-color: #00adff
        }
      `;
    },
    setMockPageCss() {
      this.createMockPageCss();
    },
    dragstartHandler(event) {
      console.log("dragStart");
      console.log(event);
      console.log(event.clientX, event.clientY);
      console.log(event.target);
      // https://developer.mozilla.org/ja/docs/Web/API/HTML_Drag_and_Drop_API
      // https://park.glitch.me/
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
      console.log(itemDataList)
    },
    dropHandler(event) {
      event.preventDefault();
      event.stopPropagation();
      console.log("Drop");
      console.log(event);
      console.log(event.clientX, event.clientY);
      let targetDropDom = event.target;
      console.log(targetDropDom);
      let itemDataList = event.dataTransfer.items;
      for (let i = 0; i < itemDataList.length; i++) {
        console.log(itemDataList[i]);
        console.log(itemDataList[i].kind);
        console.log(itemDataList[i].type);
        itemDataList[i].getAsString(targetDomInfo => {
          const targetDomItem = JSON.parse(targetDomInfo);
          console.log(targetDomItem);
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
      console.log(event);
      console.log(event.clientX, event.clientY);
      console.log(event.target);
    },
    dragendHandler(event) {
      console.log("dragEnd");
      console.log(event);
      console.log(event.clientX, event.clientY);
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
