import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Multi-child layout widget
/// Scrolling widget.
void main() => runApp(ListViewDemo());

class ListViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyListView(),
    );
  }
}

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Widget"),
      ),
      body: ListView(
        children: [
          childWidget(0),
          childWidget(1),
          childWidget(2),
          childWidget(3),
        ],
      ),
    );
  }

  Widget childWidget(int index) {
    return Container(
      color: getColor(index),
      width: 200,
      height: 200,
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
