import React from 'react';

import Product from './Product';

import Title from './Title'

import {storeProductListData, storeProductDetailData} from '../data'


import {ProductConsumer} from '../components/ProductContextWrapper'

let state = {
    storeProductList : storeProductListData
}

export default function ProductList(){

    // console.log(state.storeProductList)


    return (
        <div>
            <div className="py-5">
                <div className="container">
                    <Title name="our" title="products"/>
                    <div className="row">
                        <ProductConsumer>
                            {(context:any)=>{
                                return context.storeProductList.map((item:any,index:any)=>{
                                    // console.log(item)
                                    return <Product product={item} key={index}/>
                                })
                            }}
                        </ProductConsumer>
                    </div>
                </div>
            </div>


        </div>
    )
}