import 'lib1.dart' hide subtraction;

void main() {
  int num1 = 5;
  int num2 = 2;

  int sum = addition(num1, num2);
  print("Sum of $num1 and $num2 is $sum");

  //Compile-time error because subtraction() API is hidden
  //int difference = subtraction(num1, num2);
  //print("Difference of $num1 and $num2 is $difference");
}
