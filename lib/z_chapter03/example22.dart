//This will generate a stream and return reference to it.
Stream<int> createNumberStream(int last) async* {
  for (int i = 1; i <= last; i++) {
    yield i; //to be able to send spaced out events
  }
}

//Demonstrating BroadcastStream `takeWhile()` method
void broadcastStreamTakeWhile() {
  var stream = createNumberStream(5);

  //Converting to broadcastStream
  var bStream = stream.asBroadcastStream();

  //Creates a sub-stream of items less than 3, and prints the sub-stream of [1,2].
  bStream.takeWhile((x) => x > 0 && x < 3).listen(
        (x) => print("takeWhile() : $x"),
      );
}
//----END----//

//Entry point function
void main() {
  broadcastStreamTakeWhile();
}
