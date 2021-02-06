<template>
  <div class="container mt-5">
    <h1>{{ message }}</h1>
    <div class="d-flex justify-content-between bg-dark p-3">
      <div
        class="bg-secondary p-2 m-2 w-100"
        @drop="dropList($event, 'A')"
        @dragover.prevent
        @dragenter.prevent
      >
        <h2 class="text-light">Category A</h2>
        <div
          class="bg-white m-2 p-2"
          v-for="(list, index) in CategoryA"
          :key="index"
          draggable
          @dragstart="dragList($event, list.id)"
        >
          {{ list.name }}
        </div>
      </div>
      <div
        class="bg-secondary p-2 m-2 w-100"
        @drop="dropList($event, 'B')"
        @dragover.prevent
        @dragenter.prevent
      >
        <h2 class="text-light">Category B</h2>
        <div
          class="bg-white m-2 p-2"
          v-for="(list, index) in CategoryB"
          :key="index"
          draggable
          @dragstart="dragList($event, list.id)"
        >
          {{ list.name }}
        </div>
      </div>
      <div
        class="bg-secondary p-2 m-2 w-100"
        @drop="dropList($event, 'C')"
        @dragover.prevent
        @dragenter.prevent
      >
        <h2 class="text-light">Category C</h2>
        <div
          class="bg-white m-2 p-2"
          v-for="(list, index) in CategoryC"
          :key="index"
          draggable
          @dragstart="dragList($event, list.id)"
        >
          {{ list.name }}
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      message: "HTML Drag&Drop in vue.js page",
      lists: [
        {
          id: 1,
          name: "ProductA",
          category: "A"
        },
        {
          id: 2,
          name: "ProductB",
          category: "B"
        },
        {
          id: 3,
          name: "ProductC",
          category: "B"
        },
        {
          id: 4,
          name: "ProductD",
          category: "C"
        },
        {
          id: 5,
          name: "ProductE",
          category: "A"
        }
      ]
    };
  },
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
    },
    dropList(event, dropCategory) {
      console.log("dropList");
      console.log(event);
      let targetList = event.dataTransfer.items;
      console.log(targetList);
      for (let index = 0; index < targetList.length; index++) {
        const element = targetList[index];
        console.log(element);
        element.getAsString(targetItem => {
          const targetItemId = JSON.parse(targetItem).itemId;
          console.log(targetItemId);
          const dragList = this.lists.find(
            list => list.id === Number(targetItemId)
          );
          console.log(dragList);
          dragList.category = dropCategory;
        });
      }
    },
    dragList(event, targetItemId) {
      console.log("dragList");
      let targetList = event.dataTransfer.items;
      console.log(event);
      console.log(targetList);
      console.log(targetItemId);
      targetList.add('{"itemId":"' + targetItemId + '"}', "text/plain");
      console.log(targetList);
    }
  },
  computed: {
    CategoryA() {
      return this.lists.filter(list => list.category === "A");
    },
    CategoryB() {
      return this.lists.filter(list => list.category === "B");
    },
    CategoryC() {
      return this.lists.filter(list => list.category === "C");
    }
  }
};
</script>
