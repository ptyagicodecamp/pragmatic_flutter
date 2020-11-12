import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'book.dart';

class BookDetailsPage extends StatelessWidget {
  final BookModel book;
  const BookDetailsPage({Key key, this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.volumeInfo.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InformationWidget(
                book: book,
              ),
              ActionsWidget(
                book: book,
              ),
              DescriptionWidget(
                book: book,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InformationWidget extends StatelessWidget {
  final BookModel book;

  const InformationWidget({Key key, this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              book.volumeInfo.title != null
                  ? Text(
                      '${book.volumeInfo.title}',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )
                  : Container(),
              book.volumeInfo.subtitle != null
                  ? Text(
                      '${book.volumeInfo.subtitle}',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    )
                  : Container(),
              book.volumeInfo.authors != null
                  ? Text(
                      'Author(s): ${book.volumeInfo.authors.join(", ")}',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )
                  : Container(),
              book.volumeInfo.publisher != null
                  ? Text(
                      "Published by: ${book.volumeInfo.publisher}",
                      style:
                          TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                    )
                  : Container(),
              book.volumeInfo.publishedDate != null
                  ? Text(
                      "Published on: ${book.volumeInfo.publishedDate}",
                      style:
                          TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                    )
                  : Container(),
            ],
          ),
        ),
        book.volumeInfo.imageLinks.thumbnail != null
            ? Image.network(
                book.volumeInfo.imageLinks.thumbnail,
                fit: BoxFit.fill,
              )
            : Container(),
      ],
    );
  }
}

class ActionsWidget extends StatelessWidget {
  final BookModel book;

  const ActionsWidget({Key key, this.book}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          book.accessInfo.webReaderLink != null
              ? FloatingActionButton.extended(
                  label: Text("Read"),
                  heroTag: "webReaderLink",
                  onPressed: () => launch(book.accessInfo.webReaderLink),
                )
              : Container(),
          book.saleInfo.saleability == "FOR_SALE"
              ? FloatingActionButton.extended(
                  label: Text("Buy"),
                  heroTag: "buy_book",
                  onPressed: () => launch(book.saleInfo.buyLink),
                )
              : Container(),
        ],
      ),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  final BookModel book;

  const DescriptionWidget({Key key, this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return book.volumeInfo.description != null
        ? Text(book.volumeInfo.description.toString())
        : Container();
  }
}
