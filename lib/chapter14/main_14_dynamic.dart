//importing the Dart package
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config.dart';
import 'book.dart';
import 'book_details_page.dart';
import 'booktile.dart';
import 'page_not_found.dart';

/// Chapter14: Navigation & Routing
//Uncomment the line below to run from this file
//void main() => runApp(BooksApp());

class BooksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Using Dynamic Navigation (Named Routing)
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BooksListing(),
      //Named with onGenerateRoute
      initialRoute: '/',
      onGenerateRoute: generateRoute,
    );
  }
}

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  final args = routeSettings.arguments;

  switch (routeSettings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (context) => BooksListing(),
      );

    case '/details':
      if (args is BookModel) {
        return MaterialPageRoute(
          builder: (context) => BookDetailsPage(
            book: args,
          ),
        );
      }

      return MaterialPageRoute(
        builder: (context) => PageNotFound(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => PageNotFound(),
      );
  }
}

//Making HTTP request
//Function to make REST API call
Future<List<BookModel>> makeHttpCall() async {
  //API Key: To be replaced with your key
  final apiKey = "$YOUR_API_KEY";
  final apiEndpoint =
      "https://www.googleapis.com/books/v1/volumes?key=$apiKey&q=python+coding";
  final http.Response response = await http
      .get(Uri.parse(apiEndpoint), headers: {'Accept': 'application/json'});

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
              onTap: () => Navigator.pushNamed(
                    context,
                    '/details',
                    arguments: booksListing[index],
                  ));
        },
      ),
    );
  }
}
