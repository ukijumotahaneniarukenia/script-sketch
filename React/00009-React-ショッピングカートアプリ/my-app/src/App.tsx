import React, { Component } from "react";

import {
  Switch
  , Route
} from 'react-router-dom';

import './App.css';

import 'bootstrap/dist/css/bootstrap.min.css';

import NavBar from './components/NavBar'
import ProductList from './components/ProductList'
import Cart from './components/Cart/Cart'
import Details from './components/Details'
import Default from './components/Default'

import Modal from './components/Modal'

//エントリはクラス管理したほうがブラウザの情報をよしなに持ち回ってくれているので、便利
class App extends Component {
  render() {
    return (
      <React.Fragment>
        <NavBar />
        <Switch>
          <Route exact path="/" component={ProductList} />
          <Route exact path="/details" component={Details} />
          <Route exact path="/cart" component={Cart} />
          <Route component={Default} />
        </Switch>
        <Modal />
      </React.Fragment>
    );
  }
}

export default App;
