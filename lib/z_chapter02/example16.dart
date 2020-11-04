void main() {
  //using parameterized types with constructors
  List<int> theList = List<int>.from([1]);
  theList.add(2);
  theList.add(3);

  //Adding double data type will throw compile time error
  //theList.add(4.0);

  //iterate over list and print all items
  print("Printing items in Dart List");
  for (int item in theList) {
    print(item);
  }
}
