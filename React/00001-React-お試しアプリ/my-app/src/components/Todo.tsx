import React from 'react';

//App側で設定したブラウザの入力情報などを使って、コンポーネント単位にブラウザイベントを定義できる
export default function Todo(props:any) {

    return (
        <li className="todo stack-small">
            <div className="c-cb">
                <input 
                    id={props.id}
                    type="checkbox"
                    defaultChecked={props.completed} 
                    onChange={() => props.toggleTaskCompleted(props.id)}//チェック・アンチェックごとにブラウザのレンダラ状態を入力動作と同期する
                />
                <label className="todo-label" htmlFor={props.id}>
                    {props.name}
                </label>
            </div>
            <div className="btn-group">
                <button
                    type="button"
                    className="btn"
                    >
                    Edit
                    <span className="visually-hidden">{props.name}</span>
                </button>
                <button
                    type="button"
                    className="btn btn__danger"
                    onClick={() => props.deleteTask(props.id)}
                    >
                    Delete
                    <span className="visually-hidden">{props.name}</span>
                </button>
            </div>
        </li>
    );
}