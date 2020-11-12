///Switching Themes using Provider package
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'booklisting.dart';
import 'themes_notifier.dart';

//Entry point to app
//void main() => runApp(
//      ChangeNotifierProvider<ThemesNotifier>(
//        child: BooksApp(),
//        create: (BuildContext context) {
//          return ThemesNotifier();
//        },
//      ),
//    );

class BooksApp extends StatefulWidget {
  @override
  _BooksAppState createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Provider.of<ThemesNotifier>(context).currentThemeData,
        home: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.home),
            title: Text("Books Listing"),
            actions: [
              IconButton(
                icon: Icon(Icons.all_inclusive),
                onPressed: () =>
                    Provider.of<ThemesNotifier>(context, listen: false)
                        .switchTheme(),
              )
            ],
          ),
          body: BooksListing(),
        ));
  }

  Widget body() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Image.asset(
              "assets/book_cover.png",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Beautiful Ocean",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 30,
          ),
          RaisedButton(
            child: Text("Switch Theme"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
