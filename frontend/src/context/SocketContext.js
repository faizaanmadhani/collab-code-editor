import React from "react";
const io = require("socket.io-client");
export const socket = io.connect("localhost:3500");

const SocketContext = React.createContext(socket);
export const SocketProvider = SocketContext.Provider;
export default SocketContext;
