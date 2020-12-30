<template>
  <v-app>
    <SignInPageLink />
    <v-main>
      <nuxt />
    </v-main>
    <Footer />
  </v-app>
</template>

<script>
import SignInPageLink from "~/components/SignInPageLink";
import Footer from "~/components/Footer";

export default {
  component: { SignInPageLink, Footer }
};
</script>
