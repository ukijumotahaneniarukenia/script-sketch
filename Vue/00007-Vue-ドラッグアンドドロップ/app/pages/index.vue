<template>
  <div>
    <NuxtLink to="/">
      <b-button variant="outline-primary">
        <b-icon-house></b-icon-house>
        home
      </b-button>
    </NuxtLink>
    <NuxtLink to="/edit">
      <b-button variant="outline-primary">
        <b-icon-pencil></b-icon-pencil>
        edit
      </b-button>
    </NuxtLink>
  </div>
</template>

<script>
import Vue from 'vue'
import { BootstrapVue, BootstrapVueIcons } from 'bootstrap-vue'

Vue.use(BootstrapVue)
Vue.use(BootstrapVueIcons)

export default {


}
</script>

<style>
</style>
