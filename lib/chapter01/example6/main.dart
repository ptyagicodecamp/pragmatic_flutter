import 'lib1.dart';

void main() {
  int num1 = 5;
  int num2 = 2;

  //API from lib1.dart
  int sum = addition(num1, num2);
  print("Sum of $num1 and $num2 is $sum");

  //API from lib2.dart
  print("is number $num2 even? ${isNumberEven(num2)}");
}
