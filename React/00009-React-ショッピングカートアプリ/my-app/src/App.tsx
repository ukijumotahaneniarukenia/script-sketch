import React from 'react';

import {
  Switch
  ,BrowserRouter as Router
  ,Route
} from 'react-router-dom';

import './App.css';

import 'bootstrap/dist/css/bootstrap.min.css';

import NavBar from './components/NavBar'
import ProductList from './components/ProductList'
import Details from './components/Details'
import Cart from './components/Cart/Cart'
import Default from './components/Default'

import Modal from './components/Modal'



function App(){
    return (
      <Router>
        <NavBar />
        <div className="app">
          <Switch>
            <Route exact path="/">
              <ProductList />
            </Route>
            <Route exact path="/details">
              <Details />
            </Route>
            <Route exact path="/cart">
              <Cart />
            </Route>
            <Route>
              {/* 上記URLのいずれでもない場合 */}
              <Default />
            </Route>
          </Switch>
          <Modal />
        </div>
      </Router>

    );
}

export default App;
