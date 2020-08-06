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
  MyThemes _currentTheme = MyThemes.light;
  MyThemes get currentTheme => _currentTheme;

  void switchTheme() {
    setState(() {
      _currentTheme =
          _currentTheme == MyThemes.light ? MyThemes.dark : MyThemes.light;
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: RootWidget.of(context).currentTheme == MyThemes.light
          ? themeData[0]
          : themeData[1],
      home: Scaffold(
        appBar: AppBar(
          title: Text("Books Listing"),
          actions: [
            IconButton(
              icon: Icon(Icons.all_inclusive),
              onPressed: () => RootWidget.of(context).switchTheme(),
            )
          ],
        ),
        body: child,
      ),
    );
  }
}

enum MyThemes { light, dark }

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
