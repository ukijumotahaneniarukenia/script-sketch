<template>
  <v-app>
    <AboutContents />
  </v-app>
</template>

<script>

  import AboutContents from "~/components/AboutContents";

  export default {
    layout: 'about',
    component: {AboutContents}
  }
</script>
