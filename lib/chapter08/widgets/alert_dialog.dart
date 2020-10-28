import 'package:flutter/material.dart';

import 'reusable_widgets.dart';

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
            RaisedButton(
              child: Text("Material"),
              onPressed: () {
                _showMaterialDialog(context);
              },
            ),
            RaisedButton(
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
          return materialAlertDialog(
              context, "Material", "I'm Material AlertDialog Widget.");
        });
  }

  Future<void> _showCupertinoDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return materialAlertDialog(
              context, "Cupertino", "I'm Cupertino (iOS) AlertDialog Widget.");
        });
  }
}
