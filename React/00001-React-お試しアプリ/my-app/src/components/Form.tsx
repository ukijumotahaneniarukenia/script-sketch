import React, { useState } from "react";


function Form(props:any) {
    
    const [name, setName] = useState(""); //nameプロパティのデフォルト値を空文字に設定
  
    function handleChange(e:any) {
      //テキストボックスに入力されたことをイベントとして検知する関数定義
      //入力時の情報からテキストボックスのデータをReact側で状態管理
      setName(e.target.value); //イベントを受け取ったら、ブラウザの入力情報をsetterで設定
    }
  
    function handleSubmit(e:any) {

      //Addボタンをはじめとする、送信処理時にApp.tsx側で宣言した際の引数から、ポップアップイベントを実施

      
      e.preventDefault();//submitイベントのデフォルトの動きを抑止
      props.addTask(name);////nameプロパティをタスクとして追加
      setName("");//nameプロパティ初期化
    }


    //reactで管理する関数名ないしはプロパティ名は{}でくくる

    return (
      <form onSubmit={handleSubmit}>
        <h2 className="label-wrapper">
          <label htmlFor="new-todo-input" className="label__lg">
            What needs to be done?
          </label>
        </h2>
        <input
          type="text"
          id="new-todo-input"
          className="input input__lg"
          name="text"
          autoComplete="off"
          value={name}
          onChange={handleChange}
        />
        <button type="submit" className="btn btn__primary btn__lg">
          Add
        </button>
      </form>
    );
  }
  
  export default Form;