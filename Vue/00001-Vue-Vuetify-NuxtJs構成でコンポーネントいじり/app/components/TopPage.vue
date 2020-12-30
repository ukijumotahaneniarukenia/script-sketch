<template>
  <v-app>
    <div>
      トップページ
    </div>
  </v-app>
</template>

<script>
export default {
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
}
</script>
