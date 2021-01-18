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
    dropList(event, dropCategory) {
      console.log("dropList");
      console.log(event);
      console.log(event.dataTransfer.items)
      const dragId = event.dataTransfer.getData("itemId");
      console.log(dragId);
      const dragList = this.lists.find(list => list.id === dragId);
      console.log(dragList);
      dragList.category = dropCategory;
    },
    dragList(event, dragId) {
      console.log("dragList");
      let targetList = event.dataTransfer.items
      console.log(event);
      console.log(targetList);
      console.log(dragId);
      event.dataTransfer.setData("itemId",dragId)
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
