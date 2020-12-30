<template>
  <v-app>
    <SignOutPageLink />
    <v-main>
      <nuxt />
    </v-main>
    <Footer />
  </v-app>
</template>

<script>
import SignOutPageLink from "~/components/SignOutPageLink";
import Footer from "~/components/Footer";

export default {
  component: { SignOutPageLink, Footer }
};
</script>
