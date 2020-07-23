import React from 'react'
import CartItem from './CartItem'

//{}はdeconstruct。jqのラップ剥がしと似た感じ
//https://ja.reactjs.org/docs/jsx-in-depth.html#props-in-jsx

export default function CartList({value}:any){

    const {cart} = value;
    return (
        <div className="container-fluid">
            {cart.map((targetItem:any)=>{
               return <CartItem key={targetItem.id} item={targetItem} value={value}/> 
            })}
        </div>
    )
}