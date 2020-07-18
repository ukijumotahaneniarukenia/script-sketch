import React from 'react';
import logo from './logo.svg';
import './App.css';

import Todo from "./components/Todo";
import Form from "./components/Form";
import FilterButton from "./components/FilterButton";

function App(props:any) {

  function addTask(name:any) {
    alert(name);
  }

  const taskList = props.tasks.map((task:any) => (
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
