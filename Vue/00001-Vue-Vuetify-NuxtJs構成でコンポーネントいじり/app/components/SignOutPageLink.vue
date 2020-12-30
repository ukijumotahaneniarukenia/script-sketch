<template>
  <v-app-bar
    id="sign-out-app-page-link-bar"
    app
    flat
  >
    <v-tabs
      centered
    >
      <v-tab
        v-for="(item, i) in items"
        :key="i"
        :to="item.to"
        router
      >
        <v-icon>{{ item.icon }}</v-icon>
        <span>{{ item.title }}</span>
      </v-tab>
    </v-tabs>

  </v-app-bar>
</template>

<script>
  export default {
    computed: {
      items () {
        return this.$store.state.pageMenu.pageList
      }
    },
  }
</script>


<style>
#sign-out-app-page-link-bar{
  /* https://vuetifyjs.com/en/styles/colors/ */
  background-color: #DCEDC8;
}
</style>
