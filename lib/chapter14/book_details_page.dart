import 'package:flutter/material.dart';

import 'book.dart';

class BookDetailsPage extends StatelessWidget {
  final BookModel book;
  const BookDetailsPage({Key key, this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Added Scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text(book.volumeInfo.title),
      ),
      body: Center(
        child: Text(book.volumeInfo.description),
      ),
    );
  }
}
