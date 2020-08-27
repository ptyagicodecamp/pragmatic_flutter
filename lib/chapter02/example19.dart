void main() {
  Map<int, String> theMap = {1: 'Dart'};
  theMap[2] = 'Flutter';

  //Adding int data type for String value will throw compile time error
  //Uncomment this line to see the compile-time error
  //theMap[3] = 3;

  print("Printing key:value pairs in Dart Map");
  //iterate over map and print all entries
  for (MapEntry mapEntry in theMap.entries) {
    print("${mapEntry.key} : ${mapEntry.value}");
  }
}
