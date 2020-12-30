export const state = () => ({
  userList: [],
  signInUserInfo:{}
})

export const mutations = {
  signIn(state, userInfo) {
    state.userList.push(userInfo)
    state.signInUserInfo = userInfo
  },
  signOut(state, userInfo) {
    state.userList.splice(state.userList.indexOf(userInfo), 1)
  },
}
