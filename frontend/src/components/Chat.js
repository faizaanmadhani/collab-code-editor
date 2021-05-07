import { React, useState } from "react";
import List from "@material-ui/core/List";
import ListItem from "@material-ui/core/ListItem";
import ListItemText from "@material-ui/core/ListItemText";
import Grid from "@material-ui/core/Grid";
import TextField from "@material-ui/core/TextField";
import Box from "@material-ui/core/Box";
import Button from "@material-ui/core/Button";

const Chat = (props) => {
  const [messages, setMessages] = useState([]);
  const [sendText, setSendText] = useState("");
  const socket = props.socket;

  socket.on("receive-message", (payload) => {
    console.log("Receive message", payload.message);
    setMessages([...messages, payload.message]);
    console.log(messages);
  });

  const postMessage = () => {
    console.log("Posting a message");
    setMessages([...messages, sendText]);
    socket.emit("new-message", {
      message: sendText,
    });
  };

  const updateSendText = (event) => {
    setSendText(event.target.value);
  };
  return (
    <Grid container direction='column' justify='center' alignItems='stretch'>
      <Grid container direction='column'>
        {messages.length !== 0 ? (
          messages.map((message) => {
            <Box>{message}</Box>;
          })
        ) : (
          <Box>Send a Message!</Box>
        )}
      </Grid>
      <Grid container direct='row'>
        <TextField
          id='outlined-multiline-static'
          label='Multiline'
          rows={4}
          variant='outlined'
          onChange={updateSendText}
        />
        <Button variant='contained' color='primary' onClick={postMessage}>
          Send Message
        </Button>
      </Grid>
    </Grid>
  );
};

export default Chat;
