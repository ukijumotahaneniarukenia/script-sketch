import React from 'react';

import Product from './Product';

import Title from './Title'

import {storeProducts} from '../data'


import {ProductConsumer} from '../components/ProductContextWrapper'

let state = {
    products : storeProducts
}

export default function ProductList(){

    console.log(state.products)


    return (
        <div>
            <Product />

            <div className="py-5">
                <div className="container">
                    <Title name="our" title="products"/>
                    <div className="row">
                        <ProductConsumer>
                            {(context:any)=>{
                                return <h1>{context}</h1>
                            }}
                        </ProductConsumer>
                    </div>
                </div>
            </div>


        </div>
    )
}