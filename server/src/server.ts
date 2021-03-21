import * as bodyParser from 'body-parser';

// import * as controllers from './controllers';
import { Server } from 'http';
import cors from 'cors';
import helmet from 'helmet';
import express from 'express';
import session from 'express-session';

//Import Routers
import { TestRouter } from './controllers/testRouter'
import { SearchRouter } from './controllers/searchRouter';
import { DataRouter } from './controllers/dataRouter';

class ReadingListServer extends Server {
    public app = express()
    private readonly SERVER_STARTED = 'Example server started on port: ';

    constructor() {
        super();
        this.app.use(bodyParser.json());
        this.app.use(bodyParser.urlencoded({ extended: true }));
        this.app.use(session({ secret: 'S3CRE7', resave: true, saveUninitialized: true }));

        this.app.use(helmet());
        this.app.use(cors());
        this.app.use(express.json());
    }

    public start(port: string) {
        this.app.use("/api/test", TestRouter);
        this.app.use("/api/search", SearchRouter);
        this.app.use("/api/book", DataRouter);
        
        this.app.listen(port, () => {
            console.log(this.SERVER_STARTED + port);
        });
    }
}

export { ReadingListServer };