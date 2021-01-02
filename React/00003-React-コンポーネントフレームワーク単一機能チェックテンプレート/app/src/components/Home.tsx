import React from "react";
import Typography from "@material-ui/core/Typography";

type Props = {
  homeTitle : string
}

function Home(props: Props) {

  const {homeTitle} = {...props}

  return (
    <React.Fragment>
      <Typography variant="h6" gutterBottom>
        {homeTitle}
        <p>ホームページダヨーン</p>
      </Typography>
    </React.Fragment>
  );
}

export {Home}
