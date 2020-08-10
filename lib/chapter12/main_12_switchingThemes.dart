//Building BooksApp App's User Interface.
//Switching from default light theme to dark theme and vice versa
import 'package:flutter/material.dart';

import 'themes.dart';

enum AppThemes { light, dark }

//Uncomment the line below to run from this file
void main() => runApp(BooksApp());

//Showing book listing in ListView
class BooksApp extends StatefulWidget {
  @override
  _BooksAppState createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  //NEW CODE
  var currentTheme = AppThemes.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //NEW CODE: applying selected theme
      theme: currentTheme == AppThemes.light ? defaultTheme : darkTheme,
      home: Scaffold(
        appBar: AppBar(
            leading: Icon(Icons.home),
            title: Text("Books Listing"),
            actions: [
              IconButton(
                icon: Icon(Icons.all_inclusive),
                //NEW CODE: Toggling from light to dark theme and vice versa
                onPressed: () {
                  setState(() {
                    currentTheme = currentTheme == AppThemes.light
                        ? AppThemes.dark
                        : AppThemes.light;
                  });
                },
              )
            ]),
        body: BooksListing(),
      ),
    );
  }
}

List bookData() {
  return [
    {
      'title': 'Book Title',
      'authors': ['Author1', 'Author2'],
      'image': 'assets/book_cover.png'
    },
    {
      'title': 'Book Title 2',
      'authors': ['Author1'],
      'image': 'assets/book_cover.png'
    }
  ];
}

class BooksListing extends StatelessWidget {
  final booksListing = bookData();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: booksListing == null ? 0 : booksListing.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${booksListing[index]['title']}',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      booksListing[index]['authors'] != null
                          ? Text(
                              'Author(s): ${booksListing[index]['authors'].join(", ")}',
                              style: TextStyle(fontSize: 14),
                            )
                          : Text(""),
                    ],
                  ),
                ),
                booksListing[index]['image'] != null
                    ? Image.asset(
                        booksListing[index]['image'],
                        fit: BoxFit.fill,
                      )
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }
}
