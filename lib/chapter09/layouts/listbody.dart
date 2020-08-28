import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Demonstrating AlertDialog Widget
//void main() => runApp(AlertDialogDemo());

class AlertDialogDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('AlertDialog Demo'),
          ),
          body: AlertDialogPage()),
    );
    ;
  }
}

class AlertDialogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RaisedButton(
            child: Text('Material Alert Dialog'),
            onPressed: () => _showMaterialAlertDialog(context),
          ),
          RaisedButton(
            child: Text('Cupertino Alert Dialog'),
            onPressed: () => _showCupertinoAlertDialog(context),
          ),
        ],
      ),
    );
  }

  //Material AlertDialog Widget
  Future<void> _showMaterialAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Don't dismiss unless user taps button
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert Dialog Title'),
          content: Text('Alert Dialog Content goes here'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //Cupertino(iOS style) AlertDialog Widget
  Future<void> _showCupertinoAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Don't dismiss unless user taps button
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Alert Dialog Title'),
          content: Text('Alert Dialog Content goes here'),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            FlatButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
