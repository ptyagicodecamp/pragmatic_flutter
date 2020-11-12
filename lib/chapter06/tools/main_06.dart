import 'package:flutter/material.dart';

import 'router.dart' as router;

/// Chapter06: Flutter Widgets
void main() => runApp(FlutterWidgetsExamples());

class FlutterWidgetsExamples extends StatelessWidget {
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
