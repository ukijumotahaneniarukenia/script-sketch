import React from 'react';

import styled from 'styled-components';

import {Link} from 'react-router-dom';

import {ProductConsumer} from '../components/ProductContextWrapper'


import PropTypes from 'prop-types'

export default function Product(props:any){

    // console.log(props.product)

    // const {id,title,img,price,inCart} = props.product;
    
    function handleXXX (e:any) {
        e.preventDefault()
        console.log("You Clicked Me by handleXXX")
    }

    function handleYYY (e:any) {
        e.preventDefault()
        console.log("You Clicked Me by handleYYY")
    }

    return (
        <ProductStyleWrapper className="col-9 mx-auto col-md-6 col-lg-3 my-3">
            <div className="card">
                <div
                    className="img-container p-5"
                    onClick={handleXXX}
                >
                    <Link to="/details">
                        <img src={props.product.img} alt="product" className="card-img-top"/>
                    </Link>

                    <button
                        className="cart-btn"
                        disabled={props.product.inCart?true:false} //追加されていれば非活性、追加されていなければ活性
                        onClick={handleYYY}
                    >
                        {props.product.inCart?(<p className="text-capitalize mb-0">{" "} in inCart</p>):(<i className="fas fa-cart-plus"/>)}

                    </button>


                </div>

                <div className="card-footer d-flex justify-content-between">
                    <p className="align-self-center mb-0">
                        {props.product.title}
                    </p>

                    <h5 className="text-blue font-italic mb-0">
                        <span className="mr-l">
                            ${props.product.price}
                        </span>
                    </h5>
                </div>
            </div>
        </ProductStyleWrapper>
    )
}


Product.propTypes = {
    product:PropTypes.shape({
        id:PropTypes.number,
        img:PropTypes.string,
        title:PropTypes.string,
        price:PropTypes.number,
        inCart:PropTypes.bool
    }).isRequired
}

const ProductStyleWrapper = styled.div`

    .card {
        border-color: transparent;
        transition: all is linear;
    }

    .card-footer{
        background: transparent;
        border-top: transparent;
        transition: all is linear;
    }

    &:hover{
        .card{
            border: 0.04rem solid rgba(0,0,0,0.2);
            box-shadow: 2px 2px 5px 0px rgba(0,0,0,0.2);
        }

        .card-footer{
            background: rgba(247,247,247);
        }

    }


    .img-container{
        position: relative;
        overflow: hidden;
    }

    .card-img-top{
        transition: all is linear;
    }

    .img-container:hover .card-img-top{
        transform: scale(1.2);
    }

    .cart-btn{
        position: absolute;
        bottom: 0;
        right: 0;
        padding: 0.2rem 0.4rem;
        background: var(--lightBlue);
        border: none;
        color:var(--mainWhite);
        font-size:1.4rem;
        border-radius:0.5rem 0 0 0;
        transform: translate(100%,100%);
        transition: all is linear;
    }


    .img-container:hover .cart-btn {
        transform: translate(0,0);
    }


    .cart-btn:hover{
        color :var(--mainBlue);
        cursor: pointer;
    }


`