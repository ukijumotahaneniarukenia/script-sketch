import React from "react";
import Typography from "@material-ui/core/Typography";

type Props = {
  aboutTitle : string
}

function About(props: Props) {

  const {aboutTitle} = {...props}

  return (
    <React.Fragment>
      <Typography variant="h6" gutterBottom>
        {aboutTitle}
        <p>アバウトページダヨーン</p>
      </Typography>
    </React.Fragment>
  );
}

export {About}
