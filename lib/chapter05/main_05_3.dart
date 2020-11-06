import 'package:flutter/material.dart';

//Chapter05: Adding 'Hello Books' text in the center of the screen
//Scaffold + AppBar + Center + FloatingActionButton
//void main() {
//  runApp(HelloBooksApp());
//}

class HelloBooksApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello Books'),
        ),
        body: Center(
          child: Text(
            'Hello Books',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Greeting',
          child: Icon(Icons.insert_emoticon),
        ),
      ),
    );
  }
}
