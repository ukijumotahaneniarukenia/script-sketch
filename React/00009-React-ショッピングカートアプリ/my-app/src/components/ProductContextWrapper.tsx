import React,{Component} from 'react';

import {storeProductListData,storeProductDetailData} from '../data'


//https://ja.reactjs.org/docs/context.html
const ProductContext = React.createContext({}); //デフォルトをマップで管理したいので初期化 stringではなくdictで
//Provider
//Consumer



//コンテキストはクラス単位で管理する

//クラスは状態を管理できるため

class ProductProvider extends Component{


    state = {
        storeProductList:storeProductListData
        ,storeProductDetail:storeProductDetailData
    }


    hadleDetail() {
        console.log("ハンドル詳細")    
    }

    addToCart() {
        console.log("かごに追加")    
    }


    render(){

        //データも関数も渡せる
        return (
            <ProductContext.Provider value={{
                ...this.state
                ,hadleDetail:this.hadleDetail
                ,addToCart:this.addToCart
            }}>
                {this.props.children}
            </ProductContext.Provider>
        )
    }
}

const ProductConsumer = ProductContext.Consumer

export {ProductProvider,ProductConsumer}