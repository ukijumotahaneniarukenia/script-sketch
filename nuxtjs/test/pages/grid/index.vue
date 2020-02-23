<template>
  <div>
    <magic-grid>
      <card
        v-for="(x, i) in data"
        :key="i"
        :image="x.image"
        :title="x.title"
        :body="x.body" />
    </magic-grid>
  </div>
</template>

<script>
import card from "../../components/Card.vue";

export default {
  name: "grid",
  components: {
    card
  },
  async asyncData({ $axios }) {
    const imagesData = await $axios.$get(`/data/images.json`);
    return { data: imagesData };
  }
};
</script>
