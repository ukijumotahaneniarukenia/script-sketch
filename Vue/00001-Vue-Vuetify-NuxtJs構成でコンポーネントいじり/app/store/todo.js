export const state = () => ({
  list: [
    {
      done: false,
      text: 'うんこ'
    },
    {
      done: true,
      text: '朝食'
    },
    {
      done: true,
      text: '夕食'
    }
  ]
})

export const mutations = {
  add(state, text) {
    state.list.push({
      text,
      done: false
    })
  },
  remove(state, { todo }) {
    state.list.splice(state.list.indexOf(todo), 1)
  },
  toggle(state, todo) {
    todo.done = !todo.done
  }
}
