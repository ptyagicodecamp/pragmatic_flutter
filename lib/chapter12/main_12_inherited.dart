///Switching Themes using InheritedWidget
import 'package:flutter/material.dart';

import 'booklisting.dart';

void main() => runApp(BooksApp());

class BooksApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RootWidget(
      child: BooksAppPage(
        child: BooksListing(),
      ),
    );
  }
}

class RootWidget extends StatefulWidget {
  final Widget child;

  const RootWidget({Key key, @required this.child}) : super(key: key);

  static RootWidgetState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>().data;
  }

  @override
  State<StatefulWidget> createState() => RootWidgetState();
}

class RootWidgetState extends State<RootWidget> {
  int _themeIndex = 0;
  int get themeIndex => _themeIndex;

  void switchTheme() {
    setState(() {
      _themeIndex = _themeIndex == 0 ? 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      child: widget.child,
      data: this,
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  final RootWidgetState data;

  MyInheritedWidget({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class BooksAppPage extends StatelessWidget {
  final Widget child;

  BooksAppPage({
    Key key,
    @required this.child,
  }) : super(key: key);

  void smileyPressed(BuildContext context) {
    RootWidget.of(context).switchTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData[RootWidget.of(context).themeIndex],
      home: Scaffold(
        appBar: AppBar(
          title: Text("Books Listing"),
          actions: [
            IconButton(
              icon: Icon(Icons.insert_emoticon),
              onPressed: () => smileyPressed(context),
            )
          ],
        ),
        body: child,
      ),
    );
  }
}

final List<ThemeData> themeData = [
  ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      accentColor: Colors.lightBlueAccent),
  ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.orange,
      accentColor: Colors.yellowAccent)
];
