//Handling Exceptions (Code shared for listen and await for implementations)

//Generated Stream with numbers. Added exception on purpose for demonstration
Stream<int> createNumberStreamWithException(int last) async* {
  for (int i = 1; i <= last; i++) {
    if (i == 5) {
      throw new Exception("Demo exception when accessing 5th number");
    }
    yield i; //to be able to send spaced out events
  }
}

//Handle Error in Stream using `listen`
void handlingExceptionUsingListen() async {
  var stream = createNumberStreamWithException(5);
  stream.listen(
    (num) => print(num),
    onError: (e) => print(e),
    onDone: () => print("Finished"),
  );
}
//----END----//

//Entry point function
void main() {
  handlingExceptionUsingListen();
}
