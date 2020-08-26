// Future API - Error Handling

// Assume this function takes a long time to return in real-world.
String getExpansiveData() {
  return "I'm expansive data";
}

// Future with String data is being returned.
// This function returns the instance of
// Future and not the actual data.
Future<String> makeDataCall() async {
  var data = await getExpansiveData();
  throw Exception("Error occurred in making data call: $data");
}

// Entry point function
void main() {
  var theFuture = makeDataCall();

  //Error is caught and handled in catchError block
  theFuture.then((value) {
    print(value);
  }).catchError((error) {
    print(error);
  });
}
