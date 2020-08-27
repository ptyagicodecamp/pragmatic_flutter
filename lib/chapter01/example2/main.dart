import 'lib1.dart';
import 'lib2.dart' as check;

void main() {
  int num1 = 5;
  int num2 = 2;

  int sum = addition(num1, num2);
  print("Sum of $num1 and $num2 is $sum");

  //Calls addition() from lib2
  sum = check.addition(num1, num2);
  print("Sum of $num1 and $num2 is $sum");
}
