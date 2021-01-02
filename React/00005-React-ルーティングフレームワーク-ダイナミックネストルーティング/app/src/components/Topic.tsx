import React from "react";
import Typography from "@material-ui/core/Typography";
import { useRouteMatch } from "react-router-dom";

type Props = {
  topicTitle: string;
};

function Topic(props: Props) {
  const { topicTitle } = { ...props };

  const { path, url } = useRouteMatch();

  console.log(path, url)

  const commonPath = path.split(/(?=\/)/).splice(0,path.split(/(?=\/)/).length-1).join("");
  const keyPath = path.replace(new RegExp(commonPath+"/"),"")
  const valuePath = url.replace(new RegExp(commonPath+"/"),"")

  return (
    <React.Fragment>
      <Typography variant="h6" gutterBottom>
        {topicTitle}
        <p>トピックダヨーン</p>
        <p>keyPath is {keyPath}</p>
        <p>valuePath is {valuePath}</p>
      </Typography>
    </React.Fragment>
  );
}

export { Topic };
