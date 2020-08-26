//This will return a reference to the stream
Stream<int> createNumberStream(int last) async* {
  for (int i = 1; i <= last; i++) {
    yield i; //to be able to send spaced out events
  }
}

//Printing numbers/events of Stream (Listening to Stream)
printStream(Stream stream) {
  stream.listen((s) => print(s));
}

void createStreamUsingGenerators() async {
  //Using `yield`, async* keywords
  var stream = createNumberStream(5);
  printStream(stream);
}
//----END----//

//Entry point function
void main() {
  //Run Example#1.
  createStreamUsingGenerators();
}
