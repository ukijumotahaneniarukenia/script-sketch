import React from "react";

function FilterButton(props:any) {
  return (
    <button
      type="button"
      className="btn toggle-btn"
      aria-pressed={props.isPressed}//押した状態を点線で囲む
      onClick={() => props.setFilter(props.name)}//クリックした際、nameを引数にsetFilter処理をよぶ
    >
      <span className="visually-hidden">Show </span>
      <span>{props.name}</span>
      <span className="visually-hidden"> tasks</span>
    </button>
  );
}

export default FilterButton;