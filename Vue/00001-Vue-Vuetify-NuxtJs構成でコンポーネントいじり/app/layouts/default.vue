<template>
  <v-app>
    <SignOutPageLink />
    <v-main>
      <PanTrash />
      <nuxt />
    </v-main>
    <Footer />
  </v-app>
</template>

<script>
  import NavigationLeftDrawer from "~/components/NavigationLeftDrawer";
  import SignOutPageLink from "~/components/SignOutPageLink";
  import Footer from "~/components/Footer";
  import PanTrash from "~/components/PanTrash";

  export default {
    component: { NavigationLeftDrawer,SignOutPageLink, Footer, PanTrash }
  };
</script>
