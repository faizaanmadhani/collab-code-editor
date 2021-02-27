import 'package:flutter/material.dart';

String placeHolderImgUrl = 'https://s31531.pcdn.co/wp-content/uploads/2019/01/370.jpg';

class Book extends StatelessWidget {

  String _bookTitle;
  String _author;
  String _coverImageUrl;
  String _buyLink;

  Book(String title, String author) {
    this._bookTitle = title;
    this._author = author;
    this._coverImageUrl = placeHolderImgUrl;
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.arrow_drop_down_circle),
            title: new Text(this._bookTitle),
            subtitle: Text(
              this._author,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Lorem Ipsum Dorem Placeholder text',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
        ],
      ),
    );
  }

}