import 'package:flutter/material.dart';

//Chapter07: Adding 'Hello Books' text in the center of the screen
//With SafeArea + Center widget
void main() {
  runApp(HelloBooksApp());
}

class HelloBooksApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Center(
          child: Text('Hello Books'),
        ),
      ),
    );
  }
}
