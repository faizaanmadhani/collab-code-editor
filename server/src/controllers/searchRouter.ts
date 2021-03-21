import * as Express from 'express';
import { Book } from '../types/Book'
const axios = require('axios').default;

export const SearchRouter = Express.Router();

const formatBook = (book: any): Book => {
    const returnBook: Book = {
        title: book.title,
        authors: book.author_name,
        openlibKey: '/works/OL27448W',
        imageUrl: `http://covers.openlibrary.org/b/id/${book.cover_i}-M`
    }

    return returnBook
}

// Add infinite scroll and pagination

const findClosestBooks = (name: String): Promise<Book[]> =>  {
    return axios.get(`http://openlibrary.org/search.json?title=${name}`)
        .then((res: any) => {
            return res.data.docs
        })
        .then((docs: any) => docs.map((book: any) => formatBook(book)).slice(0, 10))
}

SearchRouter.post('/', async (req: Express.Request, res: Express.Response) => {
    var name = req.body['name'];
    if (name == undefined || name == "" || name == null) {
        return res.status(400).json({
            "msg":"No Search terms specified"
        })
    } else {
        name = name.split(' ').join('+');
        console.log(name)
        const books: Book[] = await findClosestBooks(name);
        res.status(200).send(books)
    }
});