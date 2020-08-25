//Integration Testing: CounterApp
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Integration Testing CounterApp:', () {
    final numberTextFinder = find.byValueKey('N');
    final incrementFinder = find.byValueKey('I');
    final decrementFinder = find.byValueKey('D');

    FlutterDriver flutterDriver;

    //connect to the instrumented app in test_driver/main_26.dart
    setUpAll(() async {
      flutterDriver = await FlutterDriver.connect();
    });

    //Close the connection between driver and instrumented app
    tearDownAll(() async {
      if (flutterDriver != null) {
        flutterDriver.close();
      }
    });

    test(' Increment & Decrement Counter', () async {
      //Tap increment counter
      await flutterDriver.tap(incrementFinder);

      //Verify if Number text becomes 1
      expect(await flutterDriver.getText(numberTextFinder), '1');

      //Tap decrement counter twice
      await flutterDriver.tap(decrementFinder);
      await flutterDriver.tap(decrementFinder);

      //Verify if Number text becomes -1
      expect(await flutterDriver.getText(numberTextFinder), '-1');
    });
  });
}
