import { React, Component } from "react";
import HomePage from "./pages/HomePage";
import { Container } from "@material-ui/core";
import { SocketProvider, socket } from "./context/SocketContext";

class App extends Component {
  render() {
    return (
      <SocketProvider value={socket}>
        <HomePage />
      </SocketProvider>
    );
  }
}

export default App;
