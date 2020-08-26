Future<String> makeDataCall() async {
  return await getExpansiveData();
}

// Assume this function takes a long time to return in the real-world.
String getExpansiveData() {
  return "I'm expansive data";
}

//Entry point function
void main() {
  var theFuture = makeDataCall();

  //then() is called at the instance of Future
  theFuture.then((value) {
    print(value);
  });
}
