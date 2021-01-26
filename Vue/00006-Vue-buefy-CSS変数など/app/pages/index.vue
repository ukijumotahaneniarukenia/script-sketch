<template>
  <div>
    <button class="button is-info" @click="openModal">Open Modal</button>
    <div id="my-modal" class="modal">
      <div class="modal-background"></div>
      <div class="modal-card" style="width: 800px;height: 300px;">
        <header class="modal-card-head">
          <p class="modal-card-title">Modal title</p>
          <button aria-label="close" class="delete" @click="closeModal"></button>
        </header>
        <section class="modal-card-body"></section>
        <footer class="modal-card-foot">
          <button class="button is-success">Save changes</button>
          <button class="button">Cancel</button>
        </footer>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {};
  },
  watch: {},
  created() {},
  mounted() {
    this.checkStyle();
  },
  methods: {
    checkStyle() {
      const targetDom = document.getElementById("my-modal");
      console.log(targetDom);
      console.log(window.getComputedStyle(targetDom));
    },
    openModal() {
      const targetDom = document.getElementById("my-modal");
      targetDom.classList.add("is-active");
      // console.log(targetDom)
    },
    closeModal() {
      const targetDom = document.getElementById("my-modal");
      targetDom.classList.remove("is-active");
      // console.log(targetDom)
    }
  }
};
</script>

<style lang="sass"></style>
