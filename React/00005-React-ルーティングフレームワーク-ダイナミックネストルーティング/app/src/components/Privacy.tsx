import React from "react";
import Typography from "@material-ui/core/Typography";

type Props = {
  privacyTitle : string
}

function Privacy(props: Props) {

  const {privacyTitle} = {...props}

  return (
    <React.Fragment>
      <Typography variant="h6" gutterBottom>
        {privacyTitle}
        <p>プライバシーページダヨーン</p>
      </Typography>
    </React.Fragment>
  );
}

export {Privacy}
