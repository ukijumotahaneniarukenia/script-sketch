import React from 'react';

import { ProductConsumer } from "../components/ProductContextWrapper";

import {Link} from 'react-router-dom'

import {ButtonContainer} from './ButtonContainer'

export default function Details(){
    return (

        <ProductConsumer>
            {(context:any)=>{
                const {id,company,img,info,price,title,inCart} = context.storeProductDetail

                    // console.log(context.storeProductDetail)
                    
                    return (
                        <div className="container py-5">
                            
                            {/* title */}

                            <div className="row">
                                <div className="col-10 mx-auto text-center text-slanted text-blue my-5">
                                    <h1>{title}</h1>
                                </div>
                            </div>
                            {/* end title */}

                            {/* product info */}

                            <div className="row">

                                {/* product img */}

                                <div className="col-10 mx-auto col-md-6 my-3 text-capitalize">
                                    <img src={img} className="img-fluid" alt="product"/>
                                </div>
                                {/* end product img */}

                                {/* product text */}

                                <div className="col-10 mx-auto col-md-6 my-3 text-capitalize">
                                    <h2>model : {title}</h2>
                                    <h4 className="text-title text-uppercase text-muted mt-3 mb-2">
                                        made by: <span className="text-uppercase">
                                            {company}
                                        </span>
                                    </h4>
                                    <h4 className="text-blue">
                                        <strong>
                                            price: <span>$</span>
                                            {price}
                                        </strong>
                                    </h4>

                                    <p className="text-capitalize font-weight-bold mt-3 mb-0">
                                        some info about product:
                                    </p>

                                    <p className="text-muted lead">
                                        {info}
                                    </p>
                                    {/* button */}
                                    <div>
                                        <Link to="/">
                                            <ButtonContainer>
                                                back to products
                                            </ButtonContainer>
                                        </Link>
                                        <ButtonContainer
                                            disabled={inCart?true:false}
                                            onClick={()=>context.addToCart(id)}
                                        >
                                            {inCart ? "inCart" : "add to Cart"}
                                        </ButtonContainer>
                                    </div>
                                </div>

                                {/* end product text */}

                            </div>
                            {/* end product info */}
                        </div>
                    )
                    // return <Product product={item} key={index}/>
            }}
        </ProductConsumer>

    )
}