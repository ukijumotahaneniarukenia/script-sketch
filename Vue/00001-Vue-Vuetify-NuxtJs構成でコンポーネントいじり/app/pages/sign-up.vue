<template>
  <v-app>
    <SignUpDialog />
  </v-app>
</template>

<script>

  import SignUpDialog from "~/components/SignUpDialog";

  export default {
    layout: 'signIn',
    component: {SignUpDialog}
  }
</script>
