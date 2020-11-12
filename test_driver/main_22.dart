//Instrumented CounterApp

import 'package:flutter_driver/driver_extension.dart';

import '../lib/chapter22/main_22.dart' as app;

void main() {
  enableFlutterDriverExtension();

  //App to be instrumented
  app.main();
}
