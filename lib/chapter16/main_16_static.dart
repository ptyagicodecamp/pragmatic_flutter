//importing the Dart package 
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config.dart';
import 'book.dart';
import 'book_details_page.dart';
import 'booktile.dart';

//Uncomment the line below to run from this file
//void main() => runApp(BooksApp());

//The booksListing data is available global to app
List<BookModel> booksListing;

class BooksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Using Static Navigation (Named Routing)
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: BooksListing(),
      //Named-Routing using Map routing-table
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => BooksListing(),
        '/details': (BuildContext context) => BookDetailsPage(
          book: booksListing[0],
        ),
      },
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
                Navigator.pushNamed(context, '/details')
          );
        },
      ),
    );
  }
}

