import React from 'react';
import logo from './logo.svg';
import './App.css';

import 'bootstrap/dist/css/bootstrap.min.css';

import NavBar from './components/NavBar'
import ProductList from './components/ProductList'
import Details from './components/Details'
import Cart from './components/Cart'
import Default from './components/Default'


function App(){
    return (
      <div className="app">
        <NavBar />
        <ProductList />
        <Details />
        <Cart />
        <Default />
        <NavBar />
      </div>
    );
}

export default App;
