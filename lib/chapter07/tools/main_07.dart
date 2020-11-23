import 'package:flutter/material.dart';

import 'router.dart' as router;

/// Chapter07: Building Layouts
///
void main() => runApp(FlutterLayoutsExamples());

class FlutterLayoutsExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: router.generateRoute,
      initialRoute: '/',
    );
  }
}