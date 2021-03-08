import 'dart:convert';
import 'package:http/http.dart' as http;


Future<http.Response> fetchBooks(String name) async {
  String nameParsed = name.replaceAll(" ", "+");
  return http.get(
      Uri.https('http://openlibrary.org', '/search.json?title=$nameParsed')
  );
}

List <BookObjects> parseBooks(String responseBody) {
  final parsed == jsonDecode(responseBody).cast
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