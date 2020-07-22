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


    //アロー関数
    //https://applingo.tokyo/article/1422
    //アロー関数は自動的にthisの値をbindする
    //アロー関数はES6から利用できる機能
    //React開発環境ではES6に対応
    //基本この書き方がいいぽい
    testCheckStateBehavior = () => {
        console.log("State Products :",this.state.storeProductList[0].inCart);//State Products : false
        console.log("Data Products :",storeProductListData[0].inCart);//Data Products : false


        const tempProducts = [...this.state.storeProductList];

        tempProducts[0].inCart = true

        //setState関数はReactオブジェクトだけでなく、データ側も更新する
        this.setState(()=>{
            return {storeProductList:tempProducts} //変更内容を反映
        },()=>{
            console.log("State Products :",this.state.storeProductList[0].inCart);//State Products : true
            console.log("Data Products :",storeProductListData[0].inCart);//Data Products : true
        })


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
                <button onClick={this.testCheckStateBehavior}>test state </button>
                {this.props.children}
            </ProductContext.Provider>
        )
    }
}

const ProductConsumer = ProductContext.Consumer

export {ProductProvider,ProductConsumer}