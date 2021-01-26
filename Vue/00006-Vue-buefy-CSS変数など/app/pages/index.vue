<template>
  <div>
    <button class="button is-info" @click="openModal">Open Modal</button>
    <div id="my-modal" class="modal">
      <div class="modal-background"></div>
      <div id="my-modal-card" class="modal-card" :style="nak5Style">
        <header class="modal-card-head">
          <p class="modal-card-title">Modal title</p>
          <button aria-label="close" class="delete" @click="closeModal"></button>
        </header>
        <section class="modal-card-body nak5-modal-card-body"></section>
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
    return {
    };
  },
  watch: {},
  computed: {
    nak5Style() {
      return {
        '--nak5-modal-card-width' : '700px',
        '--nak5-modal-card-height' : '300px'
      }
    }
  },
  created() {},
  mounted() {
    this.checkStyle();
  },
  methods: {
    checkStyle() {
      const targetDom = document.getElementById("my-modal-card");
      console.log(targetDom);
      console.log(targetDom.style);
      console.log("--nak5-modal-card-width",window.getComputedStyle(targetDom).getPropertyValue("--nak5-modal-card-width"));
      console.log("--nak5-modal-card-height",window.getComputedStyle(targetDom).getPropertyValue("--nak5-modal-card-height"));
      // computedより mounted が勝つ
      targetDom.style.setProperty("--nak5-modal-card-width", '500px');
      targetDom.style.setProperty("--nak5-modal-card-height", '100px');
      console.log(targetDom.style);
      console.log("--nak5-modal-card-width",window.getComputedStyle(targetDom).getPropertyValue("--nak5-modal-card-width"));
      console.log("--nak5-modal-card-height",window.getComputedStyle(targetDom).getPropertyValue("--nak5-modal-card-height"));
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

<style>
.nak5-modal-card-body {
  background-color: cadetblue;
}

#my-modal-card {
  --nak5-modal-card-width: 300px;
  --nak5-modal-card-height: 200px;
  width: var(--nak5-modal-card-width);
  height: var(--nak5-modal-card-height);
}
</style>
