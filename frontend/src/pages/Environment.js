import Editor from "../components/Editor";
import Chat from "../components/Chat";
import Grid from "@material-ui/core/Grid";

const Environment = (props) => {
  return (
    <Grid container direction='row' justify='center' alignItems='stretch'>
      <Editor />
      {/* <Chat /> */}
    </Grid>
  );
};

export default Environment;
