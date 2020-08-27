import 'lib1.dart' show subtraction;

void main() {
  int num1 = 5;
  int num2 = 2;

  //Compile-time error because addition is no longer visible
  //int sum = addition(num1, num2);

  int difference = subtraction(num1, num2);
  print("Difference of $num1 and $num2 is $difference");
}
