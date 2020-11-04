void main() {
  // Using `var` keyword
  var data = 1;
  //Re-assigning the same variable to a different data type gives
  //compile-time error
  //data = "1";
  print(data.runtimeType);

  // Using `dynamic` keyword
  dynamic dynamicData = 1;

  // Prints `int` as data type on console
  print(dynamicData.runtimeType);

  dynamicData = "I'm a string now";

  // Prints `String` as data type on console
  print(dynamicData.runtimeType);
}
