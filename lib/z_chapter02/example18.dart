void main() {
  Set<String> theSet = Set<String>.from({"1"});
  theSet.add("2");
  theSet.add("3");

  //Adding int data type will throw compile time error
  //Uncomment the line below to see the error
  //theSet.add(3);

  print("Printing items in Dart Set");
  //iterate over set and print all items
  for (String item in theSet) {
    print(item);
  }
}
