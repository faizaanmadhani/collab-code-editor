import 'dart:convert';
import 'package:http/http.dart' as http;

class BooksLoadModel {

  static Future<http.Response> fetchBooks(String name) async {
    String nameParsed = name.replaceAll(" ", "+");
    final response = await http.get(Uri.https('http://openlibrary.org', '/search.json?title=$nameParsed'));
    if (response.statusCode == 200) {
      try {
      } catch (e) {
        print(e);
      }
    }
  }

}

class BookObjects {
  String title;
  List<String> authors;
  String publisher;

  BookObjects({
    this.title,
    this.authors,
    this.publisher,
  });

  factory BookObjects.fromJson(Map<String, dynamic> parsedJson) {
    return BookObjects(
      title: parsedJson['keyword'] as String,
      authors: parsedJson['authors'] as List<String>,
      publisher: parsedJson['country'] as String
    );
  }


}