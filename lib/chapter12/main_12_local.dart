//Building BooksApp App's User Interface.
//Local theme demonstration
import 'package:flutter/material.dart';

import 'themes.dart';

//Uncomment the line below to run from this file
//void main() => runApp(BooksApp());

//Showing book listing in ListView
class BooksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home),
          title: Text("Books Listing"),
        ),
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
    return Theme(
      //ThemeData local to Card widget
      data: ThemeData(
        cardColor: Colors.pinkAccent,
        //Creating local TextTheme
        textTheme: TextTheme(
          headline6: TextStyle(fontFamily: 'Pangolin', fontSize: 20),
          //Extending on parent's TextTheme
          bodyText2: Theme.of(context)
              .copyWith(
                textTheme: TextTheme(
                  bodyText2: TextStyle(fontStyle: FontStyle.italic),
                ),
              )
              .textTheme
              .bodyText2,
        ),
      ),
      child: ListView.builder(
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
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        booksListing[index]['authors'] != null
                            ? Text(
                                'Author(s): ${booksListing[index]['authors'].join(", ")}',
                                style: Theme.of(context).textTheme.bodyText2,
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
      ),
    );
  }
}
