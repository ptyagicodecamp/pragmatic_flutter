import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// AlertDialog Widget
void main() => runApp(AlertDialogDemo());

class AlertDialogDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAlertDialog(),
    );
  }
}

class MyAlertDialog extends StatefulWidget {
  MyAlertDialog({Key key}) : super(key: key);

  @override
  _MyAlertDialogState createState() => _MyAlertDialogState();
}

class _MyAlertDialogState extends State<MyAlertDialog> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AlertDialog"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              child: Text("Material"),
              onPressed: () {
                _showMaterialDialog(context);
              },
            ),
            ElevatedButton(
              child: Text("Cupertino"),
              onPressed: () {
                _showCupertinoDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMaterialDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Material"),
            content: Text("I'm Material AlertDialog Widget."),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Future<void> _showCupertinoDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("Cupertino"),
            content: Text("I'm Cupertino (iOS) AlertDialog Widget."),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        });
  }
}
