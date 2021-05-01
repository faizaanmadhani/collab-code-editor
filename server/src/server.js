const express = require("express");
const open = require("open");
const port = 3500;

const app = express();

const server = app.listen(port);

const io = require("socket.io")(server, {
  cors: {
    origin: "*",
  },
});

io.on("connection", (socket) => {
  console.log("A user connected");

  socket.on("disconnect", () => {
    console.log("A user disconnected");
  });

  socket.on("code-update", (data) => {
    socket.broadcast.emit("receive-code", data);
  });
});
