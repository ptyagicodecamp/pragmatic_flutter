import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config.dart';

//Uncomment the line below to run from this file
void main() => runApp(BooksApp());

//Making HTTP request
Future<String> makeHttpCall() async {
  final apiKey = "$YOUR_API_KEY";
  final apiEndpoint =
      "https://www.googleapis.com/books/v1/volumes?key=$apiKey&q=python+coding";
  final http.Response response =
      await http.get(apiEndpoint, headers: {'Accept': 'application/json'});

  //This will print `flutter: Instance of 'Response'` on console.
  print(response);
  return response.body;
}

class BooksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BooksListing(),
    );
  }
}

class BooksListing extends StatefulWidget {
  @override
  _BooksListingState createState() => _BooksListingState();
}

class _BooksListingState extends State<BooksListing> {
  String booksResponse;

  //method to fetch books asynchronously
  fetchBooks() async {
    //making REST API call
    var response = await makeHttpCall();

    //Updating booksResponse to fetched remote data
    setState(() {
      booksResponse = response;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    //fetching books listing
    //fetchBooks();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: booksResponse != null
              ? Text("Google Books API response\n $booksResponse")
              : Text("No Response from API"),
        ),
      ),
    );
  }
}
