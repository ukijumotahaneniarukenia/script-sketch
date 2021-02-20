<template>
  <div>
    <div v-for="(routeInfo, index) in routingList" :key="index" style="margin: 5px">
      <NuxtLink :to="routeInfo.routePath">
        <button>
          {{ routeInfo.displayRoutePathName }}
        </button>
      </NuxtLink>
    </div>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      routingList: [
        {
          routePath: "/",
          displayRoutePathName: "home",
        },
        {
          routePath: "/pane-layout",
          displayRoutePathName: "pane-layout",
        },
      ],
    };
  },
};
</script>

<style>
</style>
