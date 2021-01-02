import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter as Router, Link, Route, Switch } from "react-router-dom";

import { Home } from "./components/Home";
import { Search } from "./components/Search";

export function App() {
  return (
    <Router>
      <div>
        <ul>
          <li>
            <Link to="/">Home</Link>
          </li>
          <li>
            <Link to="/search">Search</Link>
          </li>
        </ul>
        <hr />
        <Switch>
          <Route exact path="/">
            <Home homeTitle="My Home Page"/>
          </Route>
          <Route path="/search">
            {/* <Search searchTitle="My Search Page" /> */}
            <Search />
          </Route>
        </Switch>
      </div>
    </Router>
  );
}

ReactDOM.render(<App />, document.getElementById("root"));
