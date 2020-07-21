import React from 'react';

import {Link} from 'react-router-dom'

import logo from '../logo.svg'

export default function NavBar(){
    return (
        <nav className="navbar navbar-expand-sm navbar-dark px-sm-5">

            <Link to="/">
                <img src={logo} alt="store" className="navbar-brand" />
            </Link>
            
            <ul className="navbar-nav align-items-center">
                <li className="nav-item ml-5">
                <Link to="/" className="nav-link">
                    product
                </Link>
                </li>
            </ul>


        </nav>
    )
}