<template>
  <div>
    <h1>/menu/{{ menuId }}/subMenu/{{ subMenuId }}</h1>
  </div>
</template>
<script>
export default {
  name: "subMenuDataDetails",
  created() {
    console.log(this.$route.params)
  },
  computed: {
    menuId() {
      return this.$route.params.menuId;
    },
    subMenuId() {
      return this.$route.params.subMenuId;
    }
  }
};
</script>
