import React from 'react';

import {Link} from 'react-router-dom'

import logo from '../logo.svg'

export default function NavBar(){
    return (
        <nav className="navbar navbar-expand-sm navbar-dark px-sm-5">

            <Link to="/">
                /* 
                https://www.iconfinder.com/icons/1243689/call_phone_icon
                Creative Commons (Attribution 3.0 Unported);
                https://www.iconfinder.com/Makoto_msk */
                <img src={logo} alt="store" className="navbar-brand" />
            </Link>
            
            <ul className="navbar-nav align-items-center">
                <li className="nav-item ml-5">
                <Link to="/" className="nav-link">
                    product
                </Link>
                </li>
            </ul>

            <Link to="/cart" className="ml-auto">
                <button>
                    <i className="fas fa-cart-plus" />
                    my-cart
                </button>
            </Link>


        </nav>
    )
}