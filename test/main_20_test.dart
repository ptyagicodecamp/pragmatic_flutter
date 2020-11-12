import 'package:pragmatic_flutter/chapter20/main_20.dart';
import 'package:test/test.dart';

//Unit Testing: CounterApp
void main() {
  group('CounterApp-Unit Tests', () {
    test('Default Number is 0', () {
      final counter = Counter();
      expect(counter.number, 0);
    });

    test('Increment number by 1', () {
      final counter = Counter();
      counter.increment();
      expect(counter.number, 1);
    });

    test('Decrement number by 1', () {
      final counter = Counter();
      counter.decrement();
      expect(counter.number, -1);
    });

    test('Increment & Decrement number by 1', () {
      final counter = Counter();
      counter.increment();
      expect(counter.number, 1);

      counter.decrement();
      expect(counter.number, 0);
    });
  });
}
