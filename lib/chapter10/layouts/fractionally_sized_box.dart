import 'package:flutter/material.dart';

///Single Child layout widget
///
/// Use `widthFactor` and/or `heightFactor` properties to influence the size of the child widget.
/// Sizes its child to a fraction of total available space.
void main() => runApp(FractionallySizedBoxDemo());

class FractionallySizedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyFractionallySizedBox(),
    );
  }
}

class MyFractionallySizedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FractionallySizedBox Widget"),
      ),
      //FractionallySizedBox Widget Usage
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.center,
            widthFactor: 0.8,
            heightFactor: 0.2,
            child: RaisedButton(
              child: Text(
                "Tap",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
