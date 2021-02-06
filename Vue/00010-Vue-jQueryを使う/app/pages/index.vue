<template>
  <div>
    <ul>
      <li v-for="(item, key) of items" :key="key">
        <nuxt-link :to="item.to">
          <b-icon :icon="item.icon" /> {{ item.title }}
        </nuxt-link>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      items: [
        {
          title: "Home",
          icon: "home",
          to: { name: "index" },
        },
        {
          title: "sketch-jquery",
          icon: "lightbulb",
          to: { name: "sketch-jquery" },
        },
        {
          title: "jquery-ui-slide-dnd",
          icon: "lightbulb",
          to: { name: "jquery-ui-slide-dnd" },
        },
        {
          title: "jquery-ui-slide-dnd-bulma",
          icon: "lightbulb",
          to: { name: "jquery-ui-slide-dnd-bulma" },
        },
      ],
    };
  },
};
</script>
