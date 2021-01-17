<template>
  <div>
    <b-button id="open-menu" variant="success">Open Menu</b-button>
    <div>
      <ul>
        <b-button id="close-menu" variant="success" style="position: absolute;top: 10px;right: 10px;">Close Menu</b-button>
        <li><a href="#">home</a></li>
        <li><a href="#">about</a></li>
        <li><a href="#">portfolio</a></li>
        <li><a href="#">blog</a></li>
        <li><a href="#">contact</a></li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  layout: "edit",
  mounted() {
    this.openMenu();
    this.closeMenu();
  },
  methods: {
    openMenu() {
      const targetDom = document.getElementById("open-menu");
      const targetToggleDom = document.querySelector("ul");
      targetDom.addEventListener('click', e => {
        targetToggleDom.classList.toggle("open");
      })
    },
    closeMenu() {
      const targetDom = document.getElementById("close-menu");
      const targetToggleDom = document.querySelector("ul");
      targetDom.addEventListener('click', e => {
        targetToggleDom.classList.toggle("open");
      })
    }
  }
};
</script>

<style>
ul {
  list-style: none;
  background: #93c7d6;
  visibility: hidden;
  border-radius: 50px;
  opacity: 0;
}

ul.open {
  position: absolute;
  top: 0;
  min-height: 780px;
  min-width: 1920px;
  visibility: visible;
  opacity: 1;
  animation: 1.25s bounce infinite;
}

@keyframes bounce {
  0% {
    margin-top: 0;
  }
  50% {
    margin-top: -15px;
    margin-bottom: 15px;
  }
  100% {
    margin-top: 0;
  }
}
</style>
