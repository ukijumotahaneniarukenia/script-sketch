import React, { useState } from "react";
import logo from './logo.svg';
import './App.css';

import Todo from "./components/Todo";
import Form from "./components/Form";
import FilterButton from "./components/FilterButton";




function App(props:any) {

  //index.tsxで渡された引数をpropsで受け取っている Beanみたいなもん
  const [tasks, setTasks] = useState(props.tasks); //Reactの特徴は状態を保持する変数と変数を更新する設定関数をuseStateから定義できる


  function addTask(name:any) {
    const newTask = {id:"id",name:name,colmpleted:false}

    setTasks([...tasks,newTask])

    alert(name);
  }

  //propsから直接取得するのではなく、分割代入していたtasksを参照するように修正
  const taskList = tasks.map((task:any) => (
    <Todo
      id={task.id}
      name={task.name}
      completed={task.completed}
      key={task.id} //Reactエンジンが一意のキーとしてハンドリングするためのおまじない。コンポーネントをきり、参照する際は指定が必要。html側で参照したりしてはだめ。
    />
  ));

  return (
    <div className="todoapp stack-large">
      <h1>TodoMatic</h1>
      <Form addTask={addTask} />
      <div className="filters btn-group stack-exception">
        <FilterButton />
        <FilterButton />
        <FilterButton />
      </div>
      <h2 id="list-heading">
        3 tasks remaining
      </h2>
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
