import React from "react";
import Typography from "@material-ui/core/Typography";
import { Switch, Route, Link, useRouteMatch } from "react-router-dom";
import {Topic} from './Topic'

type Props = {
  aboutTitle: string;
};

function About(props: Props) {
  const { aboutTitle } = { ...props };
  const { path, url } = useRouteMatch();

  console.log(path, url)

  return (
    <React.Fragment>
      <Typography variant="h6" gutterBottom>
        {aboutTitle}
        <p>アバウトページダヨーン</p>
      </Typography>
      <div>
        <h2>Topics</h2>
        <ul>
          <li>
            <Link to={`${url}/rendering`}>Rendering with React</Link>
          </li>
          <li>
            <Link to={`${url}/components`}>Components</Link>
          </li>
          <li>
            <Link to={`${url}/props-v-state`}>Props v. State</Link>
          </li>
        </ul>

        <Switch>
          <Route exact path={path}>
            <h3>Please select a topic.</h3>
          </Route>
          <Route path={`${path}/:topicId`}>
            <Topic topicTitle = ""/>
          </Route>
        </Switch>
      </div>
    </React.Fragment>
  );
}

export { About };
