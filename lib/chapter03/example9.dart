//Creating Stream of numbers using  `Stream.fromIterable()` method

void createStreamFromIterable() {
  var numbers = [1, 2, 3, 4, 5];
  Stream stream = Stream.fromIterable(numbers);
  printStream(stream);
}

//Printing numbers/events of Stream (Listening to Stream)
printStream(Stream stream) {
  stream.listen((s) => print(s));
}
//----END----//

//Entry point function
void main() {
  //Run Example#2.
  createStreamFromIterable();
}
