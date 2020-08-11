import 'package:flutter/material.dart';

//Chapter07: Adding 'Hello Books' text in the center of the screen
//NO SafeArea
//void main() {
//  runApp(HelloBooksApp());
//}

class HelloBooksApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //Text Widget without SafeArea
      home: Text('Hello Books'),
    );
  }
}
