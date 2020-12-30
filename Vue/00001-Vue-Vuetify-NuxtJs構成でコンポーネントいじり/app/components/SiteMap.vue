<template>
  <v-app id="default-site-map">
    <v-container id="default-site-map-container">
      <v-list>
        <v-subheader>Site Map</v-subheader>
        <v-list-item-group color="primary">
          <v-list-item v-for="(item, i) in items" :key="i" :to="item.to" router>
            <v-list-item-icon>
              <v-icon v-text="item.icon"></v-icon>
            </v-list-item-icon>
            <v-list-item-content>
              <v-list-item-title v-text="item.title"></v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-container>
  </v-app>
</template>

<script>
export default {
  computed: {
    items() {
      return this.$store.state.pageMenu.pageList;
    }
  },
  methods: {
    addRouteInfo: function (targetRouteInfo) {
      this.$store.commit('routeHistoryInfo/pushItem', targetRouteInfo)
    }
    ,removeRouteInfo: function (targetRouteInfo) {
      this.$store.commit('routeHistoryInfo/popItem', targetRouteInfo)
    }
  },
  created(){
    let routeItem = {
      text : this.$router.currentRoute.path === '/' ? 'TOP' : this.$router.currentRoute.path.slice(1).toUpperCase(),
      disabled: false,
      href: this.$router.currentRoute.path === '/' ? '/' : this.$router.currentRoute.path.slice(1)
    }
    let isExists = this.$store.state.routeHistoryInfo.routeHistoryList.some(item => item.href === routeItem.href)
    if (isExists) {
      this.removeRouteInfo(routeItem)
    }else{
      this.addRouteInfo(routeItem)
    }
  },
};
</script>

<style>
#default-site-map {
  /* https://vuetifyjs.com/en/styles/colors/ */
  background-color: #bec4b8;
}
#default-site-map-container {
  /* https://vuetifyjs.com/en/styles/colors/ */
  background-color: #d4e157;
}
</style>
