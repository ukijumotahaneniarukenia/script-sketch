<template>
  <v-app>
    <SignInDialog />
  </v-app>
</template>

<script>

  import SignInDialog from "~/components/SignInDialog";

  export default {
    layout: 'signIn',
    component: {SignInDialog}
  }
</script>
