import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(CardWidgetDemo());

class CardWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Card Widget Demo'),
          ),
          body: CardWidgetPage()),
    );
    ;
  }
}

class CardWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          image(),
          Text("Flutter Icon"),
        ],
      ),
    );
  }

  Widget image() {
    return Container(
      width: double.maxFinite,
      height: 220.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        image: DecorationImage(
          image: AssetImage("assets/flutter_icon.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
