import React from "react";
import Typography from "@material-ui/core/Typography";
import { useLocation } from "react-router-dom";

type Props = {
  privacyTitle : string
}

function Privacy(props: Props) {

  const {privacyTitle} = {...props}

  console.log(useLocation().search)

  let query = new URLSearchParams(useLocation().search);

  console.log(query)

  console.log(query.get("name"))

  console.log(query.get("userId"))

  return (
    <React.Fragment>
      <Typography variant="h6" gutterBottom>
        {privacyTitle}
        <p>プライバシーページダヨーン</p>
        <p>{`クエリパラメータダヨーン Name is ${query.get("name")}`}</p>
        <p>{`クエリパラメータダヨーン UserId is ${query.get("userId")}`}</p>
      </Typography>
    </React.Fragment>
  );
}

export {Privacy}
