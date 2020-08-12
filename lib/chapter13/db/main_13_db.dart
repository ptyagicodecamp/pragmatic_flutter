//Persisting selected theme using Database
import 'package:flutter/material.dart';

import '../themes.dart';
import 'plugins/shared.dart';
import 'theme_prefs.dart';

//Uncomment the line below to run from this file
void main() => runApp(BooksApp());

//Showing book listing in ListView
class BooksApp extends StatefulWidget {
  @override
  _BooksAppState createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  AppThemes currentTheme = AppThemes.light;
  MyDatabase _database;

  //NEW CODE: Fetching theme_id DB
  void loadActiveTheme(BuildContext context) async {
    ThemePref themePref = await _database.getActiveTheme();
    setState(() {
      currentTheme = AppThemes.values[themePref.themeId];
    });
  }

  //NEW CODE: Save theme_id in DB
  Future<void> switchTheme() async {
    var oldTheme = currentTheme;

    currentTheme == AppThemes.light
        ? currentTheme = AppThemes.dark
        : currentTheme = AppThemes.light;

    //check if theme_id entry exists in table already
    var isOldThemeActive = _database.themeIdExists(oldTheme.index);

    //Only active theme id is present in the db.
    // Remove any existing theme id from DB before adding new entry
    if (isOldThemeActive != null) {
      _database.deactivateTheme(oldTheme.index);
    }
    setState(() {
      _database.activateTheme(currentTheme);
    });
  }

  @override
  void initState() {
    super.initState();

    //NEW CODE: Initializing DB
    _database = constructDb(logStatements: true);

    //NEW CODE: Loading theme from DB
    loadActiveTheme(context);
  }

  @override
  void dispose() {
    super.dispose();
    //NEW CODE: Don't forget to close the DB
    _database.close();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: currentTheme == AppThemes.light ? defaultTheme : darkTheme,
      home: Scaffold(
        appBar: AppBar(
            leading: Icon(Icons.home),
            title: Text("Books Listing"),
            actions: [
              IconButton(
                icon: Icon(Icons.all_inclusive),
                onPressed: () => switchTheme(),
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
