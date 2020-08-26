import 'dart:async';

//This will generate a stream and return reference to it.
Stream<int> createNumberStream(int last) async* {
  for (int i = 1; i <= last; i++) {
    yield i; //to be able to send spaced out events
  }
}

//Demonstrating modifying a stream using `transform()` method
void modifyStreamUsingTransform() {
  //Stream of integer events is created.
  var stream = createNumberStream(5);

  //StreamTransformer prints the transformed event
  var transformer =
      StreamTransformer<int, String>.fromHandlers(handleData: (value, sink) {
    sink.add("My number is $value");
  });

  stream.transform(transformer).listen(
        (x) => print(x),
        onError: (err) => print("error: $err"),
        onDone: () => print("Done"),
      );
}
//----END----//

//Entry point function
void main() {
  modifyStreamUsingTransform();
}
