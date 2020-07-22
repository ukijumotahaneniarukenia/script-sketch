import React,{Component} from 'react';

import {storeProductListData,storeProductDetailData} from '../data'


//https://ja.reactjs.org/docs/context.html
const ProductContext = React.createContext({}); //デフォルトをマップで管理したいので初期化 stringではなくdictで
//Provider
//Consumer

//コンテキストはクラス単位で管理する

//クラスは状態を管理できるため

//コンテキストはコンポーネント間で共通して持ちわまることができる
class ProductProvider extends Component{

    state = {
        storeProductList:[]
        ,storeProductDetail:storeProductDetailData
    }
    
    componentDidMount(){
        this.setStoreProducts();
    }
    
    setStoreProducts = ()=>{
        let tempItemList : any[] =[]
        storeProductListData.forEach(item=>{
            const  singleItem = {...item}
            tempItemList = [...tempItemList,singleItem]
        });
    
        this.setState(()=>{
            return {storeProductList:tempItemList}
        });
    }
    
    hadleDetail = () => {
        console.log("ハンドル詳細")    
    }
    
    addToCart = (id:any) => {
        console.log(`かごに追加 id:${id}`)    
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