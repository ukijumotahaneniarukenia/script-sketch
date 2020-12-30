import React, { useState } from "react";

function Search(props: any) {

  const [searchValue, setSearchValue] = useState(""); //検索条件のデフォルト値を設定

  function handleSearchInputChanges(e: any) {
    setSearchValue(e.target.value);
  }

  function callSearchFunction(e: any) {
    e.preventDefault();
    props.search(searchValue);
    setSearchValue("");
  }

  return (
    <form className="search">
      <input
        value={searchValue}
        onChange={handleSearchInputChanges}
        type="text"
      />
      <input onClick={callSearchFunction} type="submit" value="SEARCH" />
    </form>
  );
}

export default Search;
