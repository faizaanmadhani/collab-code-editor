import 'package:flutter/material.dart';

String placeHolderImgUrl = 'https://s31531.pcdn.co/wp-content/uploads/2019/01/370.jpg';

class Book extends StatelessWidget {

  String _title;
  List<String> _authors;
  String _coverImageUrl;
  String publisher;

  Book(String title, List<String> authors, String imageUrl, String publisher) {
    this._title = title;
    this._authors = authors;
    this._coverImageUrl = imageUrl;
  }

  factory Book.fromJson(Map<String, dynamic> parsedJson) {
    return Book(
        parsedJson['keyword'] as String,
        parsedJson['authors'] as List<String>,
        parsedJson['country'] as String,
        parsedJson['imageUrl'] as String
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
      clipBehavior: Clip.antiAlias,
      // Add in Image
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.arrow_drop_down_circle),
            title: new Text(this._title),
            subtitle: Text(
              this._authors[0], //Current Hardcoded for only one author to be displayed. Refactor for dynamic displaying
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Placeholder description text', // Pass through blurbs
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
        ],
      ),
    );
  }

}