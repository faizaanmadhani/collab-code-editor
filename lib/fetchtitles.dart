import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


Future<List<BookObjects>> fetchBooks(String name, http.Client client) async {
  String nameParsed = name.replaceAll(" ", "+");
  final response = await client.get('http://openlibrary.org/search.json?title=$nameParsed');
  return compute(parseBooks, response.body);
}

List <BookObjects> parseBooks(String responseBody) {
  final parsed = jsonDecode(responseBody)["docs"].cast<Map<String,dynamic>>();

  return parsed.map<BookObjects>((json) => BookObjects.fromJson(json)).toList();

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