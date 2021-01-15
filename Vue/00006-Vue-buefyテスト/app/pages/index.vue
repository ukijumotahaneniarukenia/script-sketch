<template>
<!-- https://blog.bulkus.net/post/vue_bulma/ -->
  <section>
    <div id="mobile">
      <b-sidebar
        type="is-light"
        :fullheight="fullheight"
        :fullwidth="fullwidth"
        :overlay="overlay"
        :right="right"
        v-model="open"
      >
        <div class="p-1">
          <img
            src="https://raw.githubusercontent.com/buefy/buefy/dev/static/img/buefy-logo.png"
            alt="Lightweight UI components for Vue.js based on Bulma"
          />
          <b-menu>
            <b-menu-list label="Menu">
              <b-menu-item icon="information-outline" label="Info"></b-menu-item>
              <b-menu-item icon="settings">
                <template #label="props">
                  Administrator
                  <b-icon class="is-pulled-right" :icon="props.expanded ? 'menu-down' : 'menu-up'"></b-icon>
                </template>
                <b-menu-item icon="account" label="Users"></b-menu-item>
                <b-menu-item icon="cellphone-link">
                  <template #label>
                    Devices
                    <b-dropdown aria-role="list" class="is-pulled-right" position="is-bottom-left">
                          <template #trigger>
                              <b-icon icon="dots-vertical"></b-icon>
                          </template>
                          <b-dropdown-item aria-role="listitem">Action</b-dropdown-item>
                          <b-dropdown-item aria-role="listitem">Another action</b-dropdown-item>
                          <b-dropdown-item aria-role="listitem">Something else</b-dropdown-item>
                    </b-dropdown>
                  </template>
                </b-menu-item>
                <b-menu-item icon="cash-multiple" label="Payments" disabled></b-menu-item>
              </b-menu-item>
              <b-menu-item icon="account" label="My Account">
                <b-menu-item label="Account data"></b-menu-item>
                <b-menu-item label="Addresses"></b-menu-item>
              </b-menu-item>
            </b-menu-list>
            <b-menu-list>
              <b-menu-item label="Expo" icon="link" tag="router-link" target="_blank" to="/expo"></b-menu-item>
            </b-menu-list>
            <b-menu-list label="Actions">
              <b-menu-item label="Logout"></b-menu-item>
            </b-menu-list>
          </b-menu>
        </div>
      </b-sidebar>
    </div>
    <div id="desktop">
      <b-sidebar
        id="desktop"
        type="is-light"
        :fullheight="fullheight"
        :fullwidth="fullwidth"
        :overlay="overlay"
        :right="right"
        v-model="open"
      >
        <div class="p-1">
          <img
            src="https://raw.githubusercontent.com/buefy/buefy/dev/static/img/buefy-logo.png"
            alt="Lightweight UI components for Vue.js based on Bulma"
          />
          <b-menu>
            <b-menu-list label="Menu">
              <b-menu-item icon="information-outline" label="Info"></b-menu-item>
              <b-menu-item icon="settings">
                <template #label="props">
                  Administrator
                  <b-icon class="is-pulled-right" :icon="props.expanded ? 'menu-down' : 'menu-up'"></b-icon>
                </template>
                <b-menu-item icon="account" label="Users"></b-menu-item>
                <b-menu-item icon="cellphone-link">
                  <template #label>
                    Devices
                    <b-dropdown aria-role="list" class="is-pulled-right" position="is-bottom-left">
                          <template #trigger>
                              <b-icon icon="dots-vertical"></b-icon>
                          </template>
                          <b-dropdown-item aria-role="listitem">Action</b-dropdown-item>
                          <b-dropdown-item aria-role="listitem">Another action</b-dropdown-item>
                          <b-dropdown-item aria-role="listitem">Something else</b-dropdown-item>
                    </b-dropdown>
                  </template>
                </b-menu-item>
                <b-menu-item icon="cash-multiple" label="Payments" disabled></b-menu-item>
              </b-menu-item>
              <b-menu-item icon="account" label="My Account">
                <b-menu-item label="Account data"></b-menu-item>
                <b-menu-item label="Addresses"></b-menu-item>
              </b-menu-item>
            </b-menu-list>
            <b-menu-list>
              <b-menu-item label="Expo" icon="link" tag="router-link" target="_blank" to="/expo"></b-menu-item>
            </b-menu-list>
            <b-menu-list label="Actions">
              <b-menu-item label="Logout"></b-menu-item>
            </b-menu-list>
          </b-menu>
        </div>
      </b-sidebar>
      <div class="block">
        <div class="text">うんこ</div>
        <b-field grouped group-multiline>
          <div class="control">
            <b-switch v-model="overlay">Overlay</b-switch>
          </div>
          <div class="control">
            <b-switch v-model="fullheight">Fullheight</b-switch>
          </div>
          <div class="control">
            <b-switch v-model="fullwidth">Fullwidth</b-switch>
          </div>
          <div class="control">
            <b-switch v-model="right">Right</b-switch>
          </div>
        </b-field>
      </div>
      <b-button @click="open = true">Show</b-button>
    </div>
  </section>
</template>

<script>
export default {
  data() {
    return {
      open: false,
      overlay: true,
      fullheight: true,
      fullwidth: false,
      right: false
    };
  },
  mounted() {
    this.hoge()
  },
  methods: {
    hoge() {
      const targetDom = document.getElementById('mobile')
      console.log(targetDom)
      targetDom.style.display = 'none'
    }
  }
};
</script>

<style lang="scss" scoped>

@import "~assets/main.scss";

.text {
  @include hoge(rgb(53, 187, 0), 20px);
}

#mobile {
  width: 300px !important;
}

#desktop {
  width: 50% !important;
}

</style>
