import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Multi-child layouts
/// Wrap widget is helpful when Row and Column widgets run out of room.
void main() => runApp(WrapDemo());

class WrapDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyWrap(),
    );
  }
}

class MyWrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wrap Widget"),
      ),
      //Wrap Widget Usage
      body: Center(
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 20.0,
          runSpacing: 40.0,
          children: [
            childWidget("1"),
            childWidget("2"),
            childWidget("3"),
            childWidget("4"),
            childWidget("5"),
            childWidget("6"),
          ],
        ),
      ),
    );
  }

  Widget childWidget(String text) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: Colors.grey,
      child: Text(
        text,
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
