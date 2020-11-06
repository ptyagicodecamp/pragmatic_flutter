import 'package:flutter/material.dart';

/// Multi-child layout widget
/// Stack that displays one child from its children.
void main() => runApp(IndexedStackDemo());

class IndexedStackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyIndexedStack(),
    );
  }
}

class MyIndexedStack extends StatefulWidget {
  @override
  _MyIndexedStackState createState() => _MyIndexedStackState();
}

class _MyIndexedStackState extends State<MyIndexedStack> {
  int _childIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IndexedStack Widget"),
      ),
      body: Center(
        child: IndexedStack(
          index: _childIndex,
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
    return GestureDetector(
      onTap: () {
        setState(() {
          index = index == 2 ? 0 : index + 1;
          _childIndex = index.clamp(0, 2);
        });
      },
      child: Container(
        color: getColor(index),
        width: 200 + index * 20.toDouble(),
        height: 200 + index * 30.toDouble(),
        child: Center(
          child: Text(
            "$index",
            style: TextStyle(fontSize: 40),
          ),
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
