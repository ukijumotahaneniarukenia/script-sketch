<template>
  <v-dialog v-model="openUpdateFoodDialog" max-width="500px" persistent>
    <v-card>
      <v-card-title>
        <v-layout style="justify-content:center">
          <span class="headline">Update Food</span>
        </v-layout>
      </v-card-title>

      <v-card-text>
        <v-container>
          <v-row>
            <v-col cols="12" sm="6" md="4">
              <v-text-field
                v-model="name"
                label="Dessert name"
              ></v-text-field>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-text-field
                v-model="calories"
                label="Calories"
              ></v-text-field>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-text-field
                v-model="fat"
                label="Fat (g)"
              ></v-text-field>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-text-field
                v-model="carbs"
                label="Carbs (g)"
              ></v-text-field>
            </v-col>
            <v-col cols="12" sm="6" md="4">
              <v-text-field
                v-model="protein"
                label="Protein (g)"
              ></v-text-field>
            </v-col>
          </v-row>
        </v-container>
      </v-card-text>

      <v-card-actions>
        <v-layout style="justify-content:center">
          <v-btn color="blue darken-1" text @click="closeUpdateFoodDialog">
            Cancel
          </v-btn>
          <v-btn color="blue darken-1" text @click="updateItemExecute">
            Update
          </v-btn>
        </v-layout>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
export default {

  props: {
    openUpdateFoodDialog: {
      type: Boolean,
      default: false
    },
    closeUpdateFoodDialog: {
      type: Function,
      default: {}
    },

    // コンポーネントの引数に指定した値はcomputedとdomないで参照できるがそれ自身の変更を管理できない 不便
    // updateFoodItem: {
    //   type: Object,
    //   default: {}
    // }
  },

  data: () => ({
    // ということでローカルストレージで代用 が バグっぽい挙動が。。。
    updateFoodItem: {},
    name: "",
    calories: 0,
    fat: 0,
    carbs: 0,
    protein: 0
  }),

  created() {
    this.initialize();
  },

  methods: {
    initialize() {
      console.log('food update')
      console.log(window.localStorage.getItem('updateFoodItem'))
      this.updateFoodItem = JSON.parse(window.localStorage.getItem('updateFoodItem'))
      console.log(this.updateFoodItem)
      console.log(this.updateFoodItem.name)
      this.name = this.updateFoodItem.name
      // this.calories = this.updateFoodItem.calories
      // this.fat = this.updateFoodItem.fat
      // this.carbs = this.updateFoodItem.carbs
      // this.protein = this.updateFoodItem.protein
      // console.log(this.updateFoodItem)
    },

    updateItemExecute() {
      const updateItem = {
        name: this.name,
        calories: this.calories,
        fat: this.fat,
        carbs: this.carbs,
        protein: this.protein
      }
      console.log(updateItem)
      window.localStorage.removeItem('updateFoodItem')
      this.closeUpdateFoodDialog();
    }
  }
};
</script>
