import 'dart:collection';

void main() {
  //using parameterized types with constructors
  Queue<double> theQueue = Queue<double>.from([1.0]);
  theQueue.add(2.0);
  theQueue.add(3.0);

  //Adding String data type will throw compile time error
  //uncomment this line to see compilation error
  //theQueue.add("4.0");

  print("Printing items in Dart Queue");
  //iterate over queue and print all items
  for (double item in theQueue) {
    print(item);
  }
}
