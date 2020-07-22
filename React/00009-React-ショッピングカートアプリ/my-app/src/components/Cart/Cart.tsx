import React from 'react';

import Title from '../Title'


import CartColumns from './CartColumns'

import EmptyCart from './EmptyCart'

import {ProductConsumer} from '../../components/ProductContextWrapper'

//Cartをrootとしたサブエントリ管理
export default function Cart(){
    return (

        <ProductConsumer>
            {(context:any)=>{
                const cart = context;

                if(cart.length>0){
                    return (
                        <section>
                            <Title name="your" title="cart" />
                            <CartColumns />
                        </section>
                    )
                }else{
                    return <EmptyCart />
                }

            }}
        </ProductConsumer>

    )
}