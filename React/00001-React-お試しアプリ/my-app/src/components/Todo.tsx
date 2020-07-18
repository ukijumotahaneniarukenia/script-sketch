import React from 'react';

export default function Todo(props:any) {

    //コンポーネント単位にブラウザ情報をもちわましてイベント定義できる
    return (
        <li className="todo stack-small">
        <div className="c-cb">
        <input 
            id={props.id}
            type="checkbox"
            defaultChecked={props.completed} 
            onChange={() => props.toggleTaskCompleted(props.id)} //無名関数
        />
        <label className="todo-label" htmlFor={props.id}>
            {props.name}
        </label>
        </div>
        <div className="btn-group">
        <button type="button" className="btn">
            Edit <span className="visually-hidden">Eat</span>
        </button>
        <button type="button" className="btn btn__danger">
            Delete <span className="visually-hidden">Eat</span>
        </button>
        </div>
        </li>
    );
}