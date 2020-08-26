//This will generate a stream and return a reference to it.
Stream<int> createNumberStream(int last) async* {
  for (int i = 1; i <= last; i++) {
    yield i; //to be able to send spaced out events
  }
}

//Demonstrating BroadcastStream `take()` method
void broadcastStreamTake() {
  var stream = createNumberStream(5);

  //Converting to broadcastStream
  var bStream = stream.asBroadcastStream();

  //Creates a sub stream of 2 elements and
  //listen on it
  bStream.take(2).listen(
        (x) => print("take() : $x"),
      );
}
//----END----//

//Entry point function
void main() {
  broadcastStreamTake();
}
