//This will generate a stream and return reference to it.
Stream<int> createNumberStream(int last) async* {
  for (int i = 1; i <= last; i++) {
    yield i; //to be able to send spaced out events
  }
}

//Demonstrating BroadcastStream basic operations
void broadcastStreamBasicOperations() {
  var stream = createNumberStream(5);

  //Converting to broadcastStream
  var bStream = stream.asBroadcastStream();

  //Check if stream is broadcast stream or single
  if (bStream.isBroadcast) {
    print("Broadcast Stream");
  } else {
    print("Single Stream");
  }
  //Print the first number/event
  bStream.first.then((x) => print("First event: $x"));

  //Print the last number/event
  bStream.last.then((x) => print("Last event: $x"));

  //Print the length of the stream
  bStream.length.then((x) => print("Length of Stream: $x"));

  //Check if stream is empty
  bStream.isEmpty.then((x) => print("Is Empty : $x"));

  //Empty stream on purpose
  stream = createNumberStream(0);
  bStream = stream.asBroadcastStream();
  bStream.isEmpty.then((x) => print("Is Empty : $x"));
}
//----END----//

//Entry point function
void main() {
  broadcastStreamBasicOperations();
}
