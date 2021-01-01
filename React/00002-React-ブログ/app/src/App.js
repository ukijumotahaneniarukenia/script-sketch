import React from 'react';
import CssBaseline from '@material-ui/core/CssBaseline';
import Container from '@material-ui/core/Container';
import Header from '../src/components/Header';
import Footer from '../src/components/Footer';
import Markdown from '../src/components/Markdown';

function App() {
  return (
    <React.Fragment>
      <CssBaseline />
      <Container maxWidth="lg">
        <Header title="Just Another Nak5 Press" />
        <Markdown />
        <Markdown />
        <Markdown />
        <Markdown />
        <Markdown />
        <Markdown />
        <Markdown />
        <Markdown />
        <Markdown />
        <Markdown />
      </Container>
      <Footer title="Thank you" />
    </React.Fragment>
  );
}

export default App
