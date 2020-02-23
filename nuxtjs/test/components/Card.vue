<template>
  <div class="card large">
    <div class="card-image">
      <figure class="image">
        <img v-bind:src="image" alt="Image" />
      </figure>
    </div>
    <div class="card-content content">
      <h6>{{ title }}</h6>
      <p>{{ body }}</p>
    </div>
  </div>
</template>

<script>
export default {
  name: "card",
  props: {
    image: {
      type: String,
      default: ""
    },
    title: {
      type: String,
      default: ""
    },
    body: {
      type: String,
      default: ""
    }
  }
};
</script>
