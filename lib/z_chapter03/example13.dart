//Generated Stream with numbers. Added exception on purpose for demonstration
Stream<int> createNumberStreamWithException(int last) async* {
  for (int i = 1; i <= last; i++) {
    if (i == 5) {
      throw new Exception("Demo exception when accessing 5th number");
    }
    yield i; //to be able to send spaced out events
  }
}

//Handle Error in Stream using `await for`
void handlingExceptionUsingAwaitFor() async {
  var stream = createNumberStreamWithException(5);
  try {
    await for (var num in stream) {
      print(num);
    }
  } catch (e) {
    print(e);
  }
  print("Finished");
}
//----END----//

//Entry point function
void main() {
  handlingExceptionUsingAwaitFor();
}
