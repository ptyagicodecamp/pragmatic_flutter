import 'lib1.dart' deferred as lib1;

void main() {
  int num1 = 5;
  int num2 = 2;

  delayedInvocation(num1, num2);
}

Future delayedInvocation(int num1, int num2) async {
  //Loads lib1 here
  await lib1.loadLibrary();
  int sum = lib1.addition(num1, num2);
  print("Sum of $num1 and $num2 is $sum");
}
