<template>
  <div>
    <b-button id="open-menu" variant="success">Open Menu</b-button>
    <div>
      <div id="menu" style="width: 1920px;height:780px">
        <b-button
          id="close-menu"
          variant="success"
          style="position: absolute;top: 10px;right: 10px;"
          >Close Menu</b-button
        >
        うんこ
        うんこ
        うんこ
        うんこ
        うんこ
        うんこ
        うんこ
        うんこ
        うんこ
      </div>
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
      const targetToggleDom = document.getElementById("menu");
      targetDom.addEventListener("click", e => {
        console.log(targetToggleDom.classList)
        // targetToggleDom.classList.remove("close")
        targetToggleDom.classList = ''
        targetToggleDom.classList.add("open");
        console.log(targetToggleDom.classList)
      });
    },
    closeMenu() {
      const targetDom = document.getElementById("close-menu");
      const targetToggleDom = document.getElementById("menu");
      targetDom.addEventListener("click", e => {
        console.log(targetToggleDom.classList)
        // targetToggleDom.classList.remove("open")
        targetToggleDom.classList = ''
        targetToggleDom.classList.add("close");
        console.log(targetToggleDom.classList)
      });
    }
  }
};
</script>

<style>
#menu {
  position: absolute;
  top: -780px;
  background: #93c7d6;
  border-radius: 50px;
  text-align: center;
}

.close {
  /* フォントのブレを修正 */
  font-size: 1rem;
  font-weight:400;
  line-height:1.5;
  animation: 0.5s move-to-up forwards;
}

.open {
  animation: 0.5s move-to-down forwards;
}

@keyframes move-to-down {
  0% {
    transform: translateY(0px);
  }
  100% {
    transform: translateY(780px);
  }
}

@keyframes move-to-up {
  0% {
    transform: translateY(780px);
  }
  100% {
    transform: translateY(0px);
  }
}
</style>
