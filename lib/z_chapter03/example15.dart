//This will generate a stream and return reference to it.
Stream<int> createNumberStreamWithException(int last) async* {
  for (int i = 1; i <= last; i++) {
    if (i == 5) {
      throw new Exception("Demo exception when accessing 5th number");
    }
    yield i; //to be able to send spaced out events
  }
}

//Example#1. Subscribing to Stream using `listen()` method
void subscribeUsingListen() {
  Stream stream = createNumberStreamWithException(5);

  stream.listen(
    (x) => print("number: $x"),
    onError: (err) => print("error: $err"),
    onDone: () => print("Done"),
  );
}
//----END----//

//Entry point function
void main() {
  //Run Example#1.
  subscribeUsingListen();
}
