<template>
  <!-- 未完成 -->
  <div @mouseleave="closeSubMenu($event)">
    <div class="my-side-menu">
      <div class="close-button">x</div>
      <aside class="menu">
        <p
          id="menu-label-general"
          class="menu-label"
          @mouseover="openSubMenu($event)"
        >
          <a href="#">General</a>
        </p>
        <p
          id="menu-label-administration"
          class="menu-label"
          @mouseover="openSubMenu($event)"
        >
          <a href="#">Administration</a>
        </p>
        <p
          id="menu-label-transactions"
          class="menu-label"
          @mouseover="openSubMenu($event)"
        >
          <a href="#">Transactions</a>
        </p>
      </aside>
    </div>
    <div
      id="menu-label-general-sub"
      class="my-side-sub-menu"
      style="display: none"
    >
      <div class="close-button">x</div>
      <aside class="menu">
        <p class="menu-label">
          <a href="#">Dashboard</a>
        </p>
        <p class="menu-label">
          <a href="#">Customers</a>
        </p>
      </aside>
    </div>
    <div
      id="menu-label-administration-sub"
      class="my-side-sub-menu"
      style="display: none"
    >
      <div class="close-button">x</div>
      <aside class="menu">
        <p
          id="menu-label-team-settings"
          class="menu-label"
          @mouseover="openSubMenu($event)"
        >
          <a href="#">Team Settings</a>
        </p>
        <p class="menu-label">
          <a href="#">Manage Your Team</a>
        </p>
      </aside>
    </div>
    <div
      id="menu-label-team-settings-sub"
      class="my-side-sub-menu"
      style="display: none"
    >
      <div class="close-button">x</div>
      <aside class="menu">
        <p class="menu-label">
          <a href="#">Members</a>
        </p>
        <p class="menu-label">
          <a href="#">Plugins</a>
        </p>
        <p class="menu-label">
          <a href="#">Add a member</a>
        </p>
      </aside>
    </div>
    <div
      id="menu-label-transactions-sub"
      class="my-side-sub-menu"
      style="display: none"
    >
      <div class="close-button">x</div>
      <aside class="menu">
        <p class="menu-label">
          <a href="#">Payments</a>
        </p>
        <p class="menu-label">
          <a href="#">Transfers</a>
        </p>
        <p class="menu-label">
          <a href="#">Balance</a>
        </p>
      </aside>
    </div>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      currentSubMenuId: "",
    };
  },
  methods: {
    closeAllSubMenu() {
      const subMenuList = document.querySelectorAll(".my-side-sub-menu");
      for (let index = 0; index < subMenuList.length; index++) {
        const subMenu = subMenuList[index];
        subMenu.style.display = "none";
      }
    },
    openSubMenu(event) {
      this.closeAllSubMenu();
      const targetDom = event.target;
      const targetDomId = targetDom.getAttribute("id");
      if (targetDomId === null) {
        return;
      }
      if (targetDomId.match(/-sub$/)) {
        return;
      }
      this.currentSubMenuId = `${targetDomId}-sub`;
      document.getElementById(`${targetDomId}-sub`).style.display = "block";
    },
    closeSubMenu(event) {
      document.getElementById(this.currentSubMenuId).style.display = "none";
    },
  },
};
</script>

<style>
p {
  transition-duration: 2s;
}
.menu-label {
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 10px;
}
.my-side-menu {
  position: relative;
  height: 100vh;
  width: 30vw;
  position: fixed;
  z-index: 1;
  top: 0px;
  right: 0px;
  background-color: #f6f6f4;
  transition: 0.5s;
}

.my-side-sub-menu {
  position: relative;
  height: 100vh;
  width: 30vw;
  position: fixed;
  z-index: 1;
  top: 0px;
  right: 30%;
  background-color: #f6f6f4;
  transition: 0.5s;
}
@media screen and (max-width: 425px) {
  .my-side-menu {
    position: relative;
    height: 100vh;
    width: 100vw;
    position: fixed;
    z-index: 1;
    top: 0px;
    right: 0px;
    background-color: #f6f6f4;
    transition: 0.5s;
  }
  .my-side-sub-menu {
    height: 100vh;
    width: 100vw;
    position: fixed;
    z-index: 1;
    top: 0px;
    right: 0px;
    background-color: #f6f6f4;
    transition: 0.5s;
  }
}
.close-button {
  background-color: rgb(36, 41, 46);
  color: rgb(255, 255, 255);
  cursor: pointer;
  display: inline-block;
  font-family: arial;
  position: absolute;
  top: 10px;
  right: 10px;
  font-size: 14px;
  line-height: 18px;
  width: 18px;
  height: 18px;
  text-align: center;
}
</style>
