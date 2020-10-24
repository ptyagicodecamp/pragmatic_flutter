import 'package:flutter/material.dart';

/// Single-child layout widget
/// Expands all the child widgets of Column to the same size of the widest child widget.
void main() => runApp(IntrinsicWidthDemo());

class IntrinsicWidthDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyIntrinsicWidth(),
    );
  }
}

class MyIntrinsicWidth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IntrinsicWidth Widget"),
      ),
      //IntrinsicWidth Widget Usage
      body: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            childWidget(0),
            childWidget(1),
            childWidget(2),
          ],
        ),
      ),
    );
  }

  Widget childWidget(int index) {
    return Container(
      color: getColor(index),
      width: 100 + index * 20.toDouble(),
      height: 100 + index * 30.toDouble(),
      child: Center(
        child: Text(
          "$index",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }

  Color getColor(int index) {
    Color color = Colors.grey;
    switch (index) {
      case 0:
        color = Colors.red;
        break;

      case 1:
        color = Colors.green;
        break;

      case 2:
        color = Colors.deepPurple;
        break;
    }

    return color;
  }
}
