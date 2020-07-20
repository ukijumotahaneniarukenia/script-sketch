import React from 'react';
import logo from './logo.svg';
import './App.css';

import {
  Switch,
  Route,
  Link,
  useParams,
  useRouteMatch
} from "react-router-dom";

function App() {
  return (
    <div>
      {/* 初期表示のリンクここから */}
      <ul>
        <li>
          <Link to="/">Home</Link>
        </li>
        <li>
          <Link to="/about">About</Link>
        </li>
        <li>
          <Link to="/contacts">Contacts</Link>
        </li>
      </ul>
      {/* 初期表示のリンクここまで */}





      {/* 初期表示のリンク誘導設定ここから */}
      <Switch>
        {/* If the current URL is /about, this route is rendered
            while the rest are ignored */}
        <Route path="/about">
          {/* [/about]のアドレスだったら、Aboutコンポーネントにデリゲート */}
          <About />
        </Route>

        {/* Note how these two routes are ordered. The more specific
            path="/contact/:id" comes before path="/contact" so that
            route will render when viewing an individual contact */}
        <Route path="/contact/:id">
          {/* サブ */}
          {/* [/contact/:id]のアドレスだったら、Contactコンポーネントにデリゲート */}
          <Contact />
        </Route>
        <Route path="/contacts">
          {/* メイン */}
          {/* [/contacts]のアドレスだったら、Contactコンポーネントにデリゲート */}
          <AllContacts />
        </Route>

        {/* If none of the previous routes render anything,
            this route acts as a fallback.

            Important: A route with path="/" will *always* match
            the URL because all URLs begin with a /. So that's
            why we put this one last of all */}
        <Route path="/">
          {/* [/]のアドレスだったら、Homeコンポーネントにデリゲート */}
          <Home />
        </Route>
      </Switch>
      {/* 初期表示のリンク誘導設定ここまで */}
    </div>
  );
}

function Home() {
  return <h2>Home</h2>;
}

function About() {
  return <h2>About</h2>;
}


//複数明細
//コンポーネントごとに必要なdomとリンク誘導をSwitchタグで書いてやる

function AllContacts(){
  let match = useRouteMatch();

  return (
    <div>
      <h2>Contacts</h2>

      <ul>
        <li>
          <Link to={`${match.url}/contacts`}>contacts</Link>
        </li>
      </ul>

      {/* The Topics page has its own <Switch> with more routes
          that build on the /topics URL path. You can think of the
          2nd <Route> here as an "index" page for all topics, or
          the page that is shown when no topic is selected */}
      <Switch>
        <Route path={`${match.path}/:contactId`}>
          {/* サブ */}
          <Contact />
        </Route>
        <Route path={match.path}>
          {/* メイン */}
          <h3>Please select a contact.</h3>
        </Route>
      </Switch>
    </div>
  );
}

//単一明細
function Contact() {
  // Linkコンポーネントのto属性値の末尾要素の文字列を受け取る
  // :topicIdはLinkコンポーネントの末尾要素文字列と対応
  let { contactId } = useParams();
  return <h3>Requested contact ID: {contactId}</h3>;
}

export default App;
