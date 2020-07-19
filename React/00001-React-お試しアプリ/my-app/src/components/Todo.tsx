import React, { useState } from "react";

//状態はどのコンポーネントにも差し込める

//App側で設定したブラウザの入力情報などを使って、コンポーネント単位にブラウザイベントを定義できる
export default function Todo(props:any) {

    //TODO一覧一件ずつに編集内容の状態を保持するため、useStateを導入
    const [isEditing, setEditing] = useState(false);
    const [newName, setNewName] = useState('');//編集時、新しい名前の入力テキストのデフォルト値を空文字に設定


    function handleChange(e:any) {
        setNewName(e.target.value);
    }

    function handleSubmit(e:any) {
        e.preventDefault();//submitイベントのデフォルトの動きを抑止
        props.editTask(props.id, newName);//idと新しい名前を引数にeditTask処理を呼び出す
        setNewName("");//newNameプロパティ初期化
        setEditing(false);//送信後、非編集モードに切り替える
    }

    const editingTemplate = (
        <form className="stack-small" onSubmit={handleSubmit}>
            <div className="form-group">
                <label className="todo-label" htmlFor={props.id}>
                    New name for {props.name}
                </label>
                <input
                    id={props.id}
                    className="todo-text"
                    type="text"
                    onChange={handleChange}
                />
            </div>
            <div className="btn-group">
                <button
                    type="button"
                    className="btn todo-cancel"
                    onClick={() => setEditing(false)}//Cancelボタンを押下時に非編集モードに切り替える
                >
                    Cancel
                    <span className="visually-hidden">renaming {props.name}</span>
                </button>
                <button type="submit" className="btn btn__primary todo-edit">
                    Save
                    <span className="visually-hidden">new name for {props.name}</span>
                </button>
            </div>
        </form>
    );

    const viewTemplate = (
        <div className="stack-small">
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
                    onClick={() => setEditing(true)}//Editボタンを押下時に編集モードに切り替える
                >
                Edit <span className="visually-hidden">{props.name}</span>
                </button>
                <button
                type="button"
                className="btn btn__danger"
                onClick={() => props.deleteTask(props.id)}
                >
                Delete <span className="visually-hidden">{props.name}</span>
                </button>
            </div>
        </div>
    );

    return <li className="todo">{isEditing ? editingTemplate : viewTemplate}</li>;

}