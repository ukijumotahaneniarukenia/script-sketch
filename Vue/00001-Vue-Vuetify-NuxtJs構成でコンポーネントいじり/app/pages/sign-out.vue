<template>
  <v-app>
    <SignOutDialog />
  </v-app>
</template>

<script>

  import SignOutDialog from "~/components/SignOutDialog";

  export default {
    layout: 'signOut',
    component: {SignOutDialog}
  }
</script>
