import React,{Component} from 'react';

import {storeProductListData,storeProductDetailData} from '../data'

//https://ja.reactjs.org/docs/context.html
const ProductContext = React.createContext({}); //デフォルトをマップで管理したいので初期化 stringではなくdictで

//コンテキストはクラス単位で管理する
//クラスは状態を管理できるため
//コンテキストはコンポーネント間で共通して持ちわまることができる
class ProductProvider extends Component{

    state = {
        storeProductList:[],
        storeProductDetail:storeProductDetailData,
        cart:[],
        modalOpen:false,
        modalProduct:storeProductDetailData,
        cartSubTotal: 0,
        cartTax: 0,
        cartTotal: 0

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

    openModal = (id:any) =>{
        const targetItem = this.getItem(id);
        this.setState(()=>{
            return {modalProduct:targetItem,modalOpen:true}
        })
    }


    closeModal = (id:any) => {
        this.setState(()=>{
            return {modalOpen:false}
        })
    }


    increment = (id:any) => {
        console.log("incre")
    }

    decrement = (id:any) => {
        console.log("decre")
    }

    removeItem = (id:any) => {
        //https://stackoverflow.com/questions/52423842/what-is-not-assignable-to-parameter-of-type-never-error-in-typescript
        let tempProducts:any = [...this.state.storeProductList]
        let tempCart:any = [...this.state.cart]

        tempCart = tempCart.filter((item:any)=>item.id !== id)

        const index = tempProducts.indexOf(this.getItem(id))

        let removeProduct:any = tempProducts[index]

        //合計金額を再計算するために初期化
        removeProduct.inCart = false
        removeProduct.count = 0
        removeProduct.total = 0

        this.setState(()=>{
            return{
                cart:[...tempCart]
                ,storeProductList:[...tempProducts]
            }
        },()=>{
            this.addTotals();
        })

        console.log("rm item")
    }

    clearCart = () => {
        this.setState(()=>{
            return {cart: []};
        },()=>{
            this.setStoreProducts();
            this.addTotals()
        })
    }

    addTotals = () => {

        let subTotal = 0;

        this.state.cart.map((item:any)=>{
            (subTotal += item.total)
        })

        const tempTax = subTotal * 0.1;
        const tax = parseFloat(tempTax.toFixed(2));

        const total = subTotal + tax

        this.setState(()=>{
            return {
                cartSubTotal:subTotal,
                cartTax:tax,
                cartTotal:total
            }
        })

    }



    handleDetail = (id:any) => {
        const targetItem = this.getItem(id);
        this.setState(()=>{
            return {storeProductDetail:targetItem};
        })
    }

    //
    addToCart = (id:any) => {

        //idに紐づくアイテムを外部から取得してきたイメージ
        //型推論よしなにしてもらうため、any型にしておく
        const targetItem:any = this.getItem(id)

        let itemList = [...this.state.storeProductList];

        //状態管理するため、React管理のオブジェクトのうち取得したアイテムを逆引き
        // const index = itemList.indexOf(targetItem)

        targetItem.inCart = true;
        targetItem.count = 1;

        const price = targetItem.price;

        targetItem.total = price;

        this.setState(()=>{
            return {storeProductList:itemList,cart:[...this.state.cart,targetItem]}
        },()=>{
            //状態更新後の処理を記載
            console.log(this.state)
            this.addTotals()
        })
    }
    
    render(){
    
        //データも関数も渡せる
        return (
            <ProductContext.Provider value={{
                ...this.state
                ,handleDetail:this.handleDetail
                ,addToCart:this.addToCart
                ,openModal:this.openModal
                ,closeModal:this.closeModal
                ,increment:this.increment
                ,decrement:this.decrement
                ,removeItem:this.removeItem
                ,clearCart:this.clearCart
            }}>
                {this.props.children}
            </ProductContext.Provider>
        )
    }

}

const ProductConsumer = ProductContext.Consumer

export {ProductProvider,ProductConsumer}