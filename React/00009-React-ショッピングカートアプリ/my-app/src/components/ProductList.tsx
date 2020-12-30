import React from 'react';

import Product from './Product';

import Title from './Title'

import { ProductConsumer } from '../components/ProductContextWrapper'

export default function ProductList() {

    return (
        <div>
            <div className="py-5">
                <div className="container">
                    <Title name="our" title="products" />
                    <div className="row">
                        <ProductConsumer>
                            {(context: any) => {
                                return context.storeProductList.map((item: any, index: any) => {
                                    return <Product product={item} key={index} />
                                })
                            }}
                        </ProductConsumer>
                    </div>
                </div>
            </div>
        </div>
    )
}
