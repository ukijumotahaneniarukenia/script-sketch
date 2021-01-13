<template>
  <v-dialog v-model="openCreateFoodDialog" max-width="500px" persistent>
    <v-card>
      <v-card-title>
        <v-layout style="justify-content:center">
          <span class="headline">Create Food</span>
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
          <v-btn color="blue darken-1" text @click="closeCreateFoodDialog">
            Cancel
          </v-btn>
          <v-btn color="blue darken-1" text @click="createItemExecute">
            Create
          </v-btn>
        </v-layout>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
export default {

  props: {
    openCreateFoodDialog: {
      type: Boolean,
      default: false
    },
    closeCreateFoodDialog: {
      type: Function,
      default: {}
    }
  },

  data: () => ({
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
      console.log('food create')
    },

    createItemExecute() {
      const createItem = {
        name: this.name,
        calories: this.calories,
        fat: this.fat,
        carbs: this.carbs,
        protein: this.protein
      }
      console.log(createItem)
      this.closeCreateFoodDialog();
    }
  }
};
</script>
