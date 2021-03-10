import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../components/book.dart';

// Service to fetch all the books and load them into a book Object


Future<List<Book>> fetchBooks(String name) async {
  String nameParsed = name.replaceAll(" ", "+");
  final response = await http.get(
      'http://openlibrary.org/search.json?title=$nameParsed');
  if (response.statusCode == 200) {
    final booksJson = jsonDecode(response.body)['books'];
    return booksJson.map((bookJson) => Book.fromJson(bookJson)).toList();
  }
}