//Instrumented CounterApp

import 'package:flutter_driver/driver_extension.dart';

import '../lib/chapter26/main_26.dart' as app;

void main() {
  enableFlutterDriverExtension();

  //App to be instrumented
  app.main();
}
