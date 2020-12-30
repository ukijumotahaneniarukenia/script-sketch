<template>
  <v-app>
    <v-container ma-0>
      <v-layout>
        <v-flex>
          <NavigationLeftDrawer />
        </v-flex>
        <v-flex>
          <DashBoard />
        </v-flex>
        <v-flex>
          <DashBoard />
        </v-flex>
      </v-layout>
    </v-container>
  </v-app>
</template>

<script>
  import DashBoard from "~/components/DashBoard";
  import NavigationLeftDrawer from "~/components/NavigationLeftDrawer";

  export default {
    layout :  'dashboard',
    component: {DashBoard,NavigationLeftDrawer}
  }
</script>
