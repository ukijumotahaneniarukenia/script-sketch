const initialState = {
  count: 0,
}

// アクションごとに状態のみを変更する
const CounterActionPatten = (state = initialState.count, action) => {
  switch (action.type) {
    case "INCREMENT":
      return state + 1;
    case "DECREMENT":
      return state - 1;
    default:
      return state;
  }
};

export {CounterActionPatten}
