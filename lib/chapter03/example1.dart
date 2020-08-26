// Expensive function could be a function that takes
// long time to process data and return results.
// Assume this function takes long time to return in real-world
String getExpansiveData() {
  return "I'm expansive data";
}

// This is the asynchronous function that makes the expensive
// data call and prints the results.
Future<void> makeDataCall() async {
  var data = await getExpansiveData();
  print(data);
}
//----END----//

//Entry point function
void main() {
  makeDataCall();
}
