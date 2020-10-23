import 'package:flutter/material.dart';

/// Single-child layout widget
/// Creates a box of specific size.
void main() => runApp(SizedBoxDemo());

class SizedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MySizedBox(),
    );
  }
}

class MySizedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SizedBox Widget"),
      ),
      //SizedBox Widget Usage
      body: sizedBoxExpanded(),
    );
  }

  /// Creates SizedBox as large as its parent
  Widget sizedBoxExpanded() {
    return SizedBox.expand(
      child: Container(
        color: Colors.deepPurpleAccent,
      ),
    );
  }

  /// Creates SizedBox of specific width and height
  Widget sizedBox() {
    return SizedBox(
      height: 200, //double.infinity,
      width: 200, //double.infinity,
      child: Container(
        color: Colors.deepPurpleAccent,
      ),
    );
  }
}
