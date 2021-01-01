import React, { Component } from "react";
import PropTypes from "prop-types";

class Counter extends Component {
  constructor(props) {
    super(props);
    this.incrementAsync = this.incrementAsync.bind(this);
    this.incrementIfOdd = this.incrementIfOdd.bind(this);
  }

  incrementIfOdd() {
    if (this.props.value % 2 !== 0) {
      this.props.onIncrement();
    }
  }

  incrementAsync() {
    setTimeout(this.props.onIncrement, 1000);
  }

  render() {

    // 引数処理
    const { value, onIncrement, onDecrement } = this.props;

    return (
      <p>
        Clicked: {value} times
        {/* 状態変数のイベントハンドラに定義 */}
        <button onClick={onIncrement}>+</button>{" "}
        {/* 状態変数のイベントハンドラに定義 */}
        <button onClick={onDecrement}>-</button>{" "}
        {/* 自身の関数をイベントハンドラに定義 */}
        <button onClick={this.incrementIfOdd}>Increment if odd</button>{" "}
        {/* 自身の関数をイベントハンドラに定義 */}
        <button onClick={this.incrementAsync}>Increment async</button>
      </p>
    );
  }
}

// 引数の型定義
Counter.propTypes = {
  value: PropTypes.number.isRequired,
  onIncrement: PropTypes.func.isRequired,
  onDecrement: PropTypes.func.isRequired,
};

export default Counter;
