// Find all the book data

import * as Express from 'express';
import { Body } from 'node-fetch';
import { Book } from '../types/Book'
const axios = require('axios').default;

export const DataRouter = Express.Router();

DataRouter.post('/', async (req: Express.Request, res: Express.Response) => {

    try {
        const key: String = req.body.key;
        const bookData = await axios.get(`https://openlibrary.org${key}.json`);
        const author: String = bookData.data.authors[0].author.key
        console.log(author)
        const authorData = await axios.get(`https://openlibrary.org/${author}.json`);
        const authorName = authorData.data.name;
        console.log(authorName)
    
        const book: Book = {
            title: bookData.data.title,
            authors: [authorName],
            openlibKey: key,
            publishDate: bookData.data.first_publish_date,
            blurb: bookData.data.description.value
        };
        res.status(200).json(book);
    } catch (e) {
        res.status(500).json(e)
    }

});

