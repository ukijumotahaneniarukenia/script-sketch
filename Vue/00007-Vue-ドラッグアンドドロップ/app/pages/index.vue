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
    <NuxtLink to="/drag-and-drop/lesson01">
      <b-button variant="outline-primary">
        <b-icon-droplet-fill></b-icon-droplet-fill>
        drag-and-drop
      </b-button>
    </NuxtLink>
    <NuxtLink to="/drag-and-drop/lesson02">
      <b-button variant="outline-primary">
        <b-icon-droplet-fill></b-icon-droplet-fill>
        drag-and-drop
      </b-button>
    </NuxtLink>
  </div>
</template>

<script>

export default {


}
</script>

<style>
</style>
