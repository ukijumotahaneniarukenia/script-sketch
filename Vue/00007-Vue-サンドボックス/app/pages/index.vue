<template>
  <div>
    <div v-for="(routeInfo, index) in routingList" :key="index" style="margin: 5px">
      <NuxtLink :to="routeInfo.routePath">
        <b-button variant="outline-primary">
          {{ routeInfo.displayRoutePathName }}
        </b-button>
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
          routePath: "/responsive-css-media-query-logic",
          displayRoutePathName: "responsive-css-media-query-logic",
        },
        {
          routePath: "/drag-and-drop",
          displayRoutePathName: "drag-and-drop",
        },
        {
          routePath: "/drag-and-drop-component",
          displayRoutePathName: "drag-and-drop-component",
        },
        {
          routePath: "/drag-and-drop-iframe",
          displayRoutePathName: "drag-and-drop-iframe",
        },
        {
          routePath: "/drag-and-drop-slide",
          displayRoutePathName: "drag-and-drop-slide",
        },
        {
          routePath: "/dragable-resize-dom",
          displayRoutePathName: "dragable-resize-dom",
        },
        {
          routePath: "/hover-menu",
          displayRoutePathName: "hover-menu",
        },
        {
          routePath: "/iframe",
          displayRoutePathName: "iframe",
        },
        {
          routePath: "/resize-dom",
          displayRoutePathName: "resize-dom",
        },
        {
          routePath: "/css-variable",
          displayRoutePathName: "css-variable",
        },
      ],
    };
  },
};
</script>

<style>
</style>
