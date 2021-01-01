import reportWebVitals from "./reportWebVitals";
import React from "react";
import ReactDOM from "react-dom";
import { createStore } from "redux";
import Counter from "./components/Counter";
import {CounterActionPatten} from "./reducers/CounterActionPatten";

const store = createStore(CounterActionPatten);
const rootEl = document.getElementById("root");

console.log(store)
console.log(store.getState())

const render = () =>
  ReactDOM.render(
    <Counter
      value={store.getState()}
      // アクションパターンごとの状態変更はコンポーネントに処理を委譲
      // 仮引数の名前はコンポーネントでのメソッド名と一致している必要がある
      // 関数の参照をコンポーネントに引数として与えることでコンポーネント側でイベントごとに関数の振る舞いを定義できる
      onIncrement={() => store.dispatch({ type: "INCREMENT" })}
      onDecrement={() => store.dispatch({ type: "DECREMENT" })}
    />,
    rootEl
  );

render();
store.subscribe(render);
reportWebVitals();
