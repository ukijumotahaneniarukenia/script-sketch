import React,{Component} from 'react';

import {storeProductListData,storeProductDetailData} from '../data'

//https://ja.reactjs.org/docs/context.html
const ProductContext = React.createContext({}); //デフォルトをマップで管理したいので初期化 stringではなくdictで

//コンテキストはクラス単位で管理する
//クラスは状態を管理できるため
//コンテキストはコンポーネント間で共通して持ちわまることができる
class ProductProvider extends Component{

    state = {
        storeProductList:storeProductListData,
        storeProductDetail:storeProductDetailData,
        cart:[]
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
    

    componentDidMount(){
        this.setStoreProducts();
    }
    
    getItem = (id:any) =>{
        const item = this.state.storeProductList.find((item:any)=>item.id===id);
        return item;
    }


    handleDetail = (id:any) => {
        const item = this.getItem(id);
        console.log(item)
        this.setState(()=>{
            return {storeProductDetail:item};
        })
    }

    //
    addToCart = (id:any) => {

        //idに紐づくアイテムを外部から取得してきたイメージ
        const targetItem:any = this.getItem(id)

        let itemList = [...this.state.storeProductList];

        //状態管理するため、React管理のオブジェクトのうち取得したアイテムを逆引き
        const index = itemList.indexOf(targetItem)

        targetItem.inCart = true;
        targetItem.count = 1;

        const price = targetItem.price;

        targetItem.total = price;

        this.setState(()=>{
            return {storeProductList:itemList,cart:[...this.state.cart,targetItem]}
        },()=>{
            //状態更新後の処理を記載
            console.log(this.state)
        })

        // console.log(`かごに追加 id:${id}`)    
    }
    
    render(){
    
        //データも関数も渡せる
        return (
            <ProductContext.Provider value={{
                ...this.state
                ,handleDetail:this.handleDetail
                ,addToCart:this.addToCart
            }}>
                {this.props.children}
            </ProductContext.Provider>
        )
    }

}

const ProductConsumer = ProductContext.Consumer

export {ProductProvider,ProductConsumer}