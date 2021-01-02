import React from "react";
import Typography from "@material-ui/core/Typography";

type Props = {
  searchTitle : string
}

function Search(props: Props) {

  const {searchTitle} = {...props}

  return (
    <React.Fragment>
      <Typography variant="h6" gutterBottom>
        {searchTitle}
        <p>検索ページダヨーン</p>
      </Typography>
    </React.Fragment>
  );
}

export {Search}
