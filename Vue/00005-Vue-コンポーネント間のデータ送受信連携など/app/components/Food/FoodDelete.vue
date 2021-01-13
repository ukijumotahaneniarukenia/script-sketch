<template>
  <v-dialog v-model="openDeleteFoodDialog" max-width="500px" persistent>
    <v-card>
      <v-card-title>
        <v-layout style="justify-content:center">
          <span class="headline">Delete Food</span>
        </v-layout>
      </v-card-title>

      <v-card-text>
        <v-container>
          <v-layout style="justify-content:center">
            <v-text-field
              v-model="name"
              label="Dessert name"
              readonly
            ></v-text-field>
          </v-layout>
        </v-container>
      </v-card-text>

      <v-card-actions>
        <v-layout style="justify-content:center">
          <v-btn color="blue darken-1" text @click="closeDeleteFoodDialog">
            Cancel
          </v-btn>
          <v-btn color="blue darken-1" text @click="deleteItemExecute">
            Delete
          </v-btn>
        </v-layout>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
export default {

  props: {
    openDeleteFoodDialog: {
      type: Boolean,
      default: false
    },
    closeDeleteFoodDialog: {
      type: Function,
      default: {}
    },
    deleteFoodItem: {
      type: Object,
      default: {}
    }
  },

  data: () => ({
  }),

  computed: {
    name() {
      console.log(this.deleteFoodItem)
      return this.deleteFoodItem.name
    }
  },

  created() {
    this.initialize();
  },

  methods: {
    initialize() {
      console.log('food delete')
    },

    deleteItemExecute() {
      console.log('deleteItemExecute')
      console.log(this.deleteFoodItem)
      this.closeDeleteFoodDialog();
    }
  }
};
</script>
