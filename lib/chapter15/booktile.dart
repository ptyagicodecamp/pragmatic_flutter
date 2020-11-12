import 'package:flutter/material.dart';

import 'book.dart';

class BookTile extends StatelessWidget {
  final BookModel bookModelObj;

  const BookTile({Key key, this.bookModelObj}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                    '${bookModelObj.volumeInfo.title}',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  bookModelObj.volumeInfo.authors != null
                      ? Text(
                          'Author(s): ${bookModelObj.volumeInfo.authors.join(", ")}',
                          style: TextStyle(fontSize: 14),
                        )
                      : Text(""),
                ],
              ),
            ),
            bookModelObj.volumeInfo.imageLinks.thumbnail != null
                ? Image.network(
                    bookModelObj.volumeInfo.imageLinks.thumbnail,
                    fit: BoxFit.fill,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
