import { ReadingListServer } from "./server"

const port = "3030"
const server = new ReadingListServer();
server.start(port);
