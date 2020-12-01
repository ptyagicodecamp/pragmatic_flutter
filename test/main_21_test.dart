import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pragmatic_flutter/chapter21/main_21.dart';

//Widget Testing: CounterApp
void main() {
  group("CounterApp-Widget Testing", () {
    testWidgets('Testing Label Text Widget (My Counter:)',
        (WidgetTester widgetTester) async {
      //Building Text widget using WidgetTester
      await widgetTester.pumpWidget(MyTextWidget(textString: 'My Counter:'));

      //Creating Finder to widget created
      final myCounterText = find.text('My Counter:');

      //Verifying widget using Matcher constant
      expect(myCounterText, findsOneWidget);
    });

    testWidgets('Testing Counter Text Widget for number 0',
        (WidgetTester widgetTester) async {
      //Creating Text widget
      await widgetTester.pumpWidget(MyTextWidget(textString: '0'));

      //Creating Finder to widget created
      final myCounterText = find.text('0');

      //Verifying widget using Matcher constant
      expect(myCounterText, findsOneWidget);
    });

    testWidgets('Finding widget by Key', (WidgetTester widgetTester) async {
      final widgetKey = Key('N');
      //Creating Text widget
      await widgetTester
          .pumpWidget(MyTextWidget(myKey: widgetKey, textString: '0'));

      //Creating Finder to widget created
      final myCounterText = find.byKey(widgetKey);

      //Verifying widget using Matcher constant
      expect(myCounterText, findsOneWidget);
    });

    testWidgets('Increment Number', (WidgetTester widgetTester) async {
      Widget testWidget = MediaQuery(
        data: MediaQueryData(),
        child: CounterApp(),
      );
      await widgetTester.pumpWidget(testWidget);

      //Tap increment Button (Green)
      await widgetTester.tap(
        find.byKey(Key('I')),
      );

      await widgetTester.pump();

      //Creating Finder to widget created
      final myCounterText = find.text('1');

      //Verifying widget using Matcher constant
      expect(myCounterText, findsOneWidget);
    });

    testWidgets('Decrement Number', (WidgetTester widgetTester) async {
      Widget testWidget =
          MediaQuery(data: MediaQueryData(), child: CounterApp());
      await widgetTester.pumpWidget(testWidget);

      //Tap decrement Button (Red)
      await widgetTester.tap(find.byKey(Key('D')));

      await widgetTester.pump();

      //Creating Finder to widget created
      final myCounterText = find.text('-1');

      //Verifying widget using Matcher constant
      expect(myCounterText, findsOneWidget);
    });

    testWidgets('Incrementing & Decrementing Number',
        (WidgetTester widgetTester) async {
      Widget testWidget =
          MediaQuery(data: MediaQueryData(), child: CounterApp());
      await widgetTester.pumpWidget(testWidget);

      //Tap increment Button (Green)
      await widgetTester.tap(find.byKey(Key('I')));

      await widgetTester.pump();

      //Tap increment Button (Red)
      await widgetTester.tap(find.byKey(Key('D')));

      await widgetTester.pump();

      //Creating Finder to widget created
      final myCounterText = find.text('0');

      //Verifying widget using Matcher constant
      expect(myCounterText, findsOneWidget);
    });
  });
}
