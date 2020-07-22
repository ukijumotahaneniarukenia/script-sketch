import React from 'react';

import styled from 'styled-components'

import {ProductConsumer} from '../components/ProductContextWrapper'
import {ButtonContainer} from '../components/ButtonContainer'

import {Link} from 'react-router-dom'

export default function Modal(){
    return (
        <ProductConsumer>
            {(context:any)=>{
                const {modalOpen,closeModal} = context
                const {img,title,price} = context.modalProduct;

                if(!modalOpen){
                    //追加されていないアイテムのモーダル画面は表示しない
                    return null;
                }else{
                    return(
                        <ModalContainer>
                            <div className="container">
                                <div className="row">
                                    <div id="modal" className="col-8 mx-auto col-md-6 col-lg-4 text-center text-capitalize p-5">
                                        <h5>
                                            item added to the cart
                                        </h5>

                                        <img src={img} className="img-fluid" alt="product"/>

                                        <h5>{title}</h5>

                                        <h5 className="text-muted">price : $ {price}</h5>

                                        <Link to="/">
                                            <ButtonContainer onClick={()=>{closeModal()}}>
                                                store
                                            </ButtonContainer>
                                        </Link>
                                        <Link to="/cart">
                                            <ButtonContainer onClick={()=>{closeModal()}}>
                                                got to cart
                                            </ButtonContainer>
                                        </Link>
                                    </div>
                                </div>
                            </div>
                        </ModalContainer>
                    )
                }


                return null;
            }}
        </ProductConsumer>
    )
}


const ModalContainer = styled.div`

    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(0,0,0,0.3)
    display: flex;
    align-items: center;
    justify-content: center;
    #modal{
        background: var(--mainWhite)
    }

`