<template>
  <v-breadcrumbs :items="breadcrumbs" divider=">">
    <template v-slot:item="props">
      <v-breadcrumbs-item
        exact
        :disabled="props.item.disabled"
        :to="props.item.href"
        nuxt
      >
        {{ props.item.text }}
      </v-breadcrumbs-item>
    </template>
  </v-breadcrumbs>
</template>

<script>
  export default {
    computed: {
      breadcrumbs () {
        return this.$store.state.routeHistoryInfo.routeHistoryList
      }
    },
  }
</script>
