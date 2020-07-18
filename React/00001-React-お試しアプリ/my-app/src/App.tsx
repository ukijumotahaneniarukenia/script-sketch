import React, { useState } from "react";
import logo from './logo.svg';
import './App.css';

import Todo from "./components/Todo";
import Form from "./components/Form";
import FilterButton from "./components/FilterButton";

import { nanoid } from "nanoid"; //id生成用

//Appがコントローラ
//index.tsxで渡された引数をpropsで受け取っている Beanみたいなもん
function App(props:any) {

  const [tasks, setTasks] = useState(props.tasks); //Reactの特徴は状態を保持する変数と変数を更新する設定関数をuseStateから定義できる

  //タスク追加処理
  function addTask(name:any) {
    const newTask = {id:"todo-"+nanoid(),name:name,colmpleted:false} //idは一意にしたいので、ライブラリのちから借りて番号フル
    setTasks([...tasks,newTask]) //配列のスプレッド展開でflatten
  }

  //タスク削除処理
  function deleteTask(id:any) {
    const remainingTasks = tasks.filter((task:any) => id !== task.id);//削除対象タスクID以外は残タスクに表示しないことで、削除したことにする
    setTasks(remainingTasks);
  }

  //タスクチェック・アンチェック処理
  function toggleTaskCompleted(id:any) {
    const updatedTasks = tasks.map((task:any) => {
      if (id === task.id) {
        //単一用の配列なので、スプレッドでflatten
        return {...task, completed: !task.completed}//チェックされるたび、状態が反転
      }
      return task;
    });
    setTasks(updatedTasks);
  }

  //propsから直接取得するのではなく、分割代入していたtasksを参照するように修正
  const taskList = tasks.map((task:any) => (
    //初期処理index.tsx側で連携されてきたデータをBeanコンポーネントにマッピング
    <Todo
      id={task.id}
      name={task.name}
      completed={task.completed}
      key={task.id} //Reactエンジンが一意のキーとしてハンドリングするためのおまじない。コンポーネントをきり、参照する際は指定が必要。html側で参照したりしてはだめ。
      toggleTaskCompleted={toggleTaskCompleted}//Beanと処理を紐付ける
      deleteTask={deleteTask}//Beanと処理を紐付ける
    />
  ));


  //残タスク数が複数件ないのにtasks remainingと表示されるのが嫌だから、表示文言をタスク数の件数で住み分け
  const tasksNoun = taskList.length !== 1 ? 'tasks' : 'task';

  //残タスク件数
  const headingText = `${taskList.length} ${tasksNoun} remaining`;

  return (
    <div className="todoapp stack-large">
      <h1>TodoMatic</h1>
      <Form addTask={addTask} />
      <div className="filters btn-group stack-exception">
        <FilterButton />
        <FilterButton />
        <FilterButton />
      </div>
      <h2 id="list-heading">{headingText}</h2>
      <ul
        role="list"
        className="todo-list stack-large stack-exception"
        aria-labelledby="list-heading"
      >
        {taskList}
      </ul>
    </div>
  );
}

export default App;
