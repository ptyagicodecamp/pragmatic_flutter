//This will generate a stream and return reference to it.
Stream<int> createNumberStream(int last) async* {
  for (int i = 1; i <= last; i++) {
    yield i; //to be able to send spaced out events
  }
}

//Demonstrating BroadcastStream `skipWhile()` method
void broadcastStreamSkipWhile() {
  var stream = createNumberStream(5);

  //Converting to broadcastStream
  var bStream = stream.asBroadcastStream();

  //skips elements which are positive and
  //less than 3, and prints rest.
  bStream
      .skipWhile((x) => x > 0 && x < 3)
      .listen((x) => print("skipWhile() : $x"));
}
//----END----//

//Entry point function
void main() {
  broadcastStreamSkipWhile();
}
