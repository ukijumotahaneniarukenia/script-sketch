import React from "react";
import ReactDOM from "react-dom";
import { BrowserRouter as Router, Link, Route, Switch } from "react-router-dom";

import { About } from "./components/About";
import { Home } from "./components/Home";
import { Privacy } from "./components/Privacy";
import { AddressForm } from "./components/AddressForm";

export function App() {

  const queryAboutParamValue: string = encodeURI("アバウト")
  const queryPrivacyParamValue: string = encodeURI("プライバシー")
  const queryUserIdParamValue: string = encodeURI("ZLPcK8ZyftZuICPCsOVym8DIqbPsXop6")

  return (
    <Router>
      <div>
        <ul>
          <li>
            <Link to="/">Home</Link>
          </li>
          <li>
            <Link to={`/about?name=${queryAboutParamValue}`}>About</Link>
          </li>
          <li>
            <Link to="/address-form">AddressForm</Link>
          </li>
          <li>
            <Link to={`/privacy?name=${queryPrivacyParamValue}&userId=${queryUserIdParamValue}`}>Privacy</Link>
          </li>
        </ul>
        <hr />
        <Switch>
          <Route exact path="/">
            <Home homeTitle="My Home Page"/>
          </Route>
          <Route path="/about">
            <About aboutTitle="My About Page" />
          </Route>
          <Route path="/address-form">
            <AddressForm addressFormTitle="My AddressForm Page" />
          </Route>
          <Route path="/privacy">
            <Privacy privacyTitle="My Privacy Page" />
          </Route>
        </Switch>
      </div>
    </Router>
  );
}

ReactDOM.render(<App />, document.getElementById("root"));
