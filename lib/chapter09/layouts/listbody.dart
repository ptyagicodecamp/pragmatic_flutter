import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'shared.dart';

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
      child: RaisedButton(
        child: Text('Alert Dialog'),
        onPressed: () => _showAlertDialog(context),
      ),
    );
  }

  Future<void> _showAlertDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Don't dismiss unless user taps button
      builder: (BuildContext context) {
        return alertDialog(
            context, 'Alert Dialog Title', 'Alert Dialog Content goes here');
      },
    );
  }
}
