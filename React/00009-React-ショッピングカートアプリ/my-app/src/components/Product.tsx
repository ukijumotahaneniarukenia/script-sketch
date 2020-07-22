import React from 'react';

import styled from 'styled-components';

import {Link} from 'react-router-dom';

import {ProductConsumer} from '../components/ProductContextWrapper'


export default function Product(props:any){

    console.log(props.product)

    // const {id,title,img,price,inCart} = props.product;

    return (
        <ProductStyleWrapper className="col-9 mx-auto col-md-6 col-lg-3 my-3">
            <div className="card">
                <div
                    className="img-container p-5"
                    >
                    <Link to="/details">
                        <img src={props.product.img} alt="product" className="card-img-top"/>
                    </Link>
                </div>
            </div>
        </ProductStyleWrapper>
    )
}


const ProductStyleWrapper = styled.div`

`