<template>
  <v-app>
    <Header />
    <v-main>
      <nuxt />
    </v-main>
    <Footer />
  </v-app>
</template>

<script>
  import Header from "~/components/Header";
  import Footer from "~/components/Footer";
  export default {
    component: { Header,Footer }
  };
</script>
