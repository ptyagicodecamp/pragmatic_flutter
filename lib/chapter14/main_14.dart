import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config.dart';

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
      home: BookListing(),
    );
  }
}

class BookListing extends StatefulWidget {
  @override
  _BookListingState createState() => _BookListingState();
}

class _BookListingState extends State<BookListing> {
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
