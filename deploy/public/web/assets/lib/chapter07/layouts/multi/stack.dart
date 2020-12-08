import 'package:flutter/material.dart';

/// Multi-child layout widget
/// Overlaps one widget over another.
void main() => runApp(StackDemo());

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStack(),
    );
  }
}

class MyStack extends StatefulWidget {
  @override
  _MyStackState createState() => _MyStackState();
}

class _MyStackState extends State<MyStack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack Widget"),
      ),
      body: Center(
        child: Stack(
          children: [
            childWidget(2),
            childWidget(1),
            childWidget(0),
          ],
        ),
      ),
    );
  }

  Widget childWidget(int index) {
    return Container(
      color: getColor(index),
      width: 200 + index * 20.toDouble(),
      height: 200 + index * 30.toDouble(),
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
