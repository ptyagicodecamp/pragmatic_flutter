import 'lib1.dart';
import 'lib2.dart' as check; //Using prefix for lib2

void main() {
  int num1 = 5;
  int num2 = 2;

  int sum = addition(num1, num2);
  print("Sum of $num1 and $num2 is $sum");

  //Using check to access the API
  print("is number $num2 even? ${check.isNumberEven(num2)}");
}
