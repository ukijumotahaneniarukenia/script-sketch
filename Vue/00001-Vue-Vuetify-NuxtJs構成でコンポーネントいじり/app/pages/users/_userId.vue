<template>
  <div>/users/{{ userId }}</div>
</template>

<script>
export default {
  name: 'UserDetail',
  computed: {
    userId() {
      return this.$route.params.userId
    }
  }
}
</script>
