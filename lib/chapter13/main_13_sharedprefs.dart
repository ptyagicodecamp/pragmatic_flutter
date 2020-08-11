//Persisting selected theme using sharedPreference
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'themes.dart';

//Uncomment the line below to run from this file
void main() => runApp(BooksApp());

//Showing book listing in ListView
class BooksApp extends StatefulWidget {
  @override
  _BooksAppState createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  AppThemes currentTheme = AppThemes.light;

  //NEW CODE: Save theme_id using SharedPreference
  Future<void> persistTheme(AppThemes theme) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setInt('theme_id', theme.index);
  }

  //NEW CODE: Fetching theme_id from SharedPreference
  void loadActiveTheme(BuildContext context) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    int themeId = sharedPrefs.getInt('theme_id') ?? AppThemes.light.index;

    setState(() {
      currentTheme = AppThemes.values[themeId];
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
                onPressed: () {
                  setState(() {
                    currentTheme = currentTheme == AppThemes.light
                        ? AppThemes.dark
                        : AppThemes.light;

                    //NEW CODE: save current selection
                    persistTheme(currentTheme);
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
