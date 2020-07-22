import React,{Component} from 'react';

//https://ja.reactjs.org/docs/context.html
const ProductContext = React.createContext('');
//Provider
//Consumer



//コンテキストはクラス単位で管理する

class ProductProvider extends Component{
    render(){
        return (
            <ProductContext.Provider value="コンテキストダヨーン">
                {this.props.children}
            </ProductContext.Provider>
        )
    }
}

const ProductConsumer = ProductContext.Consumer

export {ProductProvider,ProductConsumer}