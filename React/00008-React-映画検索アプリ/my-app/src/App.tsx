import React, { useState, useEffect } from "react";


import logo from './logo.svg';
import './App.css';

import Header from "../src/components/Header";
import Movie from "../src/components/Movie";
import Search from "../src/components/Search";

const MOVIE_API_URL = "https://www.omdbapi.com/?s=man&apikey=4a3b711b"


function App() {

  const [loading, setLoading] = useState(true);//ローディング状態はデフォルト値でtrue
  const [movies, setMovies] = useState([]);//映画は複数件格納できるように空配列を設定
  const [errorMessage, setErrorMessage] = useState(null);//エラーメッセージはデフォルト値でnull


  //https://ja.reactjs.org/docs/hooks-effect.html
  //ユーザーがアクションした結果を動的にDOMに反映したい場合、useEffectを使用する


  //初期化処理と同様な役割
  useEffect(() => {
    fetch(MOVIE_API_URL)//引数に指定したURLにリクエスト投げて
      .then(response => response.json())//レスポンスをjsonで取得して
      .then(jsonResponse => {//jsonレスポンスを仮引数に受け
        setMovies(jsonResponse.Search);//Searchキーに紐づく配列を映画プロパティに設定
        setLoading(false);//ローディング状態を完了にする
      });
  }, []);//映画プロパティに設定した結果格納配列もuseEffectに設定


  //検索処理
  function search(searchValue:any){

    setLoading(true);//ローディング中なので、trueに設定
    setErrorMessage(null);//検索エラーメッセージを初期化

    fetch(`https://www.omdbapi.com/?s=${searchValue}&apikey=4a3b711b`)//バッククォートで変数展開
      .then(response => response.json())//レスポンスをjsonで取得して
      .then(jsonResponse => {//jsonレスポンスを仮引数に受け
        if (jsonResponse.Response === "True") {//検索処理が正常終了した場合
          setMovies(jsonResponse.Search);//Searchキーに紐づく配列を映画プロパティに設定
          setLoading(false);//ローディング状態を完了にする
        } else {//検索処理が正常終了しなかった場合
          setErrorMessage(jsonResponse.Error);//エラーメッセージを設定
          setLoading(false);//ローディング状態を完了にする
        }
      });
  };

  return (
    <div className="App">
     <Header text="HOOKED" />
     <Search search={search} />
     <p className="App-intro">Sharing a few of our favourite movies</p>
     <div className="movies">

       {loading && !errorMessage ? (//ローディング中かつエラーメッセージがない場合
        <span>loading...</span>
        ) : errorMessage ? (//エラーメッセージがある場合
         <div className="errorMessage">{errorMessage}</div>
       ) : (//ローディング中でない場合
         movies.map((movie, index) => (
          // console.log(movie)
           <Movie movie={movie} />
         ))
       )}
     </div>
   </div>
 );
}

export default App;
