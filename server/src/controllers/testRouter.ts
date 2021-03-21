import * as Express from 'express';

export const TestRouter = Express.Router();

TestRouter.get('/', (req: Express.Request, res: Express.Response) => {
    res.status(200).json({
        "Msg": "Hello, World"
    });
});

