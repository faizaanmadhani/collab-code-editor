import { React, useContext } from "react";
import Environment from "./Environment";
import SocketContext from "../context/SocketContext";

const HomePage = () => {
  const socket = useContext(SocketContext);
  const create = (userName) => {
    socket.emit("create-room", {
      user: userName,
    });
  };

  const join = (userName, roomID) => {
    socket.emit("join-room", {
      room: roomID,
      user: userName,
    });
  };

  return <Environment />;
};

export default HomePage;
