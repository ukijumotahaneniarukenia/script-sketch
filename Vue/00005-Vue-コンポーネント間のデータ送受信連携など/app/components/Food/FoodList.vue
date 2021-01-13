<template>
  <div>
    <v-layout style="justify-content: center">
      <p>コンポーネント間のデータ送受信など。。。</p>
    </v-layout>
    <v-data-table
      :headers="headers"
      :items="desserts"
      class="elevation-1"
    >
      <template v-slot:top>
        <v-toolbar flat>
          <v-layout style="justify-content: center">
            <v-btn color="primary" dark class="mb-2" @click="createItem">
              Create Item
            </v-btn>
          </v-layout>


          <FoodCreate
            :openCreateFoodDialog = openCreateFoodDialog
            :closeCreateFoodDialog = closeCreateFoodDialog
          />

          <FoodUpdate
            :openUpdateFoodDialog = openUpdateFoodDialog
            :closeUpdateFoodDialog = closeUpdateFoodDialog
          />

          <FoodDelete
            :deleteFoodItem = deleteFoodItem
            :openDeleteFoodDialog = openDeleteFoodDialog
            :closeDeleteFoodDialog = closeDeleteFoodDialog
          />


        </v-toolbar>
      </template>
      <template v-slot:item="props">
        <tr>
          <td>{{ props.item.name }}</td>
          <td>{{ props.item.calories }}</td>
          <td>{{ props.item.fat }}</td>
          <td>{{ props.item.carbs }}</td>
          <td>{{ props.item.protein }}</td>
          <td>
            <v-icon small class="mr-2" @click="updateItem(props.item)">
              mdi-pencil
            </v-icon>
            <v-icon small @click="deleteItem(props.item)">
              mdi-delete
            </v-icon>
          </td>
        </tr>
      </template>
    </v-data-table>
  </div>
</template>

<script>

import FoodCreate from "~/components/Food/FoodCreate";
import FoodUpdate from "~/components/Food/FoodUpdate";

export default {
  components: {
    FoodCreate,
    FoodUpdate
  },
  data: () => ({
    deleteFoodItem: {},
    // updateFoodItem: {},
    openCreateFoodDialog: false,
    openUpdateFoodDialog: false,
    openDeleteFoodDialog: false,
    headers: [
      {
        text: "Dessert (100g serving)",
        align: "start",
        sortable: false,
        value: "name"
      },
      { text: "Calories", value: "calories" },
      { text: "Fat (g)", value: "fat" },
      { text: "Carbs (g)", value: "carbs" },
      { text: "Protein (g)", value: "protein" },
      { text: "Actions", value: "actions", sortable: false }
    ],
    desserts: [],
  }),

  created() {
    this.initialize();
  },

  methods: {
    createItem() {
      this.openCreateFoodDialog = true;
    },
    closeCreateFoodDialog() {
      this.openCreateFoodDialog = false;
    },
    updateItem(item) {
      // this.updateFoodItem = item
      console.log(JSON.stringify(item))
      window.localStorage.removeItem('updateFoodItem')
      window.localStorage.setItem('updateFoodItem', JSON.stringify(item))
      console.log(window.localStorage.getItem('updateFoodItem'))
      this.openUpdateFoodDialog = true;
    },
    closeUpdateFoodDialog() {
      window.localStorage.removeItem('updateFoodItem')
      this.openUpdateFoodDialog = false;
    },
    deleteItem(item) {
      this.deleteFoodItem = item
      this.openDeleteFoodDialog = true;
    },
    closeDeleteFoodDialog() {
      this.openDeleteFoodDialog = false;
    },
    initialize() {
      this.desserts = [
        {
          name: "Frozen Yogurt",
          calories: 159,
          fat: 6.0,
          carbs: 24,
          protein: 4.0
        },
        {
          name: "Ice cream sandwich",
          calories: 237,
          fat: 9.0,
          carbs: 37,
          protein: 4.3
        },
        {
          name: "Eclair",
          calories: 262,
          fat: 16.0,
          carbs: 23,
          protein: 6.0
        },
        {
          name: "Cupcake",
          calories: 305,
          fat: 3.7,
          carbs: 67,
          protein: 4.3
        },
        {
          name: "Gingerbread",
          calories: 356,
          fat: 16.0,
          carbs: 49,
          protein: 3.9
        },
        {
          name: "Jelly bean",
          calories: 375,
          fat: 0.0,
          carbs: 94,
          protein: 0.0
        },
        {
          name: "Lollipop",
          calories: 392,
          fat: 0.2,
          carbs: 98,
          protein: 0
        },
        {
          name: "Honeycomb",
          calories: 408,
          fat: 3.2,
          carbs: 87,
          protein: 6.5
        },
        {
          name: "Donut",
          calories: 452,
          fat: 25.0,
          carbs: 51,
          protein: 4.9
        },
        {
          name: "KitKat",
          calories: 518,
          fat: 26.0,
          carbs: 65,
          protein: 7
        }
      ];
    }
  }
};
</script>
