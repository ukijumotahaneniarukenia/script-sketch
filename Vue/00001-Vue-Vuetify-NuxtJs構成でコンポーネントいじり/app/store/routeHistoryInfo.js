export const state = () => ({
  routeHistoryList: [
    // デフォで一ついれておく
    {
      text: 'TOP',
      disabled: false,
      href: '/'
    }
  ],
  routeHistory:{}
})

export const mutations = {
  pushItem(state, routeHistoryInfo) {
    state.routeHistoryList.push(routeHistoryInfo)
    state.routeHistory = routeHistoryInfo
  },
  popItem(state, routeHistoryInfo) {
    // state.routeHistoryList = state.routeHistoryList.filter((item)=>{
    //   return item !== routeHistoryInfo
    // })
    state.routeHistoryList.filter((item)=>{
      return item !== routeHistoryInfo
    })
  },
}
