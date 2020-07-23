import React from 'react';

import Title from '../Title'


import CartColumns from './CartColumns'

import EmptyCart from './EmptyCart'

import {ProductConsumer} from '../../components/ProductContextWrapper'

import CartList from './CartList'

import CartTotals from './CartTotals'

//Cartをrootとしたサブエントリ管理


//historyの機能はクラス単位でないと持てないのか

export default function Cart(){
    return (
        <section>
            <ProductConsumer>
                {(context:any)=>{
                    console.log(context.history)
                    const cart = context.cart;

                    if(cart.length>0){
                        return (
                            <React.Fragment>
                                <Title name="your" title="cart" />
                                <CartColumns />
                                <CartList value={context}/>
                                <CartTotals value={context} history={context.history} />
                            </React.Fragment>
                        )
                    }else{
                        return <EmptyCart />
                    }

                }}
            </ProductConsumer>
        </section>
    )
}