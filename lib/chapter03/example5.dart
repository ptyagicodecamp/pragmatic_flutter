// Assume this function takes a long time to return in the real-world.
String getExpansiveData() {
  return "I'm expansive data";
}

//Future doesn't return anything
Future<void> makeDataCall() async {
  await getExpansiveData();
}

//Entry point function
void main() {
  var theFuture = makeDataCall();
  //then() uses underscore as unused argument.
  theFuture.then((_) {
    //_ is not used
    print("There's nothing to be printed here. Work is already done.");
  });
}
