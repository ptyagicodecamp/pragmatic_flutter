import 'package:flutter/material.dart';

//Chapter05: Adding 'Hello Books' text in the center of the screen
//With SafeArea
//void main() {
//  runApp(HelloBooksApp());
//}

class HelloBooksApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Text('Hello Books'),
      ),
    );
  }
}
