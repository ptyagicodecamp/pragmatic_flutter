import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Multi-child layout widget
/// Arranges its children horizontally
void main() => runApp(RowDemo());

class RowDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyRow(),
    );
  }
}

class MyRow extends StatefulWidget {
  @override
  _MyRowState createState() => _MyRowState();
}

class _MyRowState extends State<MyRow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row Widget"),
      ),
      body: Row(
        children: [
          childWidget(0),
          childWidget(1),
          childWidget(2),
          //childWidget(3),
        ],
      ),
    );
  }

  Widget childWidget(int index) {
    return Container(
      color: getColor(index),
      width: 100,
      height: 100,
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
