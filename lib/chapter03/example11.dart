//Accessing Stream using `await for`

void printStreamEventsUsingAwaitFor() async {
  Stream stream = Stream.fromIterable([1, 2, 3, 4, 5]);

  print("Stream Starting");
  await for (var num in stream) {
    print(num);
  }
  print("Stream Finished");
}
//----END----//

//Entry point function
void main() {
  printStreamEventsUsingAwaitFor();
}
