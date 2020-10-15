import 'package:flutter/material.dart';

/// Multi-child layout widget
/// Builds widgets dynamically as per the constraint passed by the parent.
void main() => runApp(LayoutBuilderDemo());

class LayoutBuilderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyLayoutBuilder(),
    );
  }
}

class MyLayoutBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LayoutBuilder Widget"),
      ),
      //LayoutBuilder Widget Usage
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 400) {
          return largeScreen();
        } else {
          return smallScreen();
        }
      }),
    );
  }

  /// Show containers in Column
  Widget smallScreen() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          width: 250,
          height: 250,
          child: Image.asset(
            "assets/flutter_icon.png",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          width: 250,
          height: 250,
          child: Image.asset(
            "assets/flutter_icon.png",
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  /// Show containers in Row
  Widget largeScreen() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          width: 250,
          height: 250,
          child: Image.asset(
            "assets/flutter_icon.png",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          width: 250,
          height: 250,
          child: Image.asset(
            "assets/flutter_icon.png",
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
