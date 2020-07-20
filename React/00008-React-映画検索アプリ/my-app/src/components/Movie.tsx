import React from "react";

const DEFAULT_PLACEHOLDER_IMAGE =
  "https://m.media-amazon.com/images/M/MV5BMTczNTI2ODUwOF5BMl5BanBnXkFtZTcwMTU0NTIzMw@@._V1_SX300.jpg";


function Movie(props:any){
  const poster = props.movie.Poster === "N/A" ? DEFAULT_PLACEHOLDER_IMAGE : props.movie.Poster;//欠損値のデフォルトのアバタ設定

  return (
    <div className="movie">
      <h2>{props.movie.Title}</h2>
      <div>
        <img
          width="200"
          alt={`The movie titled: ${props.movie.Title}`}
          src={poster}
        />
      </div>
      <p>({props.movie.Year})</p>
    </div>
  );
};


export default Movie;