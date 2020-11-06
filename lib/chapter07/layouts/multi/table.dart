import 'package:flutter/material.dart';

/// Multi-child layout widget
/// Arranges children in tabular layout.
void main() => runApp(TableDemo());

class TableDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyTable(),
    );
  }
}

class MyTable extends StatefulWidget {
  @override
  _MyTableState createState() => _MyTableState();
}

class _MyTableState extends State<MyTable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Table Widget"),
      ),
      body: Table(
        border: TableBorder.all(width: 2.0),
        columnWidths: {
          0: FractionColumnWidth(.5),
          1: FractionColumnWidth(.5),
        },
        children: [
          TableRow(
            children: [
              childWidget(0),
              childWidget(1),
            ],
          ),
          TableRow(
            children: [
              childWidget(2),
              childWidget(3),
            ],
          ),
        ],
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
