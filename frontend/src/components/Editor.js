import { useContext } from "react";
import SocketContext from "../context/SocketContext";
import { useEffect, useState } from "react";
import { Controlled as CodeMirror } from "react-codemirror2";
// Import theme data
import "codemirror/lib/codemirror.css";
import "codemirror/theme/monokai.css";
import "codemirror/mode/python/python.js";

const Editor = (props) => {
  //Declare state
  const [code, setCode] = useState("");
  const [mode, setMode] = useState("python");
  const [theme, setTheme] = useState("monokai");
  const [users, setUsers] = useState([]);
  const socket = useContext(SocketContext);

  socket.on("receive-code", (payload) => {
    updateCodeFromSocket(payload);
  });

  const updateCodeFromUser = (text) => {
    setCode(text);
    console.log("Emit change");
    socket.emit("code-update", {
      code: text,
    });
  };

  const updateCodeFromSocket = (payload) => {
    setCode(payload.code);
  };

  const options = {
    lineNumbers: true,
    mode: mode,
    theme: "monokai",
  };
  return (
    <CodeMirror
      value={code}
      options={options}
      onBeforeChange={(editor, data, value) => {
        updateCodeFromUser(value);
      }}
      onChange={(editor, data, value) => {}}
    ></CodeMirror>
  );
};

export default Editor;
