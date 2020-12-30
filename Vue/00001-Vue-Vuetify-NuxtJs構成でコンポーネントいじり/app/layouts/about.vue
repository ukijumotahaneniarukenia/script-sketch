<template>
  <v-app>
    <AboutPageLink />
    <v-main>
      <nuxt />
    </v-main>
    <Footer />
  </v-app>
</template>

<script>

  import AboutPageLink from "~/components/AboutPageLink";
  import Footer from "~/components/Footer";

  export default {
    computed: {
      todos () {
        return this.$store.state.todo.list
      }
    },
    component: {AboutPageLink, Footer}
  }
</script>
