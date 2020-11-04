//This will generate a stream and return reference to it.
Stream<int> createNumberStream(int last) async* {
  for (int i = 1; i <= last; i++) {
    yield i; //to be able to send spaced out events
  }
}

//Demonstrating usage of `first`
void first() {
  var stream = createNumberStream(5);

  //print the first number/event
  stream.first.then(
    (x) => print("First event: $x"),
  );
}

//Demonstrating usage of `last`
void last() {
  //A fresh stream is needed.
  //Single subscription stream can't be re-listened.
  var stream = createNumberStream(5);
  //print the last number/event
  stream.last.then((x) => print("Last event: $x"));
}

//Demonstrating usage of `length`
void length() {
  var stream = createNumberStream(5);
  //print the length of the stream
  stream.length.then((x) => print("Length of Stream: $x"));
}

//Demonstrating usage of `isEmpty`
void isEmpty() {
  var stream = createNumberStream(5);
  //Check if stream is empty
  stream.isEmpty.then((x) => print("Is Empty : $x"));

  //Create an empty stream
  stream = createNumberStream(0);
  //Verify an empty stream
  stream.isEmpty.then((x) => print("Is Empty : $x"));
}

//Entry point function
void main() {
  //first Property
  first();

  //last Property
  last();

  //length Property
  length();

  //isEmpty Property
  isEmpty();
}
