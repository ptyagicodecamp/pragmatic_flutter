//importing the Dart package 
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config.dart';
import 'book.dart';
import 'book_details_page.dart';
import 'booktile.dart';

//Showing book listing in ListView
class BooksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Using Direct Navigation (un-named routing)
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BooksListing(),
    );
  }
}

//Making HTTP request
//Function to make REST API call
Future<List<BookModel>> makeHttpCall() async {
  //API Key: To be replaced with your key
  final apiKey = "$YOUR_API_KEY";
  final apiEndpoint =  "https://www.googleapis.com/books/v1/volumes?key=$apiKey&q=python+coding";
  final http.Response response =
  await http.get(apiEndpoint, headers: {'Accept': 'application/json'});

  //Parsing API's HttpResponse to JSON format
  //Converting string response body to JSON representation
  final jsonObject = json.decode(response.body);

  var list = jsonObject['items'] as List;
  //return the list of Book objects
  return list.map((e) => BookModel.fromJson(e)).toList();
}

class BooksListing extends StatefulWidget {
  @override
  _BooksListingState createState() => _BooksListingState();
}

class _BooksListingState extends State<BooksListing> {
  List<BookModel> booksListing;
  fetchBooks() async {
    var response = await makeHttpCall();

    setState(() {
      booksListing = response;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Books Listing"),
      ),
      body: ListView.builder(
        itemCount: booksListing == null ? 0 : booksListing.length,
        itemBuilder: (context, index) {
          //Passing bookModelObj to BookTile widget
          return GestureDetector(
            child: BookTile(bookModelObj: booksListing[index]),
            onTap: () =>
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BookDetailsPage(
                    book: booksListing[index],
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}

