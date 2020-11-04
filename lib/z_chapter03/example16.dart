//This will generate a stream and return reference to it.
Stream<int> createNumberStreamWithException(int last) async* {
  for (int i = 1; i <= last; i++) {
    if (i == 5) {
      throw new Exception("Demo exception when accessing 5th number");
    }
    yield i; //to be able to send spaced out events
  }
}

//Subscribing to Stream using subscription handler
void subscribeUsingSubscriptionHandler() {
  Stream stream = createNumberStreamWithException(5);

  var subscription = stream.listen(null);
  subscription.onData((x) => print("number $x"));
  subscription.onError((err) => print("error: $err"));
  subscription.onDone(() => print("Done"));
}
//----END----//

//Entry point function
void main() {
  subscribeUsingSubscriptionHandler();
}
