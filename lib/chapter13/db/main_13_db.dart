//Persisting selected theme using Database
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../themes.dart';
import 'plugins/shared.dart';
import 'theme_prefs.dart';

//Uncomment the line below to run from this file
//void main2() => runApp(BooksApp());
void main() => runApp(
      Provider<MyDatabase>(
        create: (_) => constructDb(logStatements: true),
        dispose: (context, db) => db.close(),
        child: BooksApp(),
      ),
    );

//Showing book listing in ListView
class BooksApp extends StatefulWidget {
  @override
  _BooksAppState createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  AppThemes currentTheme = AppThemes.light;

  Future<void> persistTheme(AppThemes theme) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setInt('theme_id', theme.index);
  }

  //NEW CODE: Fetching theme_id DB
  Future<int> getActiveThemeID(BuildContext context) {
    return Provider.of<MyDatabase>(context, listen: false)
        .getActiveTheme()
        .then((themePref) => themePref.themeId);
  }

  void loadActiveTheme(BuildContext context) async {
    int themeId = await getActiveThemeID(context);
    setState(() {
      currentTheme = AppThemes.values[themeId];
    });
  }

  //NEW CODE: Save theme_id in DB
  void switchTheme(BuildContext context) async {
    var oldTheme = currentTheme;

    currentTheme == AppThemes.light
        ? currentTheme = AppThemes.dark
        : currentTheme = AppThemes.light;

    var myDatabase = Provider.of<MyDatabase>(context, listen: false);
    var isOldThemeActive = myDatabase.themeIdExists(oldTheme.index);

    if (isOldThemeActive != null) {
      myDatabase.deactivateTheme(oldTheme.index);
    }
    setState(() {
      myDatabase.activateTheme(currentTheme);
    });
  }

  @override
  void initState() {
    super.initState();

    //NEW CODE: Load theme from sharedPreference
    loadActiveTheme(context);
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
                onPressed: () => switchTheme(context),
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
