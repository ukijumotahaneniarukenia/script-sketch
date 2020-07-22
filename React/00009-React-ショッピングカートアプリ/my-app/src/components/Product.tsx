import React from 'react';

import styled from 'styled-components';

import {Link} from 'react-router-dom';

import {ProductConsumer} from '../components/ProductContextWrapper'

import PropTypes from 'prop-types'

export default function Product(props:any){

    const {id,title,img,price,inCart} = props.product;

    return (
        <ProductStyleWrapper className="col-9 mx-auto col-md-6 col-lg-3 my-3">
            <div className="card">
                
                <ProductConsumer>
                    {(context:any)=>{
                        return(
                                <div
                                    className="img-container p-5"
                                    //https://ja.stackoverflow.com/questions/57002/%E4%BD%95%E6%95%85-uncaught-invariant-violation-maximum-update-depth-exceeded-%E3%81%A8%E3%81%84%E3%81%86%E3%82%A8%E3%83%A9%E3%83%BC%E3%81%8C%E5%87%BA%E3%82%8B%E3%81%AE%E3%81%8B%E3%82%8F%E3%81%8B%E3%82%8A%E3%81%BE%E3%81%9B
                                    onClick={()=>context.handleDetail(id)}
                                >
                                    <Link to="/details">
                                        <img src={img} alt="product" className="card-img-top"/>
                                    </Link>

                                    <button
                                        className="cart-btn"
                                        disabled={inCart?true:false} //追加されていれば非活性、追加されていなければ活性
                                        onClick={()=>{
                                            context.addToCart(id)
                                            context.openModal(id)
                                        }}
                                    >
                                        {inCart?(<p className="text-capitalize mb-0">{" "} in inCart</p>):(<i className="fas fa-cart-plus"/>)}

                                    </button>
                                </div>
                        )
                    }}

                </ProductConsumer>
                    <div className="card-footer d-flex justify-content-between">
                        <p className="align-self-center mb-0">
                            {title}
                        </p>

                        <h5 className="text-blue font-italic mb-0">
                            <span className="mr-l">
                                ${price}
                            </span>
                        </h5>
                    </div>
            </div>
        </ProductStyleWrapper>
    )
}


Product.propTypes = {
    product:PropTypes.shape({
        id: PropTypes.number,
        title: PropTypes.string,
        img: PropTypes.string,
        price: PropTypes.number,
        // company: PropTypes.string,
        // info: PropTypes.string,
        inCart: PropTypes.bool,
        // count: PropTypes.number,
        // total: PropTypes.number,
    }).isRequired
}

const ProductStyleWrapper = styled.div`

    .card {
        border-color: transparent;
        transition: all 1s linear;
    }

    .card-footer{
        background: transparent;
        border-top: transparent;
        transition: all 1s linear;
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
        transition: all 1s linear;
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
        transition: all 1s linear;
    }


    .img-container:hover .cart-btn {
        transform: translate(0,0);
    }


    .cart-btn:hover{
        color :var(--mainBlue);
        cursor: pointer;
    }


`