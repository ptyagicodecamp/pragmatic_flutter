import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget materialAlertDialog(BuildContext context, String title, String content) {
  return AlertDialog(
    title: Text(title),
    content: Text(content),
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
}

//Cupertino(iOS style) AlertDialog Widget
Widget cupertinoAlertDialog(
    BuildContext context, String title, String content) {
  return CupertinoAlertDialog(
    title: Text(title),
    content: Text(content),
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
}
