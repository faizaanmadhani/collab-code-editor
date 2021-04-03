import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../components/book.dart';

String baseUrl = '44c1980c1a0b.ngrok.io';

// Service to fetch all the books and load them into a book Object

Future<List<Book>> fetchBooks(String name) async {
  print("Fetching Data");
  final response = await http.post(
    Uri.http(baseUrl, '/api/search'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
    }),
  );
  if (response.statusCode == 200) {
    print("Received data");
    final booksJson = jsonDecode(response.body);
    return booksJson.map((bookJson) => Book.fromJson(bookJson)).toList();
  }
}